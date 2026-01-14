#!/bin/bash
set -e

echo "========================================================================"
echo "  Samsung Galaxy Book5 Pro - Battery Charge Threshold Driver"
echo "  Build and Test Script"
echo "========================================================================"
echo ""

INVESTIGATION_DIR="/home/psychopunk_sage/dev/drivers/samsung-acpi-investigation"
cd "$INVESTIGATION_DIR"

# Check prerequisites
echo "[1/6] Checking prerequisites..."

if [ ! -f "samsung-galaxybook.c" ]; then
    echo "ERROR: samsung-galaxybook.c not found!"
    echo "Download it first with:"
    echo "  wget https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/drivers/platform/x86/samsung-galaxybook.c"
    exit 1
fi

if [ ! -d "/lib/modules/$(uname -r)/build" ]; then
    echo "ERROR: Kernel headers not found!"
    echo "Install with: sudo apt install linux-headers-$(uname -r)"
    exit 1
fi

which make > /dev/null || {
    echo "ERROR: make not found!"
    echo "Install with: sudo apt install build-essential"
    exit 1
}

echo "  ✓ samsung-galaxybook.c present"
echo "  ✓ Kernel headers installed"
echo "  ✓ Build tools ready"
echo ""

# Clean previous builds
echo "[2/6] Cleaning previous builds..."
make clean 2>/dev/null || true
echo "  ✓ Clean complete"
echo ""

# Compile driver
echo "[3/6] Compiling driver..."
make 2>&1 | tee compile.log

if [ ! -f "samsung-galaxybook.ko" ]; then
    echo "ERROR: Compilation failed!"
    echo "Check compile.log for details"
    exit 1
fi

echo "  ✓ Compilation successful"
echo "  ✓ Module: samsung-galaxybook.ko"
echo ""

# Check SAM0430 device
echo "[4/6] Checking for SAM0430 ACPI device..."
if ls /sys/bus/acpi/devices/ | grep -q SAM0430; then
    echo "  ✓ SAM0430 device found"
    SAM_DEVICE=$(ls -d /sys/bus/acpi/devices/SAM0430* | head -1)
    echo "    Path: $SAM_DEVICE"
    if [ -f "$SAM_DEVICE/status" ]; then
        STATUS=$(cat "$SAM_DEVICE/status" 2>/dev/null)
        echo "    Status: $STATUS"
    fi
else
    echo "  ✗ WARNING: SAM0430 device not found!"
    echo "    The device may not be enabled in ACPI"
    echo "    Check OSYS in DSDT (needs >= 0x07D9 for Windows 10+)"
fi
echo ""

# Load driver
echo "[5/6] Loading driver..."

# Unload if already loaded
sudo rmmod samsung_galaxybook 2>/dev/null || true

# Load new module
sudo insmod samsung-galaxybook.ko

if lsmod | grep -q samsung_galaxybook; then
    echo "  ✓ Driver loaded successfully"
else
    echo "  ✗ ERROR: Driver failed to load"
    echo "  Check dmesg:"
    dmesg | tail -20
    exit 1
fi
echo ""

# Test functionality
echo "[6/6] Testing battery charge threshold..."

sleep 1  # Give driver time to initialize

if [ -f "/sys/class/power_supply/BAT1/charge_control_end_threshold" ]; then
    echo "  ✓ Charge threshold attribute found!"
    echo ""

    CURRENT=$(cat /sys/class/power_supply/BAT1/charge_control_end_threshold)
    echo "  Current threshold: $CURRENT%"
    echo ""

    echo "  Testing read/write:"
    echo "    Reading current value... $CURRENT%"

    # Test write
    echo "    Setting to 80%..."
    echo 80 | sudo tee /sys/class/power_supply/BAT1/charge_control_end_threshold > /dev/null

    NEW_VALUE=$(cat /sys/class/power_supply/BAT1/charge_control_end_threshold)
    if [ "$NEW_VALUE" = "80" ]; then
        echo "    ✓ Successfully set to 80%"
    else
        echo "    ✗ WARNING: Value is $NEW_VALUE, expected 80"
    fi

    # Restore original value
    echo "    Restoring original value ($CURRENT%)..."
    echo $CURRENT | sudo tee /sys/class/power_supply/BAT1/charge_control_end_threshold > /dev/null

else
    echo "  ✗ ERROR: Charge threshold attribute not found!"
    echo ""
    echo "  Troubleshooting:"
    echo "  1. Check driver loaded:"
    lsmod | grep samsung
    echo ""
    echo "  2. Check dmesg for errors:"
    dmesg | grep -i samsung | tail -20
    exit 1
fi

echo ""
echo "========================================================================"
echo "  SUCCESS!"
echo "========================================================================"
echo ""
echo "The samsung-galaxybook driver is working!"
echo ""
echo "Usage:"
echo "  # Read threshold"
echo "  cat /sys/class/power_supply/BAT1/charge_control_end_threshold"
echo ""
echo "  # Set threshold to 80%"
echo "  echo 80 | sudo tee /sys/class/power_supply/BAT1/charge_control_end_threshold"
echo ""
echo "To make driver load on boot:"
echo "  sudo make install"
echo "  echo 'samsung-galaxybook' | sudo tee /etc/modules-load.d/samsung-galaxybook.conf"
echo ""
echo "To set default threshold on boot:"
echo "  echo 'echo 80 > /sys/class/power_supply/BAT1/charge_control_end_threshold' | \\"
echo "    sudo tee /etc/rc.local"
echo ""
echo "========================================================================"
