#!/bin/bash
echo "========================================="
echo "Samsung Galaxy Book5 Pro WMI Investigation"
echo "========================================="
echo ""

cd /sys/bus/wmi/devices/

for device in *; do
    echo "DEVICE: $device"
    echo "----------------------------------------"

    # Read basic device info
    if [ -f "$device/modalias" ]; then
        echo "Modalias: $(cat $device/modalias)"
    fi

    # Check for methods
    if [ -d "$device/" ]; then
        echo "Attributes:"
        ls -1 "$device/" | grep -v "^driver$\|^subsystem$\|^uevent$\|^power$" | while read attr; do
            if [ -f "$device/$attr" ] && [ -r "$device/$attr" ]; then
                echo "  $attr: $(cat $device/$attr 2>/dev/null | head -1)"
            fi
        done
    fi

    echo ""
done

echo "========================================="
echo "Checking for Samsung-specific WMI GUIDs"
echo "========================================="
echo ""

# Known Samsung WMI GUIDs (from other models)
KNOWN_GUIDS=(
    "C16C47BA-50E3-444A-AF3A-B1C348380002"  # Samsung Settings (common)
    "A6FEA33E-DABF-46F5-BFC8-460D961BEC9F"  # Platform driver
    "8246028B-F06A-4AC3-9607-F99BAD39DC8F"  # Performance control
)

for guid in "${KNOWN_GUIDS[@]}"; do
    if [ -d "/sys/bus/wmi/devices/$guid" ] || [ -L "/sys/bus/wmi/devices/$guid" ]; then
        echo "FOUND: $guid"
    else
        echo "NOT FOUND: $guid"
    fi
done

echo ""
echo "========================================="
echo "All WMI Device GUIDs on this system:"
echo "========================================="
ls -1 /sys/bus/wmi/devices/
