#!/bin/bash
# Quick driver load script for testing
# Handles dependencies and provides clear error messages

set -e

cd /home/psychopunk_sage/dev/drivers/samsung-acpi-investigation

echo "Loading Samsung Galaxy Book driver..."
echo ""

# Check if module exists
if [ ! -f "samsung-galaxybook.ko" ]; then
    echo "ERROR: samsung-galaxybook.ko not found!"
    echo "Run 'make' first"
    exit 1
fi

# Unload if already loaded
if lsmod | grep -q samsung_galaxybook; then
    echo "[1/3] Unloading existing driver..."
    sudo rmmod samsung_galaxybook 2>/dev/null || true
fi

# Load platform_profile dependency
echo "[2/3] Loading dependencies..."
if ! lsmod | grep -q platform_profile; then
    sudo modprobe platform_profile || {
        echo "ERROR: Failed to load platform_profile module"
        echo "This module is required for performance mode support"
        exit 1
    }
    echo "  ✓ platform_profile loaded"
else
    echo "  ✓ platform_profile already loaded"
fi

# Load samsung-galaxybook driver
echo "[3/3] Loading samsung-galaxybook driver..."
sudo insmod samsung-galaxybook.ko || {
    echo ""
    echo "ERROR: Failed to load driver!"
    echo ""
    echo "Recent kernel messages:"
    sudo dmesg | tail -15
    exit 1
}

if lsmod | grep -q samsung_galaxybook; then
    echo "  ✓ Driver loaded successfully!"
    echo ""

    # Check for battery threshold
    if [ -f "/sys/class/power_supply/BAT1/charge_control_end_threshold" ]; then
        CURRENT=$(cat /sys/class/power_supply/BAT1/charge_control_end_threshold)
        echo "SUCCESS: Battery charge threshold is available!"
        echo "Current value: ${CURRENT}%"
        echo ""
        echo "Test with:"
        echo "  cat /sys/class/power_supply/BAT1/charge_control_end_threshold"
        echo "  echo 80 | sudo tee /sys/class/power_supply/BAT1/charge_control_end_threshold"
    else
        echo "WARNING: Battery threshold not found, checking dmesg..."
        sudo dmesg | grep -i samsung | tail -10
    fi
else
    echo "ERROR: Driver not in lsmod after insmod"
fi
