# Samsung Galaxy Book5 Pro (940XHA) - WMI Analysis

## System Identification

**Model**: 940XHA
**Vendor**: SAMSUNG ELECTRONICS CO., LTD.
**Board Name**: NP940XHA-LG3IN
**Battery**: SR Real Battery (SAMSUNG Electronics)

## WMI Devices Detected

### CRITICAL SAMSUNG-SPECIFIC GUIDs FOUND:

#### 1. C16C47BA-50E3-444A-AF3A-B1C348380002
**Status**: FOUND
**Purpose**: Samsung Settings / Platform Control (KNOWN SAMSUNG GUID)
**Attributes**:
- object_id: 01
- instance_count: 1
- setable: 0 (read-only or method-based)

**Analysis**: This is a well-known Samsung WMI GUID used across multiple Samsung laptop models for platform control. This is likely the PRIMARY interface for battery charge threshold control.

**Reference**: Used in older samsung-laptop driver for similar functionality.

#### 2. A6FEA33E-DABF-46F5-BFC8-460D961BEC9F
**Status**: FOUND
**Purpose**: Samsung Platform Driver / Notifications (KNOWN SAMSUNG GUID)
**Attributes**:
- notify_id: D0
- instance_count: 1
- expensive: 0

**Analysis**: This GUID has a notify_id, indicating it's an event-based WMI device. Likely used for:
- Hotkey events (Fn keys)
- Battery status change notifications
- AC adapter plug/unplug events

### Other WMI Devices:

#### 3. 05901221-D566-11D1-B2F0-00A0C9062910 (3 instances)
**Purpose**: Intel ACPI WMI (standard)
**Note**: Standard Intel platform GUID, not Samsung-specific

#### 4. 1F13AB7F-6220-4210-8F8E-8BB5E71EE969
**Purpose**: Unknown (possibly Intel IPU camera control)

#### 5. 2BC49DEF-7B15-4F05-8BB7-EE37B9547C0B
**Purpose**: Unknown

## Battery Status

**Current State**:
- Capacity: 88%
- Status: Discharging
- Cycle Count: 193
- Technology: Li-ion
- Charge Full: 4000 mAh (design: 4023 mAh)
- Voltage: 16.619V (design min: 15.44V)
- Current Draw: 256 mA (4.25W)

**CRITICAL FINDING**:
**NO charge_control_end_threshold attribute exists** in /sys/class/power_supply/BAT1/

This confirms that the kernel has no driver currently controlling the battery charge threshold.

## Next Steps for Battery Charge Threshold

### Phase 1: ACPI Table Analysis (PENDING - REQUIRES USER ACTION)

You need to extract ACPI tables by running:

```bash
sudo apt install -y acpica-tools
cd ~/dev/drivers/samsung-acpi-investigation
sudo acpidump > acpidump.dat
acpixtract -a acpidump.dat
iasl -d *.dat
ls -lh *.dsl
```

Once you provide the DSDT.dsl file, I will search for:

1. **WMI Method Mappings**:
   - Search for GUID C16C47BA-50E3-444A-AF3A-B1C348380002 in DSDT
   - Identify the WMI method IDs and arguments
   - Reverse-engineer the battery control protocol

2. **EC Device Path**:
   - Locate \_SB.PCI0.LPCB.EC0 or similar
   - Map EC operation regions (ECOR, ERAM, etc.)
   - Identify battery-related EC registers

3. **ACPI Methods**:
   - Look for methods like GBAT (Get Battery), SBAT (Set Battery)
   - Analyze _BST (Battery Status), _BIF (Battery Information)
   - Find charge threshold control methods

### Phase 2: Safe Method Testing

Once ACPI tables are analyzed, we will use the `acpi_call` kernel module to:

1. Test READ methods first (safe, no risk)
2. Validate that we can read the current charge threshold
3. Test WRITE methods in a controlled manner
4. Document the exact protocol

### Phase 3: Kernel Driver Development

Based on findings, I will write one of:

**Option A: WMI-based driver** (most likely for Samsung)
```c
// Use C16C47BA-50E3-444A-AF3A-B1C348380002
// Call wmi_evaluate_method() with specific method ID
```

**Option B: ACPI method-based driver**
```c
// Use acpi_execute_simple_method() to call SBAT or similar
```

**Option C: Direct EC driver** (if methods are just wrappers)
```c
// Use ec_read/ec_write to specific register addresses
```

## Reference: Known Samsung WMI Method Structure

From older Samsung laptops (samsung-laptop.c driver), the WMI interface typically uses:

**GUID**: C16C47BA-50E3-444A-AF3A-B1C348380002

**Method Signature**:
```
ACPI Method Call:
  Arg0: Function/Feature ID (e.g., 0x80 for battery)
  Arg1: Sub-function (e.g., 0x01 = get, 0x02 = set)
  Arg2: Value (for set operations)

Returns:
  Package or Integer with result
```

**Example Battery Control**:
- Get threshold: WMI_METHOD(0x80, 0x01, 0)
- Set threshold to 80%: WMI_METHOD(0x80, 0x02, 80)

**NOTE**: The exact method IDs need to be confirmed from DSDT analysis.

## Recommended Action

**IMMEDIATE**: Extract ACPI tables using the commands above.

Once you provide DSDT.dsl, I will:
1. Identify the exact WMI method structure
2. Locate the battery charge threshold interface
3. Provide a safe testing procedure
4. Develop a kernel driver or userspace tool

**Estimated Time to Working Driver**: 1-3 days after ACPI table analysis.
