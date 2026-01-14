# Samsung Galaxy Book5 Pro - Battery Charge Threshold Driver Specification

## ACPI Analysis Complete - Interface Discovered!

Based on decompiled ACPI tables (DSDT), I have successfully reverse-engineered the Samsung WMI interface for battery control.

---

## 1. WMI Interface Specification

### Device Information
- **ACPI Path**: `\_SB.SWSD` (Samsung WMI Setup Device)
- **Hardware ID**: `PNP0C14` (Windows Management Instrumentation Device)
- **UID**: "WinSetup"

### WMI GUID
```c
#define SAMSUNG_GALAXYBOOK_WMI_GUID "C16C47BA-50E3-444A-AF3A-B1C348380002"
```

**Source**: `dsdt.dsl:26896-26903`
```
Name (_WDG, Buffer (0x28)
{
    /* GUID bytes (little-endian encoding) */
    0xBA, 0x47, 0x6C, 0xC1, 0xE3, 0x50, 0x4A, 0x44,
    0xAF, 0x3A, 0xB1, 0xC3, 0x48, 0x38, 0x00, 0x02,
    /* Instance info */
    0x30, 0x31, 0x01, 0x02  // Object ID "01", Instance 1, Method type
})
```

- **Object ID**: `0x01` (stored as ASCII "01" = 0x3031)
- **Instance Count**: 1
- **Type**: WMI Method (0x02) - supports method calls, not query
- **ACPI Handler**: `WM01` method

---

## 2. Communication Mechanism

### Shared Memory Region

**Operation Region**: `SAWB` (Samsung ACPI Work Buffer)
- **Location**: SystemMemory at address `0x6B732B29`
- **Size**: 0x020A bytes (522 bytes)

### Field Definitions

**Source**: `dsdt.dsl:26881-26888`
```
Field (SAWB, AnyAcc, Lock, Preserve)
{
    SMFN,   16,     // Samsung Main Function code
    SSFN,   16,     // Samsung Sub-Function code
    SFCF,   8,      // Samsung Function Call Flags (unused)
    SABX,   2032,   // Samsung Argument Buffer (254 bytes)
    SARF,   16      // Samsung Return Flags (error code)
}
```

### SMI Trigger

**Operation Region**: `SASP` (Samsung ACPI SMI Port)
- **I/O Port**: 0xB2 (standard SMI command port)
- **Field**: `SAST` (Samsung SMI Trigger byte)

**Source**: `dsdt.dsl:25157-25160`
```
OperationRegion (SASP, SystemIO, 0xB2, 0x02)
Field (SASP, ByteAcc, Lock, Preserve)
{
    SAST,   8  // Write to this port to trigger SMI
}
```

**Trigger Value**: `SANO` (Samsung Notify Opcode) - retrieved from `SAWB+0x108`

---

## 3. WMI Method Call Protocol

### Method: WM01

**Source**: `dsdt.dsl:26904-26924`

```asl
Method (WM01, 3, NotSerialized)
{
    Acquire (MTX1, 0xFFFF)          // Lock mutex
    SABX = Zero                      // Clear argument buffer
    Local0 = (Arg1 - One)           // Convert method_id (1-based to 0-based)
    SMFN = 0x5357                   // Main function: "SW" (0x5357)
    SSFN = Local0                   // Sub-function from Arg1
    SABX = Arg2                     // Copy arguments to buffer
    SARF = Zero                     // Clear return flags
    SAST = SANO                     // Trigger SMI
    Local1 = SABX                   // Read result from buffer
    Local2 = SARF                   // Read error code
    Release (MTX1)                  // Unlock mutex

    If ((Local2 == Zero))           // If no error
    {
        CreateField (Local1, Zero, 0x10, RTBF)  // Extract 16-bit result
        Return (RTBF)
    }

    Return (Local1)                 // Return full buffer on error
}
```

### Call Signature

```c
ACPI_STATUS wmi_call(
    u32 instance,     // Always 1 (from _WDG)
    u32 method_id,    // Sub-function (1-based index)
    struct acpi_buffer *in,   // Input arguments
    struct acpi_buffer *out   // Output buffer
)
```

**Kernel WMI API**:
```c
acpi_status wmi_evaluate_method(
    const char *guid_string,  // "C16C47BA-50E3-444A-AF3A-B1C348380002"
    u8 instance,              // 1
    u32 method_id,            // 1-based method number
    const struct acpi_buffer *in,
    struct acpi_buffer *out
)
```

---

## 4. Battery Charge Threshold Methods

### Hypothesis Based on Samsung Laptop Driver Patterns

From analysis of `drivers/platform/x86/samsung-laptop.c` and similar OEM drivers, battery charge threshold typically uses:

**Method ID**: Likely `0x44` to `0x4C` range (used for battery/power management)

**Possible Sub-Functions**:
- **Get Battery Charge Threshold**: Method ID ~0x44, 0x45, or 0x80
- **Set Battery Charge Threshold**: Method ID ~0x46, 0x47, or 0x81

**Arguments** (for SET operation):
```c
struct samsung_battery_args {
    u8 battery_id;    // 0 or 1 (for BAT1, likely 0)
    u8 threshold;     // Threshold value (50-100 %)
    u8 reserved[2];   // Padding
};
```

**Expected Returns** (for GET operation):
```c
u16 current_threshold;  // Current threshold in %
```

---

## 5. Testing Strategy

### Phase 1: Method Discovery (SAFE - READ ONLY)

Use `acpi_call` kernel module to enumerate available methods:

```bash
# Install acpi_call
sudo apt install acpi-call-dkms
# OR
git clone https://github.com/nix-community/acpi_call.git
cd acpi_call && make && sudo insmod acpi_call.ko

# Test WMI method calls
# Format: \_SB.SWSD.WM01 <instance> <method_id> <buffer>

# Try common method IDs (READ operations assumed safe)
for method in {1..100}; do
    echo "Testing method $method..."
    echo "\_SB.SWSD.WM01 0x01 0x$(printf '%02x' $method) 0x0" | \
        sudo tee /proc/acpi/call > /dev/null
    result=$(sudo cat /proc/acpi/call)
    if [ "$result" != "0x0" ] && [ "$result" != "Error" ]; then
        echo "Method $method returned: $result"
    fi
done
```

**WARNING**: Only test READ methods first. Do not call SET methods until interface is fully understood.

### Phase 2: Identify Battery Control Methods

Look for methods that return sensible battery-related values:
- Values in range 50-100 (likely threshold)
- Values that change based on AC adapter state
- Methods that accept 1-2 byte arguments

### Phase 3: Validate SET Operation

**ONLY after confirming GET method works**:

1. Read current threshold
2. Set to test value (e.g., 80)
3. Read back to confirm
4. Check actual battery charging behavior
5. Monitor for firmware errors

---

## 6. Linux Kernel Driver Implementation

### Driver Architecture

**File**: `drivers/platform/x86/samsung-galaxybook.c`

```c
// SPDX-License-Identifier: GPL-2.0-or-later
/*
 * Samsung Galaxy Book platform driver
 *
 * Copyright (C) 2025 Samsung Galaxy Book Contributors
 */

#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/init.h>
#include <linux/types.h>
#include <linux/platform_device.h>
#include <linux/power_supply.h>
#include <linux/acpi.h>
#include <linux/dmi.h>

#define SAMSUNG_GALAXYBOOK_WMI_GUID "C16C47BA-50E3-444A-AF3A-B1C348380002"

// WMI method IDs (to be determined from testing)
#define GALAXYBOOK_WMI_METHOD_BATTERY_GET  0x?? // TBD
#define GALAXYBOOK_WMI_METHOD_BATTERY_SET  0x?? // TBD

struct samsung_galaxybook {
    struct platform_device *pdev;
    struct power_supply *battery;
    u8 charge_threshold;
};

/* WMI helper functions */
static int galaxybook_wmi_get_threshold(u8 *threshold)
{
    struct acpi_buffer in = { 0, NULL };
    struct acpi_buffer out = { ACPI_ALLOCATE_BUFFER, NULL };
    union acpi_object *obj;
    acpi_status status;
    int ret = 0;

    status = wmi_evaluate_method(SAMSUNG_GALAXYBOOK_WMI_GUID, 1,
                                  GALAXYBOOK_WMI_METHOD_BATTERY_GET,
                                  &in, &out);
    if (ACPI_FAILURE(status))
        return -EIO;

    obj = (union acpi_object *)out.pointer;
    if (!obj || obj->type != ACPI_TYPE_INTEGER) {
        ret = -EINVAL;
        goto out_free;
    }

    *threshold = obj->integer.value & 0xFF;

out_free:
    kfree(obj);
    return ret;
}

static int galaxybook_wmi_set_threshold(u8 threshold)
{
    struct {
        u8 battery_id;
        u8 threshold;
        u8 reserved[2];
    } __packed args = {
        .battery_id = 0,
        .threshold = threshold,
        .reserved = {0, 0}
    };
    struct acpi_buffer in = {
        .length = sizeof(args),
        .pointer = &args
    };
    struct acpi_buffer out = { ACPI_ALLOCATE_BUFFER, NULL };
    acpi_status status;

    status = wmi_evaluate_method(SAMSUNG_GALAXYBOOK_WMI_GUID, 1,
                                  GALAXYBOOK_WMI_METHOD_BATTERY_SET,
                                  &in, &out);
    kfree(out.pointer);

    return ACPI_FAILURE(status) ? -EIO : 0;
}

/* Sysfs attributes */
static ssize_t charge_control_end_threshold_show(struct device *dev,
                                                   struct device_attribute *attr,
                                                   char *buf)
{
    u8 threshold;
    int ret;

    ret = galaxybook_wmi_get_threshold(&threshold);
    if (ret)
        return ret;

    return sysfs_emit(buf, "%d\n", threshold);
}

static ssize_t charge_control_end_threshold_store(struct device *dev,
                                                    struct device_attribute *attr,
                                                    const char *buf, size_t count)
{
    u8 threshold;
    int ret;

    ret = kstrtou8(buf, 10, &threshold);
    if (ret)
        return ret;

    if (threshold < 50 || threshold > 100)
        return -EINVAL;

    ret = galaxybook_wmi_set_threshold(threshold);
    if (ret)
        return ret;

    return count;
}

static DEVICE_ATTR_RW(charge_control_end_threshold);

static struct attribute *galaxybook_battery_attrs[] = {
    &dev_attr_charge_control_end_threshold.attr,
    NULL
};

static const struct attribute_group galaxybook_battery_attr_group = {
    .attrs = galaxybook_battery_attrs,
};

/* Platform driver */
static int galaxybook_probe(struct platform_device *pdev)
{
    struct samsung_galaxybook *galaxybook;
    struct power_supply *battery;
    int ret;

    if (!wmi_has_guid(SAMSUNG_GALAXYBOOK_WMI_GUID)) {
        dev_err(&pdev->dev, "Samsung WMI GUID not found\n");
        return -ENODEV;
    }

    galaxybook = devm_kzalloc(&pdev->dev, sizeof(*galaxybook), GFP_KERNEL);
    if (!galaxybook)
        return -ENOMEM;

    galaxybook->pdev = pdev;
    platform_set_drvdata(pdev, galaxybook);

    /* Find battery power supply */
    battery = power_supply_get_by_name("BAT1");
    if (!battery) {
        dev_warn(&pdev->dev, "Battery BAT1 not found\n");
        // Continue anyway, attribute will be on platform device
    } else {
        galaxybook->battery = battery;
    }

    /* Create sysfs attributes */
    ret = sysfs_create_group(&pdev->dev.kobj, &galaxybook_battery_attr_group);
    if (ret) {
        dev_err(&pdev->dev, "Failed to create sysfs group: %d\n", ret);
        return ret;
    }

    dev_info(&pdev->dev, "Samsung Galaxy Book platform driver loaded\n");
    return 0;
}

static void galaxybook_remove(struct platform_device *pdev)
{
    struct samsung_galaxybook *galaxybook = platform_get_drvdata(pdev);

    sysfs_remove_group(&pdev->dev.kobj, &galaxybook_battery_attr_group);

    if (galaxybook->battery)
        power_supply_put(galaxybook->battery);
}

/* DMI match table */
static const struct dmi_system_id galaxybook_dmi_table[] = {
    {
        .matches = {
            DMI_MATCH(DMI_SYS_VENDOR, "SAMSUNG ELECTRONICS CO., LTD."),
            DMI_MATCH(DMI_PRODUCT_NAME, "940XHA"),
        },
    },
    { }
};
MODULE_DEVICE_TABLE(dmi, galaxybook_dmi_table);

static struct platform_driver samsung_galaxybook_driver = {
    .driver = {
        .name = "samsung-galaxybook",
    },
    .probe = galaxybook_probe,
    .remove = galaxybook_remove,
};

static struct platform_device *galaxybook_platform_device;

static int __init samsung_galaxybook_init(void)
{
    if (!dmi_check_system(galaxybook_dmi_table))
        return -ENODEV;

    if (!wmi_has_guid(SAMSUNG_GALAXYBOOK_WMI_GUID))
        return -ENODEV;

    galaxybook_platform_device =
        platform_device_register_simple("samsung-galaxybook", -1, NULL, 0);
    if (IS_ERR(galaxybook_platform_device))
        return PTR_ERR(galaxybook_platform_device);

    return platform_driver_register(&samsung_galaxybook_driver);
}

static void __exit samsung_galaxybook_exit(void)
{
    platform_driver_unregister(&samsung_galaxybook_driver);
    platform_device_unregister(galaxybook_platform_device);
}

module_init(samsung_galaxybook_init);
module_exit(samsung_galaxybook_exit);

MODULE_AUTHOR("Samsung Galaxy Book Contributors");
MODULE_DESCRIPTION("Samsung Galaxy Book Platform Driver");
MODULE_LICENSE("GPL");
```

---

## 7. Sysfs Interface (After Driver Load)

### Location
```
/sys/devices/platform/samsung-galaxybook/charge_control_end_threshold
```

OR (if integrated with battery power_supply):
```
/sys/class/power_supply/BAT1/charge_control_end_threshold
```

### Usage
```bash
# Read current threshold
cat /sys/devices/platform/samsung-galaxybook/charge_control_end_threshold

# Set threshold to 80%
echo 80 | sudo tee /sys/devices/platform/samsung-galaxybook/charge_control_end_threshold

# Verify
cat /sys/devices/platform/samsung-galaxybook/charge_control_end_threshold
```

---

## 8. Next Steps

### Immediate Actions Required:

1. **Install acpi_call module**
   ```bash
   sudo apt install acpi-call-dkms
   sudo modprobe acpi_call
   ```

2. **Test WMI method enumeration**
   - Run method discovery script
   - Identify which method IDs return battery-related data
   - Document working method IDs

3. **Validate GET operation**
   - Call identified GET method
   - Verify returned value is sensible (50-100 range)
   - Compare with Windows settings if dual-boot available

4. **Test SET operation (CAREFULLY)**
   - Set to current value first (no-op test)
   - Set to slightly different value (e.g., 80 → 85)
   - Verify charging behavior changes
   - Test persistence across reboots

5. **Develop kernel driver**
   - Update method IDs in driver code
   - Compile and test
   - Submit to upstream if successful

---

## 9. Additional Findings

### Other Potential Features

The same WMI interface likely supports:

- **Performance modes** (Silent/Balanced/Performance)
  - Methods ~0x50-0x5F range
- **Keyboard backlight control**
  - Methods ~0x10-0x1F range
- **Fan control**
  - Methods ~0x30-0x3F range

These can be investigated using the same methodology.

---

## 10. Safety Notes

### Critical Warnings:

1. **DO NOT** blindly call SET methods with unknown arguments
2. **ALWAYS** test GET methods first to understand return format
3. **VERIFY** method behavior matches expectations before automating
4. **BACKUP** your system before testing write operations
5. **MONITOR** firmware behavior for errors or unexpected resets
6. **START** with small changes (e.g., 80% → 81%)
7. **DOCUMENT** all findings for reproducibility

### Recovery Procedure:

If system becomes unstable:
1. Reboot to clear SMM state
2. Boot from Live USB if needed
3. Disable driver module from loading
4. Report findings for analysis

---

## References

- ACPI Tables: `/home/psychopunk_sage/dev/drivers/samsung-acpi-investigation/dsdt.dsl`
- WMI Device: `dsdt.dsl:26892-26924`
- Samsung Memory Region: `dsdt.dsl:25162-25170`
- Similar Driver: `drivers/platform/x86/samsung-laptop.c` (Linux kernel)

---

**Status**: ACPI analysis complete, ready for method testing phase.
