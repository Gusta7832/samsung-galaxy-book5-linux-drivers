# Debugging Guide

This guide covers how to diagnose issues with the Samsung Galaxy Book driver.

## Quick Diagnostics

```bash
# Check if driver is loaded
lsmod | grep samsung_galaxybook

# View driver status
make status

# Check kernel messages
sudo dmesg | grep -i samsung
```

## Common Issues

### Issue: Driver fails to load

**Symptoms**: `insmod` returns error, module not in `lsmod`

**Debug steps**:
```bash
# Check for missing dependencies
sudo modprobe platform_profile

# Try loading with verbose output
sudo insmod samsung-galaxybook.ko
sudo dmesg | tail -20

# Check if ACPI device exists
ls /sys/bus/acpi/devices/SAM0430:00/
```

**Common causes**:
- Missing `platform_profile` module
- ACPI device not present (unsupported laptop)
- Symbol version mismatch (rebuild driver)

### Issue: Battery threshold not appearing

**Symptoms**: No `/sys/class/power_supply/BAT1/charge_control_end_threshold`

**Debug steps**:
```bash
# Check if battery hook registered
sudo dmesg | grep -i "battery"

# List power supply attributes
ls /sys/class/power_supply/BAT1/

# Check ACPI battery status
cat /sys/class/power_supply/BAT1/status
```

### Issue: Keyboard backlight not working

**Symptoms**: No `/sys/class/leds/samsung-galaxybook::kbd_backlight/`

**Debug steps**:
```bash
# Check LED devices
ls /sys/class/leds/

# Check driver detection
sudo dmesg | grep -i "kbd_backlight"
```

### Issue: Fn+F9 doesn't cycle backlight

**Symptoms**: Pressing Fn+F9 does nothing

**Debug steps**:
```bash
# Check if ACPI event is received
sudo dmesg -w
# Press Fn+F9, look for:
# samsung-galaxybook SAM0430:00: unknown ACPI notification event: 0x7d

# Check ACPI events directly
sudo acpi_listen
# Press Fn+F9
```

**If "unknown ACPI notification event: 0x7d" appears**:
The driver needs a patch to handle this event. See [Adding Hotkey Support](#adding-hotkey-support).

## Advanced Debugging

### Tracing ACPI Calls

```bash
# Enable ACPI method tracing
echo 1 | sudo tee /sys/module/acpi/parameters/aml_debug_output

# Watch ACPI calls
sudo dmesg -w
```

### Checking Keyboard Scancodes

For hotkeys that don't generate ACPI events:

```bash
# Check raw scancodes (run from TTY, not X)
sudo showkey -s
# Press the Fn key combination

# Check input events
sudo evtest /dev/input/event2  # keyboard device
```

### Monitoring Power Supply Changes

```bash
# Watch battery attribute changes
watch -n 1 cat /sys/class/power_supply/BAT1/charge_control_end_threshold

# Monitor udev events
sudo udevadm monitor --property --udev --kernel
```

## Adding Hotkey Support

If a Fn key generates an ACPI event but isn't handled:

1. Identify the event code:
```bash
sudo dmesg -w | grep "unknown ACPI notification"
# Press Fn+key, note the hex code (e.g., 0x7d)
```

2. Find the notify handler in `samsung-galaxybook.c`:
```c
static void galaxybook_acpi_notify(acpi_handle handle, u32 event, void *data)
```

3. Add a case for the event:
```c
case 0x7d:  /* Keyboard backlight - Fn+F9 */
    schedule_work(&galaxybook->kbd_backlight_hotkey_work);
    break;
```

4. Rebuild and reload:
```bash
make clean && make
sudo rmmod samsung_galaxybook
sudo insmod samsung-galaxybook.ko
```

## Reporting Issues

When reporting issues, include:

```bash
# System info
uname -a
cat /etc/os-release

# ACPI device info
cat /sys/bus/acpi/devices/SAM0430:00/status
cat /sys/bus/acpi/devices/SAM0430:00/path

# Driver messages
sudo dmesg | grep -i samsung

# Module info
modinfo samsung-galaxybook.ko
```
