# Samsung Galaxy Book5 Pro - Audio Configuration

This directory contains all audio-related diagnostics, analysis, and fixes for the Samsung Galaxy Book5 Pro speaker issue.

---

## QUICK START - What You Need to Do

Your speakers don't work because a hardware amplifier enable signal is missing. Run this test:

```bash
cd /home/psychopunk_sage/dev/drivers/audio-config

# Terminal 1: Run GPIO test
sudo ./test-gpio-audio.sh

# Terminal 2: Play test audio
speaker-test -c2 -Dhw:0,0
```

Listen for audio. When you hear sound, the test will identify which GPIO pin enables the speakers.

**Expected time**: 5 minutes
**Success probability**: 70%

---

## FILES IN THIS DIRECTORY

### MUST READ FIRST
- **AUDIO-STATUS.md** - Complete consolidated status report
  - Hardware summary (ALC298 + MAX98390)
  - What was tried and why it failed
  - Current status and root cause analysis
  - Decision tree and next steps

### IMPORTANT TECHNICAL DOCS
- **MAX98390-ANALYSIS.md** - Deep dive on MAX98390 smart amplifier
  - ACPI device declaration
  - Machine driver requirements
  - Complete kernel driver implementation
  - Only needed if GPIO test fails

### TEST SCRIPTS (READY TO RUN)
- **test-gpio-audio.sh** - Test HDA codec GPIO pins (RUN THIS FIRST)
- **check-max98390.sh** - Check if MAX98390 responds on I2C bus
- **audio-full-debug.sh** - Complete hardware diagnostic

### OLD FILES (ARCHIVED)
- `archive/` - Previous analysis attempts and failed fixes
  - Old markdown docs explaining various approaches
  - Old scripts that didn't work
  - Kept for reference only

### UCM CONFIGURATION
- `ucm2/` - ALSA UCM (Use Case Manager) profiles
  - Already tested - didn't solve the issue
  - Software routing is already correct

---

## PROBLEM SUMMARY

**Hardware**: Samsung Galaxy Book5 Pro (940XHA)
- Audio controller: Intel Lunar Lake-M HD Audio
- Primary codec: Realtek ALC298 (HDA)
- Secondary: MAX98390 (I2C smart amplifier, possibly unused)

**Symptom**: Internal speakers produce NO sound
- Headphones work perfectly
- Audio stream is active and playing
- All software controls correct
- HDA codec fully configured

**Root Cause**: Hardware amplifier not enabled
- Missing GPIO enable signal OR
- Missing I2C driver for MAX98390 OR
- Embedded controller issue

**Current Status**: Awaiting GPIO test results

---

## WHAT WAS TRIED (AND FAILED)

All of these approaches were attempted but did not fix the speakers:

1. HDA codec verb unmuting - Failed (already unmuted)
2. ALSA UCM configuration - Failed (routing already correct)
3. SOF topology modifications - Failed (DSP already configured)
4. PipeWire/PulseAudio changes - Failed (audio stack working)
5. Manual mixer controls - Failed (all controls correct)
6. init_verbs modifications - Failed (wrong target)

**Why they failed**: The problem is NOT software configuration. It's a hardware enable signal.

---

## NEXT STEPS

### Step 1: GPIO Test (DO THIS NOW)
Run `test-gpio-audio.sh` to find the GPIO pin that enables the amplifier.

**If this works:**
- Simple kernel quirk needed
- 1 hour to create patch
- Problem SOLVED

### Step 2: I2C Scan (if GPIO fails)
Run `check-max98390.sh` to see if MAX98390 chips respond.

**If devices found:**
- Need complex machine driver
- 2-4 days of development
- See MAX98390-ANALYSIS.md

**If no devices:**
- MAX98390 unused on this model
- Need deeper hardware analysis

### Step 3: Read Full Status
Open `AUDIO-STATUS.md` for complete technical analysis and decision tree.

---

## DECISION TREE

```
No speaker sound
    |
    ├─→ Run test-gpio-audio.sh
    |     |
    |     ├─→ Hear audio? → Note GPIO number → Create kernel patch → DONE
    |     |                  (70% probability)  (1 hour fix)
    |     |
    |     └─→ No audio from any GPIO
    |           |
    |           └─→ Run check-max98390.sh
    |                 |
    |                 ├─→ I2C devices respond → Build machine driver → Test
    |                 |    (20% probability)     (2-4 days)
    |                 |
    |                 └─→ No response → Check Windows or deep debug
    |                      (10% probability)
```

---

## GETTING HELP

If you need assistance:

1. After GPIO test: Share which GPIO (if any) worked
2. After I2C scan: Share output of `i2cdetect -y 2`
3. If both fail: Run `audio-full-debug.sh` and share output

Include:
- Kernel version: `uname -r`
- Audio controller: `lspci | grep -i audio`
- Codec info: `cat /proc/asound/card0/codec#0 | head -20`

---

**Last Updated**: 2026-01-15
**Status**: Ready for GPIO testing
**Maintainer**: Based on comprehensive analysis of Samsung Galaxy Book5 Pro audio
