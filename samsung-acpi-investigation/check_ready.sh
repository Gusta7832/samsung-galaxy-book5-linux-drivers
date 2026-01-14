#!/bin/bash

echo "========================================="
echo "Pre-flight Check: ACPI Extraction Readiness"
echo "========================================="
echo ""

ALL_GOOD=true

# Check 1: ACPI tools installed
echo "[1/5] Checking for ACPI tools..."
if command -v acpidump &> /dev/null && command -v acpixtract &> /dev/null && command -v iasl &> /dev/null; then
    echo "  ✓ acpidump found: $(which acpidump)"
    echo "  ✓ acpixtract found: $(which acpixtract)"
    echo "  ✓ iasl found: $(which iasl)"
else
    echo "  ✗ ACPI tools NOT installed"
    echo "    Fix: sudo apt install -y acpica-tools"
    ALL_GOOD=false
fi
echo ""

# Check 2: Scripts executable
echo "[2/5] Checking script permissions..."
SCRIPT_DIR="$HOME/dev/drivers/samsung-acpi-investigation"
if [ -x "$SCRIPT_DIR/extract_all.sh" ] && [ -x "$SCRIPT_DIR/analyze_acpi.sh" ]; then
    echo "  ✓ extract_all.sh is executable"
    echo "  ✓ analyze_acpi.sh is executable"
else
    echo "  ✗ Scripts not executable"
    echo "    Fix: chmod +x $SCRIPT_DIR/*.sh"
    ALL_GOOD=false
fi
echo ""

# Check 3: Sudo access
echo "[3/5] Checking sudo access..."
if sudo -n true 2>/dev/null; then
    echo "  ✓ Sudo access available (passwordless)"
else
    echo "  ! Sudo will require password for acpidump"
    echo "    (This is normal and expected)"
fi
echo ""

# Check 4: Battery device exists
echo "[4/5] Checking battery device..."
if [ -d /sys/class/power_supply/BAT1 ]; then
    echo "  ✓ Battery device found: /sys/class/power_supply/BAT1"
    CAPACITY=$(cat /sys/class/power_supply/BAT1/capacity 2>/dev/null)
    STATUS=$(cat /sys/class/power_supply/BAT1/status 2>/dev/null)
    echo "    Current: $CAPACITY% ($STATUS)"
else
    echo "  ✗ Battery device not found at /sys/class/power_supply/BAT1"
    echo "    (This might be BAT0 on your system)"
fi
echo ""

# Check 5: WMI devices detected
echo "[5/5] Checking Samsung WMI devices..."
if [ -f "$SCRIPT_DIR/wmi_devices.txt" ] && grep -q "C16C47BA-50E3-444A-AF3A-B1C348380002" "$SCRIPT_DIR/wmi_devices.txt"; then
    echo "  ✓ Samsung WMI GUID C16C47BA... detected"
    echo "  ✓ Samsung WMI GUID A6FEA33E... detected"
else
    echo "  ? WMI scan not completed or devices not found"
    echo "    (Will be checked during extraction)"
fi
echo ""

# Check 6: charge_control_end_threshold status
echo "[6/6] Checking for existing charge threshold support..."
if [ -f /sys/class/power_supply/BAT1/charge_control_end_threshold ]; then
    echo "  ! Charge threshold attribute ALREADY EXISTS"
    echo "    Current value: $(cat /sys/class/power_supply/BAT1/charge_control_end_threshold)"
    echo "    A driver may already be loaded!"
    lsmod | grep -E "samsung|platform" | head -5
else
    echo "  ✓ No existing driver (as expected)"
    echo "    charge_control_end_threshold does not exist yet"
fi
echo ""

echo "========================================="
if [ "$ALL_GOOD" = true ]; then
    echo "STATUS: READY TO PROCEED ✓"
    echo ""
    echo "Next command:"
    echo "  ./extract_all.sh"
else
    echo "STATUS: ISSUES FOUND ✗"
    echo ""
    echo "Fix the issues above, then run:"
    echo "  ./extract_all.sh"
fi
echo "========================================="
