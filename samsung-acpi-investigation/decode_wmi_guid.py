#!/usr/bin/env python3
"""Decode WMI GUID from ACPI buffer"""

# From dsdt.dsl line 26898-26902:
# BA 47 6C C1 E3 50 4A 44 AF 3A B1 C3 48 38 00 02
# This is the byte representation of C16C47BA-50E3-444A-AF3A-B1C348380002

import struct

def decode_wmi_guid(buffer):
    """Convert ACPI buffer format to GUID string"""
    # First 4 bytes (little-endian DWORD)
    part1 = struct.unpack('<I', bytes(buffer[0:4]))[0]
    # Next 2 bytes (little-endian WORD)
    part2 = struct.unpack('<H', bytes(buffer[4:6]))[0]
    # Next 2 bytes (little-endian WORD)  
    part3 = struct.unpack('<H', bytes(buffer[6:8]))[0]
    # Next 2 bytes (big-endian)
    part4 = buffer[8:10]
    # Last 6 bytes (big-endian)
    part5 = buffer[10:16]
    
    guid = f"{part1:08X}-{part2:04X}-{part3:04X}-"
    guid += f"{part4[0]:02X}{part4[1]:02X}-"
    guid += ''.join(f"{b:02X}" for b in part5)
    
    return guid

# WMI GUID 1 from _WDG buffer
buffer1 = [0xBA, 0x47, 0x6C, 0xC1, 0xE3, 0x50, 0x4A, 0x44,
           0xAF, 0x3A, 0xB1, 0xC3, 0x48, 0x38, 0x00, 0x02]

# Instance info from next 4 bytes: 30 31 01 02
# 30 31 = "01" (Object ID in ASCII)
# 01 = Instance count
# 02 = Flags (0x02 = WMmethod call, not WMI query)

print("Samsung Galaxy Book5 Pro WMI Analysis")
print("=" * 50)
print(f"\nGUID 1: {decode_wmi_guid(buffer1)}")
print(f"  Object ID: '01' (0x3031)")
print(f"  Instance: 1")
print(f"  Type: WMI Method (0x02)")
print(f"  ACPI Method: WM01")
print()
print("This GUID handles method calls via WM01(instance, method_id, args)")
