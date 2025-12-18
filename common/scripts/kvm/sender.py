#!/usr/bin/env python3
import evdev
import sys
import select
from evdev import ecodes

# === CONFIGURATION ===
# Based on your 'identifydevices.txt'
KBD_PATH = "/dev/input/event4"   # Note Built-in Keyboard
MOUSE_PATH = "/dev/input/event16" # USB Optical Mouse

# === SETUP ===
try:
    kbd = evdev.InputDevice(KBD_PATH)
    mouse = evdev.InputDevice(MOUSE_PATH)
except FileNotFoundError as e:
    sys.stderr.write(f"Critical Error: Device not found ({e}). Check paths.\n")
    sys.exit(1)

active = False

def set_led(state):
    """Toggle Scroll Lock LED on the keyboard to indicate status."""
    try:
        val = 1 if state else 0
        kbd.write(ecodes.EV_LED, ecodes.LED_SCROLLL, val)
        kbd.syn()
    except OSError:
        pass

def toggle_state():
    global active
    active = not active
    
    if active:
        try:
            kbd.grab()
            mouse.grab()
            set_led(True)
            sys.stderr.write(">>> [REMOTE] LINK ENGAGED. Controlling Pi.\n")
        except OSError:
            sys.stderr.write("Error: Could not grab devices. Run as root.\n")
            active = False
    else:
        try:
            kbd.ungrab()
            mouse.ungrab()
            set_led(False)
            sys.stderr.write("<<< [LOCAL] LINK DROPPED. Controlling Note.\n")
        except OSError:
            pass

# === MAIN LOOP ===
sys.stderr.write(f"--- NEURAL LINK SENDER ---
")
sys.stderr.write(f"KBD: {kbd.name}\nMOUSE: {mouse.name}\n")
sys.stderr.write("Press 'SCROLL LOCK' to toggle control.\n")

# Ensure clean state start
set_led(False)

devices = {kbd.fd: kbd, mouse.fd: mouse}

try:
    while True:
        # Blocking wait for events
        r, w, x = select.select(devices, [], [])
        
        for fd in r:
            dev = devices[fd]
            for event in dev.read():
                
                # Detect Scroll Lock Toggle (Only on Keyboard)
                if dev == kbd and event.type == ecodes.EV_KEY and event.code == ecodes.KEY_SCROLLLOCK and event.value == 1:
                    toggle_state()
                    continue # Do not send the toggle key itself

                # If Active, transmit everything
                if active:
                    # Filter out repeats to save bandwidth? No, keeps it raw.
                    sys.stdout.write(f"{event.type},{event.code},{event.value}\n")
                    sys.stdout.flush()

except KeyboardInterrupt:
    sys.stderr.write("\nTerminating...\n")
finally:
    # Cleanup grabs and LEDs
    try:
        kbd.ungrab()
        mouse.ungrab()
        set_led(False)
    except:
        pass
