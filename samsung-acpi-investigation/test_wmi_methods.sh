#!/bin/bash
set -e

echo "================================================================================"
echo "  Samsung Galaxy Book5 Pro - WMI Method Discovery"
echo "================================================================================"
echo ""

# Check if acpi_call is loaded
if [ ! -e /proc/acpi/call ]; then
    echo "ERROR: acpi_call module not loaded!"
    echo ""
    echo "Install with:"
    echo "  sudo apt install acpi-call-dkms"
    echo "  sudo modprobe acpi_call"
    echo ""
    echo "OR build from source:"
    echo "  git clone https://github.com/nix-community/acpi_call.git"
    echo "  cd acpi_call && make"
    echo "  sudo insmod acpi_call.ko"
    exit 1
fi

echo "[INFO] acpi_call module detected: OK"
echo ""

OUTPUT_FILE="wmi_method_results.txt"
> "$OUTPUT_FILE"

echo "================================================================================" >> "$OUTPUT_FILE"
echo "WMI Method Discovery Results" >> "$OUTPUT_FILE"
echo "Date: $(date)" >> "$OUTPUT_FILE"
echo "================================================================================" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

echo "[INFO] Testing WMI methods (this may take a few minutes)..."
echo "[INFO] Results will be saved to: $OUTPUT_FILE"
echo ""

# Function to test a WMI method
test_method() {
    local method_id=$1
    local description=$2

    # Call WMI method via ACPI
    # Format: \_SB.SWSD.WM01 <instance> <method_id> <buffer>
    echo "\_SB.SWSD.WM01 0x01 0x$(printf '%02x' $method_id) 0x0" | \
        sudo tee /proc/acpi/call > /dev/null 2>&1

    # Read result
    result=$(sudo cat /proc/acpi/call 2>&1)

    # Log results
    if [ "$result" != "0x0" ] && [ "$result" != "Error" ] && [[ ! "$result" =~ "not handled" ]]; then
        echo "  [FOUND] Method $method_id: $result" | tee -a "$OUTPUT_FILE"
    fi
}

echo "Phase 1: Scanning method range 0x01-0xFF (256 methods)"
echo "  Note: Only methods returning data will be shown"
echo ""

for method in {1..255}; do
    # Show progress every 16 methods
    if [ $((method % 16)) -eq 0 ]; then
        echo "  Progress: $method/255 methods tested..."
    fi

    test_method $method
done

echo "" | tee -a "$OUTPUT_FILE"
echo "================================================================================" >> "$OUTPUT_FILE"
echo "Scan Complete!" >> "$OUTPUT_FILE"
echo "================================================================================" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# Count how many methods responded
method_count=$(grep "\[FOUND\]" "$OUTPUT_FILE" | wc -l)

echo ""
echo "================================================================================"
echo "  Discovery Complete!"
echo "================================================================================"
echo ""
echo "Methods found: $method_count"
echo "Results saved to: $OUTPUT_FILE"
echo ""

if [ $method_count -gt 0 ]; then
    echo "Working methods detected:"
    grep "\[FOUND\]" "$OUTPUT_FILE" || true
    echo ""
    echo "NEXT STEPS:"
    echo "  1. Review $OUTPUT_FILE for promising methods"
    echo "  2. Look for values in range 50-100 (likely battery threshold)"
    echo "  3. Test identified methods with different arguments"
    echo "  4. Validate GET operation returns consistent values"
    echo ""
    echo "Example analysis:"
    echo "  grep 'Method.*0x[5-9][0-9]\\|Method.*0x[6-9]0' $OUTPUT_FILE"
else
    echo "WARNING: No methods returned data!"
    echo ""
    echo "Possible causes:"
    echo "  1. WMI methods require specific arguments (not just 0x0)"
    echo "  2. Methods return via different mechanism"
    echo "  3. Need to call via wmi_evaluate_method instead of direct ACPI"
    echo ""
    echo "Try testing with argument buffer:"
    echo "  echo '\\_SB.SWSD.WM01 0x01 0x44 {0x00, 0x50}' | sudo tee /proc/acpi/call"
fi

echo ""
echo "================================================================================"
