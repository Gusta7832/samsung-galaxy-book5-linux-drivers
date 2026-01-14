#!/bin/bash
set -e

echo "========================================="
echo "Samsung Galaxy Book5 Pro - ACPI Data Extraction"
echo "========================================="
echo ""

INVESTIGATION_DIR="$HOME/dev/drivers/samsung-acpi-investigation"
cd "$INVESTIGATION_DIR"

echo "[1/6] Checking for required tools..."
if ! command -v acpidump &> /dev/null || ! command -v iasl &> /dev/null; then
    echo "ERROR: ACPI tools not installed!"
    echo "Please run: sudo apt install -y acpica-tools"
    exit 1
fi
echo "OK - ACPI tools found"
echo ""

echo "[2/6] Extracting ACPI tables (requires root)..."
sudo acpidump > acpidump.dat
echo "OK - ACPI dump complete ($(wc -c < acpidump.dat) bytes)"
echo ""

echo "[3/6] Extracting individual tables..."
acpixtract -a acpidump.dat
echo "OK - Tables extracted"
echo ""

echo "[4/6] Decompiling tables to .dsl format..."
iasl -d *.dat 2>&1 | grep -E "^(ACPI|Compiler)" || true
echo "OK - Decompilation complete"
echo ""

echo "[5/6] Listing generated files..."
ls -lh *.dsl
echo ""

echo "[6/6] Collecting additional system information..."

# DMI Information
echo "=== DMI Information ===" > system_info.txt
echo "Product Name: $(cat /sys/class/dmi/id/product_name)" >> system_info.txt
echo "Vendor: $(cat /sys/class/dmi/id/sys_vendor)" >> system_info.txt
echo "Board Name: $(cat /sys/class/dmi/id/board_name)" >> system_info.txt
echo "BIOS Version: $(cat /sys/class/dmi/id/bios_version)" >> system_info.txt
echo "BIOS Date: $(cat /sys/class/dmi/id/bios_date)" >> system_info.txt
echo "" >> system_info.txt

# Kernel Version
echo "=== Kernel Information ===" >> system_info.txt
uname -a >> system_info.txt
echo "" >> system_info.txt

# Battery Information
echo "=== Battery Information ===" >> system_info.txt
cat /sys/class/power_supply/BAT1/uevent >> system_info.txt
echo "" >> system_info.txt

# Check for charge threshold attribute
echo "=== Charge Threshold Support ===" >> system_info.txt
if [ -f /sys/class/power_supply/BAT1/charge_control_end_threshold ]; then
    echo "charge_control_end_threshold: EXISTS" >> system_info.txt
    echo "Current value: $(cat /sys/class/power_supply/BAT1/charge_control_end_threshold)" >> system_info.txt
else
    echo "charge_control_end_threshold: NOT FOUND (no driver loaded)" >> system_info.txt
fi
echo "" >> system_info.txt

# Kernel modules
echo "=== Loaded Platform Drivers ===" >> system_info.txt
lsmod | grep -E "samsung|platform|wmi|acpi" >> system_info.txt || echo "No Samsung/platform modules loaded" >> system_info.txt
echo "" >> system_info.txt

# EC debug (requires root and kernel config)
echo "=== EC Debug Interface ===" >> system_info.txt
if sudo test -d /sys/kernel/debug/ec/; then
    echo "EC debug interface: EXISTS" >> system_info.txt
    ls -la /sys/kernel/debug/ec/ 2>&1 | sudo tee -a system_info.txt > /dev/null
else
    echo "EC debug interface: NOT AVAILABLE (requires CONFIG_ACPI_EC_DEBUGFS=y)" >> system_info.txt
fi
echo "" >> system_info.txt

echo "OK - System info saved to system_info.txt"
cat system_info.txt
echo ""

echo "========================================="
echo "Extraction Complete!"
echo "========================================="
echo ""
echo "Generated files:"
echo "  - acpidump.dat       : Raw ACPI dump"
echo "  - *.dat              : Individual ACPI tables (binary)"
echo "  - *.dsl              : Decompiled ACPI tables (human-readable)"
echo "  - system_info.txt    : System information summary"
echo "  - wmi_devices.txt    : WMI device enumeration (already generated)"
echo ""
echo "MOST IMPORTANT FILES FOR ANALYSIS:"
echo "  - DSDT.dsl           : Main system description table"
echo "  - SSDT*.dsl          : Supplemental tables"
echo ""
echo "Next step: Analyze DSDT.dsl for Samsung WMI methods and EC registers"
echo ""
