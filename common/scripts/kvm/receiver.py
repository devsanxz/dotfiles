#!/usr/bin/env python3
import evdev
import sys

# === RECEIVER SETUP ===
# Create a virtual device with ALL capabilities
# This ensures it acts as both Mouse and Keyboard
cap = {
    evdev.ecodes.EV_KEY: evdev.ecodes.keys.keys(),
    evdev.ecodes.EV_REL: [evdev.ecodes.REL_X, evdev.ecodes.REL_Y, evdev.ecodes.REL_WHEEL],
    evdev.ecodes.EV_MSC: [evdev.ecodes.MSC_SCAN],
    evdev.ecodes.EV_LED: [evdev.ecodes.LED_SCROLLL, evdev.ecodes.LED_NUML, evdev.ecodes.LED_CAPSL]
}

try:
    uinput = evdev.UInput(cap, name="Neural-Link-Virtual-Input")
    sys.stderr.write(">>> RECEIVER LISTENING via STDIN...\n")
except OSError as e:
    sys.stderr.write(f"Critical Error: {e}\nAre you root? Is uinput loaded?\n")
    sys.exit(1)

# === EVENT LOOP ===
for line in sys.stdin:
    try:
        # Parse "Type,Code,Value"
        parts = line.strip().split(',')
        if len(parts) != 3: continue
        
        etype, ecode, evalue = map(int, parts)
        
        # Inject into Kernel
        uinput.write(etype, ecode, evalue)
        uinput.syn() # Sync is crucial
        
    except ValueError:
        continue
    except OSError:
        sys.stderr.write("Pipe broken. Exiting.\n")
        break
