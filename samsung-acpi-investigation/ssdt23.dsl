/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20241212 (64-bit version)
 * Copyright (c) 2000 - 2023 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of ssdt23.dat
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000D89 (3465)
 *     Revision         0x02
 *     Checksum         0x8A
 *     OEM ID           "INTEL"
 *     OEM Table ID     "xh_lnl_m"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20210930 (539035952)
 */
DefinitionBlock ("", "SSDT", 2, "INTEL", "xh_lnl_m", 0x00000000)
{
    External (_SB_.PC00.TXHC.RHUB, DeviceObj)
    External (_SB_.PC00.TXHC.RHUB.SS01, DeviceObj)
    External (_SB_.PC00.TXHC.RHUB.SS02, DeviceObj)
    External (_SB_.PC00.TXHC.RHUB.SS03, DeviceObj)
    External (_SB_.PC00.TXHC.RHUB.SS04, DeviceObj)
    External (_SB_.PC00.XHCI, DeviceObj)
    External (_SB_.PC00.XHCI.RHUB.HS01, DeviceObj)
    External (_SB_.PC00.XHCI.RHUB.HS02, DeviceObj)
    External (_SB_.PC00.XHCI.RHUB.HS03, DeviceObj)
    External (_SB_.PC00.XHCI.RHUB.HS04, DeviceObj)
    External (_SB_.PC00.XHCI.RHUB.HS05, DeviceObj)
    External (_SB_.PC00.XHCI.RHUB.HS06, DeviceObj)
    External (_SB_.PC00.XHCI.RHUB.HS07, DeviceObj)
    External (_SB_.PC00.XHCI.RHUB.HS08, DeviceObj)
    External (_SB_.PC00.XHCI.RHUB.HS09, DeviceObj)
    External (_SB_.PC00.XHCI.RHUB.HS10, DeviceObj)
    External (_SB_.PC00.XHCI.RHUB.HS11, DeviceObj)
    External (_SB_.PC00.XHCI.RHUB.HS12, DeviceObj)
    External (_SB_.PC00.XHCI.RHUB.HS13, DeviceObj)
    External (_SB_.PC00.XHCI.RHUB.HS14, DeviceObj)
    External (_SB_.PC00.XHCI.RHUB.SS01, DeviceObj)
    External (_SB_.PC00.XHCI.RHUB.SS02, DeviceObj)
    External (_SB_.PC00.XHCI.RHUB.SS03, DeviceObj)
    External (_SB_.PC00.XHCI.RHUB.SS04, DeviceObj)
    External (_SB_.PC00.XHCI.RHUB.SS05, DeviceObj)
    External (_SB_.PC00.XHCI.RHUB.SS06, DeviceObj)
    External (_SB_.PC00.XHCI.RHUB.SS07, DeviceObj)
    External (_SB_.PC00.XHCI.RHUB.SS08, DeviceObj)
    External (_SB_.PC00.XHCI.RHUB.SS09, DeviceObj)
    External (_SB_.PC00.XHCI.RHUB.SS10, DeviceObj)
    External (_SB_.PC00.XHCI.RHUB.USR1, DeviceObj)
    External (_SB_.PC00.XHCI.RHUB.USR2, DeviceObj)
    External (_SB_.UBTC.CR01._PLD, MethodObj)    // 0 Arguments
    External (_SB_.UBTC.CR01._UPC, MethodObj)    // 0 Arguments
    External (_SB_.UBTC.CR02._PLD, MethodObj)    // 0 Arguments
    External (_SB_.UBTC.CR02._UPC, MethodObj)    // 0 Arguments
    External (PU2C, UnknownObj)
    External (PU3C, UnknownObj)

    Scope (\_SB.PC00.XHCI)
    {
        Name (HSVP, Package (0x0E)
        {
            One, 
            One, 
            One, 
            Zero, 
            Zero, 
            Zero, 
            Zero, 
            Zero, 
            Zero, 
            Zero, 
            Zero, 
            Zero, 
            Zero, 
            Zero
        })
        Name (HGIP, Package (0x0E)
        {
            One, 
            0x02, 
            0x03, 
            0x04, 
            0x05, 
            0x06, 
            0x07, 
            0x08, 
            0x09, 
            0x0A, 
            0x0B, 
            0x0C, 
            0x0D, 
            0x0E
        })
        Name (HGPP, Package (0x0E)
        {
            One, 
            One, 
            One, 
            One, 
            One, 
            One, 
            One, 
            One, 
            One, 
            One, 
            One, 
            One, 
            One, 
            One
        })
        Name (SSVP, Package (0x06)
        {
            One, 
            Zero, 
            Zero, 
            Zero, 
            Zero, 
            Zero
        })
        Name (SGIP, Package (0x06)
        {
            0x03, 
            0x05, 
            0x0F, 
            0x10, 
            0x11, 
            0x12
        })
        Name (SGPP, Package (0x06)
        {
            One, 
            One, 
            One, 
            One, 
            One, 
            One
        })
        Name (DPLD, Package (0x01)
        {
            Buffer (0x14)
            {
                /* 0000 */  0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0008 */  0x70, 0x1D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // p.......
                /* 0010 */  0xFF, 0xFF, 0xFF, 0xFF                           // ....
            }
        })
        Method (GPLD, 2, Serialized)
        {
            If ((Arg0 == Zero))
            {
                Local0 = HSVP /* \_SB_.PC00.XHCI.HSVP */
                Local1 = HGIP /* \_SB_.PC00.XHCI.HGIP */
                Local2 = HGPP /* \_SB_.PC00.XHCI.HGPP */
            }
            Else
            {
                Local0 = SSVP /* \_SB_.PC00.XHCI.SSVP */
                Local1 = SGIP /* \_SB_.PC00.XHCI.SGIP */
                Local2 = SGPP /* \_SB_.PC00.XHCI.SGPP */
            }

            CreateBitField (DerefOf (DPLD [Zero]), 0x40, VISS)
            VISS = DerefOf (Local0 [Arg1])
            CreateField (DerefOf (DPLD [Zero]), 0x4F, 0x08, GID)
            GID = DerefOf (Local1 [Arg1])
            CreateField (DerefOf (DPLD [Zero]), 0x57, 0x08, GPOS)
            GPOS = DerefOf (Local2 [Arg1])
            Return (DPLD) /* \_SB_.PC00.XHCI.DPLD */
        }
    }

    If (CondRefOf (PU2C))
    {
        If ((One <= PU2C))
        {
            Scope (\_SB.PC00.XHCI.RHUB.HS01)
            {
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (\_SB.UBTC.CR01._UPC ())
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                {
                    Return (\_SB.UBTC.CR01._PLD ())
                }
            }
        }

        If ((0x02 <= PU2C))
        {
            Scope (\_SB.PC00.XHCI.RHUB.HS02)
            {
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (\_SB.UBTC.CR02._UPC ())
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                {
                    Return (\_SB.UBTC.CR02._PLD ())
                }
            }
        }

        If ((0x03 <= PU2C))
        {
            Scope (\_SB.PC00.XHCI.RHUB.HS03)
            {
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (Package (0x04)
                    {
                        0xFF, 
                        0x03, 
                        Zero, 
                        Zero
                    })
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                {
                    Return (GPLD (Zero, 0x02))
                }
            }
        }

        If ((0x04 <= PU2C))
        {
            Scope (\_SB.PC00.XHCI.RHUB.HS04)
            {
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (Package (0x04)
                    {
                        0xFF, 
                        0xFF, 
                        Zero, 
                        Zero
                    })
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                {
                    Return (GPLD (Zero, 0x03))
                }
            }
        }

        If ((0x05 <= PU2C))
        {
            Scope (\_SB.PC00.XHCI.RHUB.HS05)
            {
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (Package (0x04)
                    {
                        0xFF, 
                        0xFF, 
                        Zero, 
                        Zero
                    })
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                {
                    Return (GPLD (Zero, 0x04))
                }
            }
        }

        If ((0x06 <= PU2C))
        {
            Scope (\_SB.PC00.XHCI.RHUB.HS06)
            {
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (Package (0x04)
                    {
                        0xFF, 
                        0xFF, 
                        Zero, 
                        Zero
                    })
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                {
                    Return (GPLD (Zero, 0x05))
                }
            }
        }

        If ((0x07 <= PU2C))
        {
            Scope (\_SB.PC00.XHCI.RHUB.HS07)
            {
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (Package (0x04)
                    {
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero
                    })
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                {
                    Return (GPLD (Zero, 0x06))
                }
            }
        }

        If ((0x09 <= PU2C))
        {
            Scope (\_SB.PC00.XHCI.RHUB.HS08)
            {
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (Package (0x04)
                    {
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero
                    })
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                {
                    Return (GPLD (Zero, 0x07))
                }
            }
        }

        If ((0x09 <= PU2C))
        {
            Scope (\_SB.PC00.XHCI.RHUB.HS09)
            {
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (Package (0x04)
                    {
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero
                    })
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                {
                    Return (GPLD (Zero, 0x08))
                }
            }
        }

        If ((0x0A <= PU2C))
        {
            Scope (\_SB.PC00.XHCI.RHUB.HS10)
            {
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (Package (0x04)
                    {
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero
                    })
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                {
                    Return (GPLD (Zero, 0x09))
                }
            }
        }

        If ((0x0B <= PU2C))
        {
            Scope (\_SB.PC00.XHCI.RHUB.HS11)
            {
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (Package (0x04)
                    {
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero
                    })
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                {
                    Return (GPLD (Zero, 0x0A))
                }
            }
        }

        If ((0x0C <= PU2C))
        {
            Scope (\_SB.PC00.XHCI.RHUB.HS12)
            {
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (Package (0x04)
                    {
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero
                    })
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                {
                    Return (GPLD (Zero, 0x0B))
                }
            }
        }

        If ((0x0D <= PU2C))
        {
            Scope (\_SB.PC00.XHCI.RHUB.HS13)
            {
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (Package (0x04)
                    {
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero
                    })
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                {
                    Return (GPLD (Zero, 0x0C))
                }
            }
        }

        If ((0x0E <= PU2C))
        {
            Scope (\_SB.PC00.XHCI.RHUB.HS14)
            {
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (Package (0x04)
                    {
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero
                    })
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                {
                    Return (GPLD (Zero, 0x0D))
                }
            }
        }

        Scope (\_SB.PC00.XHCI.RHUB.USR1)
        {
            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
            {
                Return (Package (0x04)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero
                })
            }

            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
            {
                Local0 = (PU2C + One)
                Return (GPLD (Zero, Local0))
            }
        }

        Scope (\_SB.PC00.XHCI.RHUB.USR2)
        {
            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
            {
                Return (Package (0x04)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero
                })
            }

            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
            {
                Local0 = (PU2C + 0x02)
                Return (GPLD (Zero, Local0))
            }
        }
    }

    If (CondRefOf (PU3C))
    {
        If ((One <= PU3C))
        {
            Scope (\_SB.PC00.XHCI.RHUB.SS01)
            {
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (Package (0x04)
                    {
                        0xFF, 
                        0x03, 
                        Zero, 
                        Zero
                    })
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                {
                    Return (GPLD (One, Zero))
                }
            }
        }

        If ((0x02 <= PU3C))
        {
            Scope (\_SB.PC00.XHCI.RHUB.SS02)
            {
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (Package (0x04)
                    {
                        0xFF, 
                        0xFF, 
                        Zero, 
                        Zero
                    })
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                {
                    Return (GPLD (One, One))
                }
            }
        }

        If ((0x03 <= PU3C))
        {
            Scope (\_SB.PC00.XHCI.RHUB.SS03)
            {
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (Package (0x04)
                    {
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero
                    })
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                {
                    Return (GPLD (One, 0x02))
                }
            }
        }

        If ((0x04 <= PU3C))
        {
            Scope (\_SB.PC00.XHCI.RHUB.SS04)
            {
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (Package (0x04)
                    {
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero
                    })
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                {
                    Return (GPLD (One, 0x03))
                }
            }
        }

        If ((0x05 <= PU3C))
        {
            Scope (\_SB.PC00.XHCI.RHUB.SS05)
            {
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (Package (0x04)
                    {
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero
                    })
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                {
                    Return (GPLD (One, 0x04))
                }
            }
        }

        If ((0x06 <= PU3C))
        {
            Scope (\_SB.PC00.XHCI.RHUB.SS06)
            {
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (Package (0x04)
                    {
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero
                    })
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                {
                    Return (GPLD (One, 0x05))
                }
            }
        }

        If ((0x07 <= PU3C))
        {
            Scope (\_SB.PC00.XHCI.RHUB.SS07)
            {
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (Package (0x04)
                    {
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero
                    })
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                {
                    Return (GPLD (One, 0x06))
                }
            }
        }

        If ((0x08 <= PU3C))
        {
            Scope (\_SB.PC00.XHCI.RHUB.SS08)
            {
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (Package (0x04)
                    {
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero
                    })
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                {
                    Return (GPLD (One, 0x07))
                }
            }
        }

        If ((0x09 <= PU3C))
        {
            Scope (\_SB.PC00.XHCI.RHUB.SS09)
            {
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (Package (0x04)
                    {
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero
                    })
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                {
                    Return (GPLD (One, 0x08))
                }
            }
        }

        If ((0x0A <= PU3C))
        {
            Scope (\_SB.PC00.XHCI.RHUB.SS10)
            {
                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                {
                    Return (Package (0x04)
                    {
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero
                    })
                }

                Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                {
                    Return (GPLD (One, 0x09))
                }
            }
        }
    }

    Scope (\_SB.PC00.TXHC.RHUB)
    {
        Name (DUPC, Package (0x04)
        {
            Zero, 
            Zero, 
            Zero, 
            Zero
        })
        Name (DPLD, Package (0x01)
        {
            Buffer (0x14)
            {
                /* 0000 */  0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0008 */  0x70, 0x1D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // p.......
                /* 0010 */  0xFF, 0xFF, 0xFF, 0xFF                           // ....
            }
        })
    }

    Scope (\_SB.PC00.TXHC.RHUB.SS01)
    {
        Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
        {
            Return (\_SB.UBTC.CR02._UPC ())
        }

        Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
        {
            Return (\_SB.UBTC.CR02._PLD ())
        }
    }

    Scope (\_SB.PC00.TXHC.RHUB.SS02)
    {
        Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
        {
            Return (\_SB.UBTC.CR01._UPC ())
        }

        Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
        {
            Return (\_SB.UBTC.CR01._PLD ())
        }
    }

    Scope (\_SB.PC00.TXHC.RHUB.SS03)
    {
        Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
        {
            Return (\_SB.PC00.TXHC.RHUB.DUPC)
        }

        Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
        {
            Return (\_SB.PC00.TXHC.RHUB.DPLD)
        }
    }

    Scope (\_SB.PC00.TXHC.RHUB.SS04)
    {
        Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
        {
            Return (\_SB.PC00.TXHC.RHUB.DUPC)
        }

        Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
        {
            Return (\_SB.PC00.TXHC.RHUB.DPLD)
        }
    }
}

