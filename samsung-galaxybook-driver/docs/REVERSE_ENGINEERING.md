# Reverse Engineering Guide

This document describes how the Samsung Galaxy Book ACPI interface was reverse-engineered.

## Overview

Samsung Galaxy Book laptops use a proprietary ACPI interface to control hardware features like battery charging, keyboard backlight, and performance modes. This interface is accessed by Samsung Settings on Windows.

## Step 1: ACPI Table Extraction

Extract and decompile ACPI tables to understand the firmware interface:

```bash
# Install tools
sudo apt install acpica-tools

# Extract all ACPI tables
sudo acpidump > acpidump.dat
acpixtract -a acpidump.dat

# Decompile DSDT (main table)
iasl -d dsdt.dat
```

This produces `dsdt.dsl` - a readable ASL (ACPI Source Language) file.

## Step 2: Find Samsung ACPI Device

Search for Samsung-specific devices in DSDT:

```bash
grep -n "SAM0" dsdt.dsl
grep -n "Samsung" dsdt.dsl
```

Key finding: Device `SAM0430` is the Samsung Platform Controller.

## Step 3: Analyze ACPI Methods

Look for methods in the SAM0430 device:

```bash
# Find the device definition
grep -n "Device (SAM0" dsdt.dsl -A 100

# Look for method definitions
grep -n "Method (" dsdt.dsl | grep -i "CS\|SW\|SAM"
```

Key methods found:
- `CSFI` - Get firmware info/values
- `CSXI` - Set firmware values

## Step 4: Understand the Protocol

The SAWB (Samsung ACPI Work Buffer) structure:

```
Offset  Size  Field     Description
0x00    2     safn      Function code (0x5843 = "XC")
0x02    1     sasb      Sub-function
0x03    1     rflg      Return flags
0x04    4     sfnc      Specific function
0x08    4     suession  Session ID
0x0C    2     cession   Command session
0x0E    1     iession   Input session
0x0F    1     cession2  Command session 2
0x10    1     gunession  Get/Set flag (0x81=GET, 0x82=SET)
0x11    1     gunm      Command number
0x12    16    guds      Data buffer
```

## Step 5: Identify Feature Commands

### Battery Charge Threshold

From DSDT analysis:
```
Command: 0xe9 (battery control)
GET: guds[0]=0xe9, guds[1]=0x91 → returns threshold in guds[1]
SET: guds[0]=0xe9, guds[1]=0x90, guds[2]=threshold
```

### Keyboard Backlight

```
Command: 0x78
GET: returns brightness level 0-3
SET: guds[1]=level (0-3)
```

### Performance Mode

```
Command: 0x43
Values: 0=Silent, 1=Balanced, 2=Performance
```

## Step 6: Identify Hotkey Events

Monitor ACPI notifications while pressing Fn keys:

```bash
sudo dmesg -w | grep -i acpi
# Press Fn+F9, F10, etc.
```

Events observed:
- `0x7d` - Keyboard backlight (Fn+F9)
- `0x61` - Performance mode cycle

If scancodes are used instead of ACPI events:

```bash
sudo showkey -s
# Press Fn keys, observe raw scancodes
```

## Step 7: WMI Investigation (Alternative Path)

Some Samsung laptops expose WMI GUIDs:

```bash
# List WMI devices
ls /sys/bus/wmi/devices/
cat /sys/bus/wmi/devices/*/modalias
```

Samsung GUIDs found:
- `C16C47BA-50E3-444A-AF3A-B1C348380002` - Samsung Settings
- `A6FEA33E-DABF-46F5-BFC8-460D961BEC9F` - Platform Driver

Note: Galaxy Book5 Pro uses direct ACPI methods, not WMI.

## Step 8: Testing with acpi_call

Safely test ACPI methods using `acpi_call` module:

```bash
# Install
sudo apt install acpi-call-dkms
sudo modprobe acpi_call

# Test a read operation
echo '\_SB.PC00.LPCB.SAM0.CSFI {0x5843, 0x7a, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x81, 0xe9, 0x91}' | sudo tee /proc/acpi/call
sudo cat /proc/acpi/call
```

## Key Findings Summary

| Feature | ACPI Path | Method | Command |
|---------|-----------|--------|---------|
| Battery threshold | `\_SB.PC00.LPCB.SAM0430` | CSFI/CSXI | 0xe9 |
| Keyboard backlight | same | CSFI/CSXI | 0x78 |
| Performance mode | same | CSFI/CSXI | 0x43 |
| Hotkey Fn+F9 | ACPI notify | event 0x7d | - |

## Resources

- [ACPI Specification](https://uefi.org/specifications)
- [Linux ACPI documentation](https://www.kernel.org/doc/html/latest/firmware-guide/acpi/)
- [iasl manual](https://acpica.org/documentation)
- [acpi_call module](https://github.com/nix-community/acpi_call)
