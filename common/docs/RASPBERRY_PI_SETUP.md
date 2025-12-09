# Raspberry Pi 4 - Video & Performance Setup

Guide for optimizing the Manjaro ARM environment on Raspberry Pi 4.

## 1. Video Pipeline (Fix RGB Range)
The default `vc4` driver negotiation often results in "Limited Range" (16-235), causing washed-out colors.

### Diagnosis
```bash
modetest -c | grep "Broadcast RGB" -A 4
# Value 0 (Automatic) or 2 (Limited) indicates the issue.
```

### Fix (Kernel Argument)
Append `video=HDMI-A-2:broadcast_rgb=full` to `/boot/cmdline.txt`.
*Adjust `HDMI-A-2` to `HDMI-A-1` if using the other port.*

**Command:**
```bash
sudo sed -i 's/$/ video=HDMI-A-2:broadcast_rgb=full/' /boot/cmdline.txt
sudo reboot
```

> **⚠️ CRITICAL TV SETTING:**
> You MUST enable **"PC Mode"** or set **"HDMI Black Level: High"** on your TV's input settings.
> If the Kernel sends Full Range (0-255) and the TV expects Limited (16-235), you will lose shadow details (Black Crush).

## 2. Memory Optimization (2GB RAM)
*   **ZRAM:** Ensure it is active (`zramctl`).
*   **Swappiness:** Set `vm.swappiness=100` to aggressively use ZRAM over SD Card swap.
