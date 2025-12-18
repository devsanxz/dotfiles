#!/usr/bin/env python3
import evdev

print("=== DETECTED INPUT DEVICES ===")
devices = [evdev.InputDevice(path) for path in evdev.list_devices()]

for device in devices:
    print(f"{device.path:<20} {device.name} (Phys: {device.phys})")

print("\n=== INSTRUCTIONS ===")
print("Identify your Keyboard and Mouse paths (e.g., /dev/input/event3).")
print("You will need these for the Sender script.")
