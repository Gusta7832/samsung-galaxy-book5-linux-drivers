/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20241212 (64-bit version)
 * Copyright (c) 2000 - 2023 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of ssdt13.dat
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00002816 (10262)
 *     Revision         0x02
 *     Checksum         0xE4
 *     OEM ID           "SECCSD"
 *     OEM Table ID     "LnlMRvp1"
 *     OEM Revision     0x00001000 (4096)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20210930 (539035952)
 */
DefinitionBlock ("", "SSDT", 2, "SECCSD", "LnlMRvp1", 0x00001000)
{
    External (_SB_.CAGS, MethodObj)    // 1 Arguments
    External (_SB_.GGOV, MethodObj)    // 1 Arguments
    External (_SB_.ISME, MethodObj)    // 1 Arguments
    External (_SB_.PC00, DeviceObj)
    External (_SB_.PC00.GLAN, DeviceObj)
    External (_SB_.PC00.HDAS, DeviceObj)
    External (_SB_.PC00.HDAS.VDID, UnknownObj)
    External (_SB_.PC00.I2C0, DeviceObj)
    External (_SB_.PC00.I2C0.TPD0, DeviceObj)
    External (_SB_.PC00.I2C1, DeviceObj)
    External (_SB_.PC00.I2C1.TPL1, DeviceObj)
    External (_SB_.PC00.I2C3, DeviceObj)
    External (_SB_.PC00.I2C3.TPD0, DeviceObj)
    External (_SB_.PC00.I2C3.TPD0._STA, MethodObj)    // 0 Arguments
    External (_SB_.PC00.I2C4, DeviceObj)
    External (_SB_.PC00.I2C4.I2CI, UnknownObj)
    External (_SB_.PC00.I2C4.TPI2, UnknownObj)
    External (_SB_.PC00.I2C4.TPL1, DeviceObj)
    External (_SB_.PC00.I2C4.TPL1._STA, MethodObj)    // 0 Arguments
    External (_SB_.PC00.I2C4.TPLM, UnknownObj)
    External (_SB_.PC00.I2C5, DeviceObj)
    External (_SB_.PC00.I2C5.I2CI, UnknownObj)
    External (_SB_.PC00.I2C5.TPI2, UnknownObj)
    External (_SB_.PC00.I2C5.TPL1, DeviceObj)
    External (_SB_.PC00.I2C5.TPL1._STA, MethodObj)    // 0 Arguments
    External (_SB_.PC00.I2C5.TPLM, UnknownObj)
    External (_SB_.PC00.RP01, DeviceObj)
    External (_SB_.PC00.RP01.PRTP, IntObj)
    External (_SB_.PC00.RP01.RD3C, IntObj)
    External (_SB_.PC00.RP01.SLOT, IntObj)
    External (_SB_.PC00.RP01.VDID, UnknownObj)
    External (_SB_.PC00.RP02, DeviceObj)
    External (_SB_.PC00.RP02.PRTP, IntObj)
    External (_SB_.PC00.RP02.RD3C, IntObj)
    External (_SB_.PC00.RP02.SLOT, IntObj)
    External (_SB_.PC00.RP02.VDID, UnknownObj)
    External (_SB_.PC00.RP03, DeviceObj)
    External (_SB_.PC00.RP03.PRTP, IntObj)
    External (_SB_.PC00.RP03.RD3C, IntObj)
    External (_SB_.PC00.RP03.SLOT, IntObj)
    External (_SB_.PC00.RP03.VDID, UnknownObj)
    External (_SB_.PC00.RP04, DeviceObj)
    External (_SB_.PC00.RP04.PRTP, IntObj)
    External (_SB_.PC00.RP04.PXSX, DeviceObj)
    External (_SB_.PC00.RP04.RD3C, IntObj)
    External (_SB_.PC00.RP04.SLOT, IntObj)
    External (_SB_.PC00.RP04.VDID, UnknownObj)
    External (_SB_.PC00.RP05, DeviceObj)
    External (_SB_.PC00.RP05.D3HT, FieldUnitObj)
    External (_SB_.PC00.RP05.DL23, MethodObj)    // 0 Arguments
    External (_SB_.PC00.RP05.DVES, MethodObj)    // 0 Arguments
    External (_SB_.PC00.RP05.L23D, MethodObj)    // 0 Arguments
    External (_SB_.PC00.RP05.PDOD, UnknownObj)
    External (_SB_.PC00.RP05.PGRT, UnknownObj)
    External (_SB_.PC00.RP05.PRTP, IntObj)
    External (_SB_.PC00.RP05.PXSX, DeviceObj)
    External (_SB_.PC00.RP05.RD3C, IntObj)
    External (_SB_.PC00.RP05.SLOT, IntObj)
    External (_SB_.PC00.RP05.VDID, UnknownObj)
    External (_SB_.PC00.RP06, DeviceObj)
    External (_SB_.PC00.RP06.PRTP, IntObj)
    External (_SB_.PC00.RP06.RD3C, IntObj)
    External (_SB_.PC00.RP06.SLOT, IntObj)
    External (_SB_.PC00.RP06.VDID, UnknownObj)
    External (_SB_.PC00.XDCI, DeviceObj)
    External (_SB_.PC00.XDCI.DVID, UnknownObj)
    External (_SB_.PC00.XDCI.XDBA, MethodObj)    // 0 Arguments
    External (_SB_.PC00.XHCI, DeviceObj)
    External (_SB_.PC00.XHCI.RHUB, DeviceObj)
    External (_SB_.SGOV, MethodObj)    // 2 Arguments
    External (_SB_.SGRA, MethodObj)    // 2 Arguments
    External (_SB_.SHPO, MethodObj)    // 2 Arguments
    External (ADBG, MethodObj)    // 1 Arguments
    External (AUDD, FieldUnitObj)
    External (GBED, UnknownObj)
    External (GBES, UnknownObj)
    External (GPDI, UnknownObj)
    External (GPI1, UnknownObj)
    External (GPLI, UnknownObj)
    External (IC0D, FieldUnitObj)
    External (IC1D, FieldUnitObj)
    External (IC1S, FieldUnitObj)
    External (PEP0, UnknownObj)
    External (PFCP, UnknownObj)
    External (PIN_.OFF_, MethodObj)    // 1 Arguments
    External (PIN_.ON__, MethodObj)    // 1 Arguments
    External (PIN_.STA_, MethodObj)    // 1 Arguments
    External (PPDI, UnknownObj)
    External (PPSP, UnknownObj)
    External (PPSR, UnknownObj)
    External (PRST, UnknownObj)
    External (PSPE, UnknownObj)
    External (PSPR, UnknownObj)
    External (PSWP, UnknownObj)
    External (SDPP, UnknownObj)
    External (SDRP, UnknownObj)
    External (SDS0, FieldUnitObj)
    External (SDS1, FieldUnitObj)
    External (SHSB, FieldUnitObj)
    External (SPCO, MethodObj)    // 2 Arguments
    External (SSDP, UnknownObj)
    External (SSDR, UnknownObj)
    External (T0EP, UnknownObj)
    External (T0IP, UnknownObj)
    External (T0PE, UnknownObj)
    External (T0PR, UnknownObj)
    External (T0RP, UnknownObj)
    External (T1EP, UnknownObj)
    External (T1IP, UnknownObj)
    External (T1PE, UnknownObj)
    External (T1PR, UnknownObj)
    External (T1RP, UnknownObj)
    External (TPDM, UnknownObj)
    External (TPDT, UnknownObj)
    External (TPLS, UnknownObj)
    External (TPLT, UnknownObj)
    External (UAMS, UnknownObj)
    External (VRRD, FieldUnitObj)
    External (WCLK, UnknownObj)
    External (WFCP, UnknownObj)
    External (WLWK, UnknownObj)
    External (WPRP, UnknownObj)
    External (WWKP, UnknownObj)
    External (XDCE, UnknownObj)

    Debug = "[LNL M RVP RTD3 SSDT][AcpiTableEntry]"
    Debug = Timer
    ADBG ("[LNL M RVP RTD3 SSDT][AcpiTableEntry]")
    Scope (\_SB.PC00.RP05)
    {
        Name (RSTG, Package (0x02)
        {
            Zero, 
            Zero
        })
        RSTG [Zero] = SSDR /* External reference */
        RSTG [One] = SDRP /* External reference */
        Name (PWRG, Package (0x02)
        {
            Zero, 
            Zero
        })
        PWRG [Zero] = SSDP /* External reference */
        PWRG [One] = SDPP /* External reference */
        Name (WAKG, Zero)
        Name (WAKP, Zero)
        Name (SCLK, 0x03)
        Name (WKEN, Zero)
        Name (WOFF, Zero)
        Name (LNRD, Zero)
        Name (PWRR, Zero)
        Method (_S0W, 0, NotSerialized)  // _S0W: S0 Device Wake State
        {
            ADBG (Concatenate ("_S0W For ", Concatenate ("PCIE RP", Concatenate (Concatenate (" Type (2: PCH, 4: CPU) : ", ToHexString (PRTP)), 
                Concatenate (" And Index : ", ToHexString (SLOT))))))
            If (CondRefOf (RD3C))
            {
                If ((RD3C == 0x02))
                {
                    ADBG (Concatenate ("_S0W - D3 Cold Enable For ", Concatenate ("PCIE RP", Concatenate (Concatenate (" Type (2: PCH, 4: CPU) : ", ToHexString (PRTP)), 
                        Concatenate (" And Index : ", ToHexString (SLOT))))))
                    Return (0x04)
                }
            }

            ADBG (Concatenate ("_S0W - D0 For ", Concatenate ("PCIE RP", Concatenate (Concatenate (" Type (2: PCH, 4: CPU) : ", ToHexString (PRTP)), 
                Concatenate (" And Index : ", ToHexString (SLOT))))))
            Return (Zero)
        }

        Method (_DSW, 3, NotSerialized)  // _DSW: Device Sleep Wake
        {
            ADBG (Concatenate ("_DSW For ", Concatenate ("PCIE RP", Concatenate (Concatenate (" Type (2: PCH, 4: CPU) : ", ToHexString (PRTP)), 
                Concatenate (" And Index : ", ToHexString (SLOT))))))
            If (Arg1)
            {
                WKEN = One
                ADBG (Concatenate ("_DSW Sx Wake Enable For ", Concatenate ("PCIE RP", Concatenate (Concatenate (" Type (2: PCH, 4: CPU) : ", ToHexString (PRTP)), 
                    Concatenate (" And Index : ", ToHexString (SLOT))))))
            }
            ElseIf ((Arg0 && Arg2))
            {
                WKEN = One
                ADBG (Concatenate ("_DSW D3 Wake Enable For ", Concatenate ("PCIE RP", Concatenate (Concatenate (" Type (2: PCH, 4: CPU) : ", ToHexString (PRTP)), 
                    Concatenate (" And Index : ", ToHexString (SLOT))))))
            }
            Else
            {
                WKEN = Zero
                ADBG (Concatenate ("_DSW D0 Wake Disable For ", Concatenate ("PCIE RP", Concatenate (Concatenate (" Type (2: PCH, 4: CPU) : ", ToHexString (PRTP)), 
                    Concatenate (" And Index : ", ToHexString (SLOT))))))
            }
        }

        Method (PPS0, 0, Serialized)
        {
            ADBG (Concatenate ("PPS0 For ", Concatenate ("PCIE RP", Concatenate (Concatenate (" Type (2: PCH, 4: CPU) : ", ToHexString (PRTP)), 
                Concatenate (" And Index : ", ToHexString (SLOT))))))
            ADBG (Concatenate ("VDID - ", ToHexString (VDID)))
            ADBG (Concatenate ("Power Stat: ", ToHexString (D3HT)))
        }

        Method (PPS3, 0, Serialized)
        {
            ADBG (Concatenate ("PPS3 For ", Concatenate ("PCIE RP", Concatenate (Concatenate (" Type (2: PCH, 4: CPU) : ", ToHexString (PRTP)), 
                Concatenate (" And Index : ", ToHexString (SLOT))))))
            ADBG (Concatenate ("VDID - ", ToHexString (VDID)))
            ADBG (Concatenate ("Power Stat: ", ToHexString (D3HT)))
        }

        PowerResource (PXP, 0x00, 0x0000)
        {
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                ADBG (Concatenate ("PXP _STA Entry For ", Concatenate ("PCIE RP", Concatenate (Concatenate (" Type (2: PCH, 4: CPU) : ", ToHexString (PRTP)), 
                    Concatenate (" And Index : ", ToHexString (SLOT))))))
                If ((VDID == 0xFFFFFFFF))
                {
                    ADBG ("_STA return 0 as VDID = 0xFFFFFFFF")
                    Return (Zero)
                }

                If ((GPRS () == Zero))
                {
                    Return (Zero)
                }

                Return (PSTA ())
            }

            Method (_ON, 0, NotSerialized)  // _ON_: Power On
            {
                ADBG (Concatenate ("PXP _ON Entry For ", Concatenate ("PCIE RP", Concatenate (Concatenate (" Type (2: PCH, 4: CPU) : ", ToHexString (PRTP)), 
                    Concatenate (" And Index : ", ToHexString (SLOT))))))
                If ((VDID == 0xFFFFFFFF))
                {
                    ADBG ("_ON return as VDID = 0xFFFFFFFF")
                }
                ElseIf ((GPRS () == Zero)){}
                Else
                {
                    PON ()
                    L23D ()
                }
            }

            Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
            {
                ADBG (Concatenate ("PXP _OFF Entry For ", Concatenate ("PCIE RP", Concatenate (Concatenate (" Type (2: PCH, 4: CPU) : ", ToHexString (PRTP)), 
                    Concatenate (" And Index : ", ToHexString (SLOT))))))
                If ((VDID == 0xFFFFFFFF))
                {
                    ADBG ("_OFF return as VDID = 0xFFFFFFFF")
                }
                ElseIf ((GPRS () == Zero)){}
                Else
                {
                    DL23 ()
                    POFF ()
                }
            }
        }

        Method (GPPR, 0, NotSerialized)
        {
            ADBG (Concatenate ("GPPR Entry For ", Concatenate ("PCIE RP", Concatenate (Concatenate (" Type (2: PCH, 4: CPU) : ", ToHexString (PRTP)), 
                Concatenate (" And Index : ", ToHexString (SLOT))))))
            If (CondRefOf (WAKP))
            {
                If (((WAKP != Zero) && (WKEN == Zero)))
                {
                    ADBG (Concatenate ("WAKE enable and keep CIO power on for ", Concatenate ("PCIE RP", Concatenate (Concatenate (" Type (2: PCH, 4: CPU) : ", ToHexString (PRTP)), 
                        Concatenate (" And Index : ", ToHexString (SLOT))))))
                    Return (Zero)
                }
            }

            If (CondRefOf (PWRR))
            {
                If ((PWRR != Zero))
                {
                    ADBG (Concatenate ("PCIe slot power removal blocked For ", Concatenate ("PCIE RP", Concatenate (Concatenate (" Type (2: PCH, 4: CPU) : ", ToHexString (PRTP)), 
                        Concatenate (" And Index : ", ToHexString (SLOT))))))
                    Return (Zero)
                }
            }

            If (CondRefOf (DVES))
            {
                If ((DVES () == Zero))
                {
                    ADBG (Concatenate ("DG Device core power removal is Denied for ", Concatenate ("PCIE RP", Concatenate (Concatenate (" Type (2: PCH, 4: CPU) : ", ToHexString (PRTP)), 
                        Concatenate (" And Index : ", ToHexString (SLOT))))))
                    Return (Zero)
                }
            }

            Return (One)
        }

        Method (GPRS, 0, NotSerialized)
        {
            ADBG (Concatenate ("GPRS Entry For ", Concatenate ("PCIE RP", Concatenate (Concatenate (" Type (2: PCH, 4: CPU) : ", ToHexString (PRTP)), 
                Concatenate (" And Index : ", ToHexString (SLOT))))))
            If (CondRefOf (PGRT))
            {
                If ((PGRT == Zero))
                {
                    Return (Zero)
                }
            }

            If (CondRefOf (RD3C))
            {
                If ((RD3C != 0x02))
                {
                    ADBG (Concatenate ("Skiping D3 Flow as D3Cold support is Disable for ", Concatenate ("PCIE RP", Concatenate (Concatenate (" Type (2: PCH, 4: CPU) : ", ToHexString (PRTP)), 
                        Concatenate (" And Index : ", ToHexString (SLOT))))))
                    Return (Zero)
                }
            }

            Return (One)
        }

        Method (PSTA, 0, NotSerialized)
        {
            ADBG (Concatenate ("PSTA Entry For ", Concatenate ("PCIE RP", Concatenate (Concatenate (" Type (2: PCH, 4: CPU) : ", ToHexString (PRTP)), 
                Concatenate (" And Index : ", ToHexString (SLOT))))))
            If (\PIN.STA (RSTG))
            {
                ADBG (Concatenate ("PSTA OFF For ", Concatenate ("PCIE RP", Concatenate (Concatenate (" Type (2: PCH, 4: CPU) : ", ToHexString (PRTP)), 
                    Concatenate (" And Index : ", ToHexString (SLOT))))))
                Return (Zero)
            }
            Else
            {
                ADBG (Concatenate ("PSTA ON For", Concatenate ("PCIE RP", Concatenate (Concatenate (" Type (2: PCH, 4: CPU) : ", ToHexString (PRTP)), 
                    Concatenate (" And Index : ", ToHexString (SLOT))))))
                Return (One)
            }
        }

        Method (PON, 0, NotSerialized)
        {
            ADBG (Concatenate ("PON Entry For ", Concatenate ("PCIE RP", Concatenate (Concatenate (" Type (2: PCH, 4: CPU) : ", ToHexString (PRTP)), 
                Concatenate (" And Index : ", ToHexString (SLOT))))))
            If (CondRefOf (WAKG))
            {
                \_SB.SHPO (WAKG, One)
                ADBG (Concatenate ("WAKG: set GPIO mode ", Concatenate ("PCIE RP", Concatenate (Concatenate (" Type (2: PCH, 4: CPU) : ", ToHexString (PRTP)), 
                    Concatenate (" And Index : ", ToHexString (SLOT))))))
                \_SB.CAGS (WAKG)
            }

            If (CondRefOf (PWRG))
            {
                If (CondRefOf (WOFF))
                {
                    If ((WOFF != Zero))
                    {
                        Local0 = ((Timer - WOFF) / 0x2710)
                        If ((Local0 < PDOD))
                        {
                            Sleep ((PDOD - Local0))
                            ADBG (Concatenate ("Rtd3Pcie Generic _ON Sleep time : ", ToHexString ((PDOD - Local0))))
                            ADBG (Concatenate ("Rtd3Pcie Generic _ON Local0 time : ", ToHexString (Local0)))
                        }

                        WOFF = Zero
                    }
                }

                ADBG (Concatenate ("Rtd3Pcie Generic _ON PDOD time : ", ToHexString (PDOD)))
                ADBG (Concatenate ("Rtd3Pcie Generic _ON Current time : ", ToHexString (Timer)))
                \PIN.ON (PWRG)
                Sleep (PEP0)
            }

            If (CondRefOf (SCLK))
            {
                SPCO (SCLK, One)
            }

            \PIN.OFF (RSTG)
        }

        Method (POFF, 0, NotSerialized)
        {
            ADBG (Concatenate ("POFF Entry For ", Concatenate ("PCIE RP", Concatenate (Concatenate (" Type (2: PCH, 4: CPU) : ", ToHexString (PRTP)), 
                Concatenate (" And Index : ", ToHexString (SLOT))))))
            Local1 = (LNRD / 0x03E8)
            Sleep (Local1)
            \PIN.ON (RSTG)
            If (CondRefOf (SCLK))
            {
                SPCO (SCLK, Zero)
            }

            If (CondRefOf (PWRG))
            {
                If ((GPPR () == One))
                {
                    \PIN.OFF (PWRG)
                }

                If (CondRefOf (WOFF))
                {
                    WOFF = Timer
                }
            }

            If (CondRefOf (WAKG))
            {
                If (((WAKG != Zero) && WKEN))
                {
                    \_SB.SHPO (WAKG, Zero)
                    ADBG (Concatenate ("WAKG: set ACPI mode ", Concatenate ("PCIE RP", Concatenate (Concatenate (" Type (2: PCH, 4: CPU) : ", ToHexString (PRTP)), 
                        Concatenate (" And Index : ", ToHexString (SLOT))))))
                }
            }

            ADBG (Concatenate ("Rtd3Pcie _OFF TOFF time : ", ToHexString (WOFF)))
        }

        Method (_PR0, 0, NotSerialized)  // _PR0: Power Resources for D0
        {
            Return (Package (0x01)
            {
                PXP
            })
        }

        Method (_PR3, 0, NotSerialized)  // _PR3: Power Resources for D3hot
        {
            Return (Package (0x01)
            {
                PXP
            })
        }

        Method (UPRD, 1, Serialized)
        {
            If ((Arg0 <= 0x2710))
            {
                LNRD = Arg0
            }

            Return (LNRD) /* \_SB_.PC00.RP05.LNRD */
        }

        Method (PCPR, 1, Serialized)
        {
            If ((Arg0 == 0x80000000))
            {
                PWRR = One
                Return (0x02)
            }
            ElseIf ((Arg0 == Zero))
            {
                PWRR = Zero
                Return (One)
            }
            Else
            {
                Return (Zero)
            }
        }

        Scope (\_SB.PC00.RP05.PXSX)
        {
            Method (_S0W, 0, NotSerialized)  // _S0W: S0 Device Wake State
            {
                ADBG (Concatenate ("_S0W For Child Storage Device Of ", Concatenate ("PCIE RP", Concatenate (Concatenate (" Type (2: PCH, 4: CPU) : ", ToHexString (PRTP)), 
                    Concatenate (" And Index : ", ToHexString (SLOT))))))
                If (CondRefOf (^^RD3C))
                {
                    If ((^^RD3C == 0x02))
                    {
                        ADBG (Concatenate ("_S0W - D3 Cold Enable For Child Device of ", Concatenate ("PCIE RP", Concatenate (Concatenate (" Type (2: PCH, 4: CPU) : ", ToHexString (PRTP)), 
                            Concatenate (" And Index : ", ToHexString (SLOT))))))
                        Return (0x04)
                    }
                    ElseIf ((^^RD3C == Zero))
                    {
                        ADBG (Concatenate ("_S0W - D3 Disable For Child Device of ", Concatenate ("PCIE RP", Concatenate (Concatenate (" Type (2: PCH, 4: CPU) : ", ToHexString (PRTP)), 
                            Concatenate (" And Index : ", ToHexString (SLOT))))))
                        Return (Zero)
                    }
                }

                ADBG (Concatenate ("_S0W - D3 Hot Enable For Child Device of ", Concatenate ("PCIE RP", Concatenate (Concatenate (" Type (2: PCH, 4: CPU) : ", ToHexString (PRTP)), 
                    Concatenate (" And Index : ", ToHexString (SLOT))))))
                Return (0x03)
            }

            Method (_PR0, 0, NotSerialized)  // _PR0: Power Resources for D0
            {
                Return (^^_PR0 ())
            }

            Method (_PR3, 0, NotSerialized)  // _PR3: Power Resources for D3hot
            {
                Return (^^_PR3 ())
            }

            Method (_PS0, 0, Serialized)  // _PS0: Power State 0
            {
                ADBG (Concatenate ("Storage Child Device _PS0 for ", Concatenate ("PCIE RP", Concatenate (Concatenate (" Type (2: PCH, 4: CPU) : ", ToHexString (PRTP)), 
                    Concatenate (" And Index : ", ToHexString (SLOT))))))
            }

            Method (_PS3, 0, Serialized)  // _PS3: Power State 3
            {
                ADBG (Concatenate ("Storage Child Device _PS3 for ", Concatenate ("PCIE RP", Concatenate (Concatenate (" Type (2: PCH, 4: CPU) : ", ToHexString (PRTP)), 
                    Concatenate (" And Index : ", ToHexString (SLOT))))))
            }
        }
    }

    If ((GBES != Zero))
    {
        Scope (\_SB.PC00.GLAN)
        {
            Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
            {
                ADBG ("GBE PS3")
            }

            Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
            {
                If (!GBED)
                {
                    ADBG ("GBE PS0")
                }
            }
        }
    }

    Scope (\_SB.PC00)
    {
        PowerResource (PAUD, 0x00, 0x0000)
        {
            Name (PSTA, One)
            Name (ONTM, Zero)
            Name (_STA, One)  // _STA: Status
            Method (_ON, 0, NotSerialized)  // _ON_: Power On
            {
                ADBG ("Audio Codec LON")
                _STA = One
                PUAM ()
            }

            Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
            {
                ADBG ("Audio Codec LOFF")
                _STA = Zero
                PUAM ()
            }

            Method (PUAM, 0, Serialized)
            {
                If (((^_STA == Zero) && (\UAMS != Zero)))
                {
                    ADBG ("PAUD-PUAM OFF")
                }
                Else
                {
                    ADBG ("PAUD-PUAM ON")
                    If ((^PSTA != One))
                    {
                        ^PSTA = One
                        ^ONTM = Timer
                        ADBG ("Audio Codec ON")
                    }
                }
            }
        }
    }

    If ((\_SB.PC00.HDAS.VDID != 0xFFFFFFFF))
    {
        Scope (\_SB.PC00.HDAS)
        {
            Method (PS0X, 0, Serialized)
            {
                ADBG ("HDAS.PS0X")
                If ((\_SB.PC00.PAUD.ONTM == Zero))
                {
                    Return (Zero)
                }

                Local0 = ((Timer - \_SB.PC00.PAUD.ONTM) / 0x2710)
                Local1 = (AUDD + VRRD) /* External reference */
                If ((Local0 < Local1))
                {
                    Sleep ((Local1 - Local0))
                }
            }

            Name (_PR0, Package (0x01)  // _PR0: Power Resources for D0
            {
                \_SB.PC00.PAUD
            })
        }
    }

    Scope (\_SB.PC00.I2C3)
    {
        Name (ONTM, Zero)
        Method (PS0X, 0, Serialized)
        {
            ADBG ("I2C3 _PS0")
        }

        Method (PS3X, 0, Serialized)
        {
            ADBG ("I2C3 _PS3")
        }

        If ((TPDT != Zero))
        {
            PowerResource (PXTC, 0x00, 0x0000)
            {
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    ADBG ("I2C3 TPD _STA ON")
                    Return (One)
                }

                Method (_ON, 0, NotSerialized)  // _ON_: Power On
                {
                    ADBG ("I2C3 Tpd PWR ON")
                    If ((TPDM == One))
                    {
                        \_SB.SGRA (GPDI, One)
                    }
                }

                Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
                {
                    ADBG ("I2C3 Tpd PWR OFF")
                    If ((TPDM == One))
                    {
                        \_SB.SGRA (GPDI, Zero)
                    }
                }
            }
        }

        If ((TPDT != Zero))
        {
            Scope (TPD0)
            {
                Name (TD_N, "TPD0")
                Name (TD_P, Package (0x01)
                {
                    \_SB.PC00.I2C3.PXTC
                })
                Alias (IC0D, TD_D)
                Alias (\_SB.PC00.I2C3.ONTM, TD_C)
                Method (PS0X, 0, Serialized)
                {
                    ADBG (Concatenate (TD_N, " D0"))
                    If ((TD_C == Zero))
                    {
                        Return (Zero)
                    }

                    Local0 = ((Timer - TD_C) / 0x2710)
                    Local1 = (TD_D + VRRD) /* External reference */
                    If ((Local0 < Local1))
                    {
                        Sleep ((Local1 - Local0))
                    }
                }

                Method (PS3X, 0, Serialized)
                {
                    ADBG (Concatenate (TD_N, " D3"))
                }

                Method (_PR0, 0, NotSerialized)  // _PR0: Power Resources for D0
                {
                    If ((_STA () == 0x0F))
                    {
                        Return (TD_P) /* \_SB_.PC00.I2C3.TPD0.TD_P */
                    }
                    Else
                    {
                        Return (Package (0x00){})
                    }
                }

                Method (_PR3, 0, NotSerialized)  // _PR3: Power Resources for D3hot
                {
                    If ((_STA () == 0x0F))
                    {
                        Return (TD_P) /* \_SB_.PC00.I2C3.TPD0.TD_P */
                    }
                    Else
                    {
                        Return (Package (0x00){})
                    }
                }

                Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                {
                    PS0X ()
                }

                Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                {
                    PS3X ()
                }
            }
        }
    }

    Scope (\_SB.PC00.I2C4)
    {
        Name (ONTM, Zero)
        Name (TPPE, Zero)
        Name (TPPR, Zero)
        Name (TPIP, Zero)
        Name (TPEP, Zero)
        Name (TPRP, Zero)
        Name (TPI2, Zero)
        TPPE = T0PE /* External reference */
        TPPR = T0PR /* External reference */
        TPIP = T0IP /* External reference */
        TPEP = T0EP /* External reference */
        TPRP = T0RP /* External reference */
        TPI2 = GPLI /* External reference */
        If ((TPLT != Zero))
        {
            If ((TPLS == One))
            {
                Method (PS0X, 0, Serialized)
                {
                    ADBG (Concatenate ("_PS0 I2C controller= ", ToHexString (I2CI)))
                }

                Method (PS3X, 0, Serialized)
                {
                    ADBG (Concatenate ("_PS3 I2C controller= ", ToHexString (I2CI)))
                }

                If ((TPLT != Zero))
                {
                    PowerResource (PTPL, 0x00, 0x0000)
                    {
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            If ((\_SB.GGOV (TPPE) == One))
                            {
                                ADBG (Concatenate ("TPL _STA ON I2C controller= ", ToHexString (I2CI)))
                                Return (One)
                            }
                            Else
                            {
                                ADBG (Concatenate ("TPL _STA OFF I2C controller= ", ToHexString (I2CI)))
                                Return (Zero)
                            }
                        }

                        Method (_ON, 0, NotSerialized)  // _ON_: Power On
                        {
                            ADBG (Concatenate ("Touch PWR ON I2C controller= ", ToHexString (I2CI)))
                            \_SB.SGOV (TPPE, TPEP)
                            Sleep (0x02)
                            \_SB.SGOV (TPPR, TPRP)
                            ONTM = Timer
                            If ((TPLM == One))
                            {
                                \_SB.SGRA (TPI2, One)
                            }
                        }

                        Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
                        {
                            ADBG (Concatenate ("Touch PWR OFF I2C controller= ", ToHexString (I2CI)))
                            If ((TPLM == One))
                            {
                                \_SB.SGRA (TPI2, Zero)
                            }

                            Local0 = (TPRP ^ One)
                            \_SB.SGOV (TPPR, Local0)
                            Sleep (0x03)
                            Local0 = (TPEP ^ One)
                            \_SB.SGOV (TPPE, Local0)
                            ONTM = Zero
                        }
                    }
                }

                Scope (TPL1)
                {
                    Name (TD_P, Package (0x01)
                    {
                        \_SB.PC00.I2C4.PTPL
                    })
                    Alias (\_SB.PC00.I2C4.ONTM, TD_C)
                    Name (TD_N, "TPL1")
                    Alias (IC1D, TD_D)
                    Method (PS0X, 0, Serialized)
                    {
                        ADBG (Concatenate (TD_N, " D0"))
                        If ((TD_C == Zero))
                        {
                            Return (Zero)
                        }

                        Local0 = ((Timer - TD_C) / 0x2710)
                        Local1 = (TD_D + VRRD) /* External reference */
                        If ((Local0 < Local1))
                        {
                            Sleep ((Local1 - Local0))
                        }
                    }

                    Method (PS3X, 0, Serialized)
                    {
                        ADBG (Concatenate (TD_N, " D3"))
                    }

                    Method (_PR0, 0, NotSerialized)  // _PR0: Power Resources for D0
                    {
                        If ((_STA () == 0x0F))
                        {
                            Return (TD_P) /* \_SB_.PC00.I2C4.TPL1.TD_P */
                        }
                        Else
                        {
                            Return (Package (0x00){})
                        }
                    }

                    Method (_PR3, 0, NotSerialized)  // _PR3: Power Resources for D3hot
                    {
                        If ((_STA () == 0x0F))
                        {
                            Return (TD_P) /* \_SB_.PC00.I2C4.TPL1.TD_P */
                        }
                        Else
                        {
                            Return (Package (0x00){})
                        }
                    }

                    Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                    {
                        PS0X ()
                    }

                    Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                    {
                        PS3X ()
                    }
                }
            }
        }
    }

    Scope (\_SB.PC00.I2C5)
    {
        Name (ONTM, Zero)
        Name (TPPE, Zero)
        Name (TPPR, Zero)
        Name (TPIP, Zero)
        Name (TPEP, Zero)
        Name (TPRP, Zero)
        Name (TPI2, Zero)
        TPPE = T1PE /* External reference */
        TPPR = T1PR /* External reference */
        TPIP = T1IP /* External reference */
        TPEP = T1EP /* External reference */
        TPRP = T1RP /* External reference */
        TPI2 = \GPI1 /* External reference */
        If ((TPLT != Zero))
        {
            If ((TPLS == One))
            {
                Method (PS0X, 0, Serialized)
                {
                    ADBG (Concatenate ("_PS0 I2C controller= ", ToHexString (I2CI)))
                }

                Method (PS3X, 0, Serialized)
                {
                    ADBG (Concatenate ("_PS3 I2C controller= ", ToHexString (I2CI)))
                }

                If ((TPLT != Zero))
                {
                    PowerResource (PTPL, 0x00, 0x0000)
                    {
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            If ((\_SB.GGOV (TPPE) == One))
                            {
                                ADBG (Concatenate ("TPL _STA ON I2C controller= ", ToHexString (I2CI)))
                                Return (One)
                            }
                            Else
                            {
                                ADBG (Concatenate ("TPL _STA OFF I2C controller= ", ToHexString (I2CI)))
                                Return (Zero)
                            }
                        }

                        Method (_ON, 0, NotSerialized)  // _ON_: Power On
                        {
                            ADBG (Concatenate ("Touch PWR ON I2C controller= ", ToHexString (I2CI)))
                            \_SB.SGOV (TPPE, TPEP)
                            Sleep (0x02)
                            \_SB.SGOV (TPPR, TPRP)
                            ONTM = Timer
                            If ((TPLM == One))
                            {
                                \_SB.SGRA (TPI2, One)
                            }
                        }

                        Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
                        {
                            ADBG (Concatenate ("Touch PWR OFF I2C controller= ", ToHexString (I2CI)))
                            If ((TPLM == One))
                            {
                                \_SB.SGRA (TPI2, Zero)
                            }

                            Local0 = (TPRP ^ One)
                            \_SB.SGOV (TPPR, Local0)
                            Sleep (0x03)
                            Local0 = (TPEP ^ One)
                            \_SB.SGOV (TPPE, Local0)
                            ONTM = Zero
                        }
                    }
                }

                Scope (TPL1)
                {
                    Name (TD_P, Package (0x01)
                    {
                        \_SB.PC00.I2C5.PTPL
                    })
                    Alias (\_SB.PC00.I2C5.ONTM, TD_C)
                    Name (TD_N, "TPL1")
                    Alias (IC1D, TD_D)
                    Method (PS0X, 0, Serialized)
                    {
                        ADBG (Concatenate (TD_N, " D0"))
                        If ((TD_C == Zero))
                        {
                            Return (Zero)
                        }

                        Local0 = ((Timer - TD_C) / 0x2710)
                        Local1 = (TD_D + VRRD) /* External reference */
                        If ((Local0 < Local1))
                        {
                            Sleep ((Local1 - Local0))
                        }
                    }

                    Method (PS3X, 0, Serialized)
                    {
                        ADBG (Concatenate (TD_N, " D3"))
                    }

                    Method (_PR0, 0, NotSerialized)  // _PR0: Power Resources for D0
                    {
                        If ((_STA () == 0x0F))
                        {
                            Return (TD_P) /* \_SB_.PC00.I2C5.TPL1.TD_P */
                        }
                        Else
                        {
                            Return (Package (0x00){})
                        }
                    }

                    Method (_PR3, 0, NotSerialized)  // _PR3: Power Resources for D3hot
                    {
                        If ((_STA () == 0x0F))
                        {
                            Return (TD_P) /* \_SB_.PC00.I2C5.TPL1.TD_P */
                        }
                        Else
                        {
                            Return (Package (0x00){})
                        }
                    }

                    Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                    {
                        PS0X ()
                    }

                    Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                    {
                        PS3X ()
                    }
                }
            }
        }
    }

    Scope (\_SB.PC00.XHCI.RHUB)
    {
        Method (PS0X, 0, Serialized)
        {
            ADBG ("RHUB PS0X")
        }

        Method (PS2X, 0, Serialized)
        {
            ADBG ("RHUB PS2X")
        }

        Method (PS3X, 0, Serialized)
        {
            ADBG ("RHUB PS3X")
        }
    }

    If ((XDCE == One))
    {
        Scope (\_SB)
        {
            PowerResource (USBC, 0x00, 0x0000)
            {
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Method (_ON, 0, NotSerialized)  // _ON_: Power On
                {
                }

                Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
                {
                }
            }
        }

        Scope (\_SB.PC00.XDCI)
        {
            OperationRegion (GENR, SystemMemory, (XDBA () + 0x0010F81C), 0x04)
            Field (GENR, WordAcc, NoLock, Preserve)
            {
                    ,   2, 
                CPME,   1, 
                U3EN,   1, 
                U2EN,   1
            }

            Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
            {
                CPME = One
                U2EN = One
                U3EN = One
                ADBG ("XDC PS3")
            }

            Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
            {
                CPME = Zero
                U2EN = Zero
                U3EN = Zero
                If ((DVID == 0xFFFF))
                {
                    Return (Zero)
                }

                ADBG ("XDC PS0")
            }

            Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
            {
                Return (Zero)
            }

            Method (_PR3, 0, NotSerialized)  // _PR3: Power Resources for D3hot
            {
                Return (Package (0x01)
                {
                    USBC
                })
            }
        }
    }

    Scope (\_GPE)
    {
        Method (AL6F, 0, NotSerialized)
        {
            ADBG ("AL6F Start")
            If (\_SB.ISME (WWKP))
            {
                ADBG ("AL6F WWAN Event")
                \_SB.SHPO (WWKP, One)
                Notify (\_SB.PC00.RP04, 0x02) // Device Wake
                \_SB.CAGS (WWKP)
            }

            If (\_SB.ISME (WLWK))
            {
                ADBG ("AL6F WLAN")
                \_SB.SHPO (WLWK, One)
                Notify (\_SB.PC00.RP03, 0x02) // Device Wake
                \_SB.CAGS (WLWK)
            }

            If (\_SB.ISME (PSWP))
            {
                ADBG ("AL6F X1 PCIe slot")
                \_SB.SHPO (PSWP, One)
                Notify (\_SB.PC00.RP02, 0x02) // Device Wake
                \_SB.CAGS (PSWP)
            }

            ADBG ("AL6F End")
        }
    }

    ADBG ("[LNL M RVP RTD3 SSDT][AcpiTableExit]")
    Debug = "[LNL M RVP RTD3 SSDT][AcpiTableExit]"
    Debug = Timer
}

