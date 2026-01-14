#!/bin/bash

echo "========================================="
echo "Samsung Galaxy Book5 Pro - ACPI Analysis"
echo "========================================="
echo ""

INVESTIGATION_DIR="$HOME/dev/drivers/samsung-acpi-investigation"
cd "$INVESTIGATION_DIR"

if [ ! -f "dsdt.dsl" ] && [ ! -f "DSDT.dsl" ]; then
    echo "ERROR: dsdt.dsl not found!"
    echo "Please run extract_all.sh first to decompile ACPI tables."
    exit 1
fi

# Use lowercase filenames (iasl default output)
DSDT_FILE="dsdt.dsl"
SSDT_PATTERN="ssdt*.dsl"
[ -f "DSDT.dsl" ] && DSDT_FILE="DSDT.dsl" && SSDT_PATTERN="$SSDT_PATTERN"

OUTPUT="acpi_analysis.txt"
> "$OUTPUT"  # Clear output file

echo "Analyzing ACPI tables for Samsung-specific interfaces..."
echo ""

# 1. Search for Samsung WMI GUIDs
echo "=== Samsung WMI GUID Locations ===" | tee -a "$OUTPUT"
echo "" | tee -a "$OUTPUT"

SAMSUNG_GUIDS=(
    "C16C47BA-50E3-444A-AF3A-B1C348380002"
    "A6FEA33E-DABF-46F5-BFC8-460D961BEC9F"
)

for guid in "${SAMSUNG_GUIDS[@]}"; do
    # Convert GUID to byte array format (how it appears in ACPI)
    # GUID C16C47BA-50E3-444A-AF3A-B1C348380002 becomes:
    # BA 47 6C C1 E3 50 4A 44 AF 3A B1 C3 48 38 00 02

    echo "Searching for GUID: $guid" | tee -a "$OUTPUT"
    grep -n -i "$guid" $DSDT_FILE $SSDT_PATTERN 2>/dev/null | tee -a "$OUTPUT" || echo "  Not found in GUID format" | tee -a "$OUTPUT"

    # Also search for the first part as it might be written differently
    GUID_PREFIX=$(echo "$guid" | cut -d'-' -f1)
    grep -n -i "$GUID_PREFIX" $DSDT_FILE $SSDT_PATTERN 2>/dev/null | grep -i "buffer\|method\|name" | head -5 | tee -a "$OUTPUT" || true
    echo "" | tee -a "$OUTPUT"
done

# 2. Search for EC (Embedded Controller) device
echo "=== Embedded Controller (EC) Devices ===" | tee -a "$OUTPUT"
echo "" | tee -a "$OUTPUT"
grep -n "Device.*EC\|Device.*H_EC\|Device.*ECDV\|PNP0C09" $DSDT_FILE $SSDT_PATTERN 2>/dev/null | tee -a "$OUTPUT"
echo "" | tee -a "$OUTPUT"

# 3. Search for battery-related methods
echo "=== Battery-Related ACPI Methods ===" | tee -a "$OUTPUT"
echo "" | tee -a "$OUTPUT"
grep -n "Method.*BAT\|Method.*GBAT\|Method.*SBAT\|Method.*BMAX\|Method.*BSET" $DSDT_FILE $SSDT_PATTERN 2>/dev/null | tee -a "$OUTPUT"
echo "" | tee -a "$OUTPUT"

# 4. Search for WMI methods
echo "=== WMI Method Definitions ===" | tee -a "$OUTPUT"
echo "" | tee -a "$OUTPUT"
grep -n "Method.*WM\|Method (WQ\|Method (WS" $DSDT_FILE $SSDT_PATTERN 2>/dev/null | tee -a "$OUTPUT"
echo "" | tee -a "$OUTPUT"

# 5. Search for charge/threshold related strings
echo "=== Charge/Threshold Related Strings ===" | tee -a "$OUTPUT"
echo "" | tee -a "$OUTPUT"
grep -n -i "charge\|threshold\|limit\|batt.*max\|bmax" $DSDT_FILE $SSDT_PATTERN 2>/dev/null | grep -i "method\|name\|field" | head -20 | tee -a "$OUTPUT"
echo "" | tee -a "$OUTPUT"

# 6. Search for Samsung-specific device names
echo "=== Samsung Device Identifiers ===" | tee -a "$OUTPUT"
echo "" | tee -a "$OUTPUT"
grep -n "SAMSUNG\|SAM[0-9]\|SSKB\|SSWM" $DSDT_FILE $SSDT_PATTERN 2>/dev/null | tee -a "$OUTPUT"
echo "" | tee -a "$OUTPUT"

# 7. List all SSDT files and their descriptions
echo "=== SSDT Table Summary ===" | tee -a "$OUTPUT"
echo "" | tee -a "$OUTPUT"
for ssdt in $SSDT_PATTERN; do
    if [ -f "$ssdt" ]; then
        echo "File: $ssdt" | tee -a "$OUTPUT"
        head -20 "$ssdt" | grep "OEM Table ID\|OEM Revision\|Table Length" | tee -a "$OUTPUT"
        echo "" | tee -a "$OUTPUT"
    fi
done

# 8. Search for EC operation regions (register mappings)
echo "=== EC Operation Regions (Register Maps) ===" | tee -a "$OUTPUT"
echo "" | tee -a "$OUTPUT"
grep -A 10 "OperationRegion.*EC\|OperationRegion.*ERAM" $DSDT_FILE $SSDT_PATTERN 2>/dev/null | head -50 | tee -a "$OUTPUT"
echo "" | tee -a "$OUTPUT"

# 9. Search for Field definitions in EC space
echo "=== EC Field Definitions (Potential Registers) ===" | tee -a "$OUTPUT"
echo "" | tee -a "$OUTPUT"
grep -B 2 -A 20 "Field.*EC\|Field.*ERAM" $DSDT_FILE $SSDT_PATTERN 2>/dev/null | grep -E "Field|Offset|BAT|CHG|FAN|PWR|THR" | head -50 | tee -a "$OUTPUT"
echo "" | tee -a "$OUTPUT"

# 10. Search for _DSM methods (Device Specific Method - common for OEM features)
echo "=== _DSM Methods (Device Specific Methods) ===" | tee -a "$OUTPUT"
echo "" | tee -a "$OUTPUT"
grep -B 5 -A 15 "Method.*_DSM" $DSDT_FILE $SSDT_PATTERN 2>/dev/null | head -100 | tee -a "$OUTPUT"
echo "" | tee -a "$OUTPUT"

echo "========================================="
echo "Analysis Complete!"
echo "========================================="
echo ""
echo "Results saved to: $OUTPUT"
echo ""
echo "Key things to look for in the output:"
echo "  1. WMI GUID references (C16C47BA... or A6FEA33E...)"
echo "  2. EC device path (e.g., \\_SB.PCI0.LPCB.EC0)"
echo "  3. Battery methods (GBAT, SBAT, etc.)"
echo "  4. Field definitions in EC space (potential register addresses)"
echo "  5. _DSM methods with interesting GUIDs"
echo ""
echo "Next: Review $OUTPUT and share relevant sections for driver development."
echo ""
