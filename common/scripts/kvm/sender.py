#!/usr/bin/env python3
"""
LILITH NEURAL LINK: SENDER (DOTFILES VERSION)
Runs on Raspberry Pi. Sends to Laptop (Note) via UDP.
"""

import evdev
import socket
import select
import sys
import os

# === CONFIGURATION ===
TARGET_HOSTNAME = "note"
TARGET_PORT = 9999
TOGGLE_KEY = "KEY_PAUSE"

# Dispositivos USB (CASUE e YSPRINGTECH)
KBD_PATH = "/dev/input/by-id/usb-2a7a_CASUE_USB_KB-event-kbd"
MOUSE_PATH = "/dev/input/by-id/usb-YSPRINGTECH_USB_OPTICAL_MOUSE-event-mouse"

class NeuralSender:
    def __init__(self):
        self.mode = "LOCAL" # Começa controlando o Pi
        self.sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        self.devices = []
        self.uinput_local = None
        self.target_ip = self.resolve_target()

    def resolve_target(self):
        try:
            return socket.gethostbyname(TARGET_HOSTNAME)
        except:
            return None

    def setup(self):
        print(f"[*] Initializing Link on Pi...")
        self.uinput_local = evdev.UInput(name="Lilith-KVM-Local-Mirror")
        
        for path in [KBD_PATH, MOUSE_PATH]:
            if os.path.exists(path):
                try:
                    dev = evdev.InputDevice(path)
                    dev.grab()
                    self.devices.append(dev)
                    print(f" + Grabbed: {dev.name}")
                except Exception as e:
                    print(f" ! Error grabbing {path}: {e}")

    def loop(self):
        print(f"[*] KVM Active. Target: {TARGET_HOSTNAME}. Toggle: {TOGGLE_KEY}")
        dev_map = {d.fd: d for d in self.devices}
        
        while True:
            r, w, x = select.select(self.devices, [], [])
            for fd in r:
                dev = dev_map[fd]
                for event in dev.read():
                    if event.type == evdev.ecodes.EV_KEY and event.value == 1:
                        key = evdev.ecodes.KEY.get(event.code, "")
                        if key == TOGGLE_KEY:
                            self.mode = "REMOTE" if self.mode == "LOCAL" else "LOCAL"
                            print(f"\n>>> TARGET SWITCHED TO: {self.mode}")
                            if self.mode == "REMOTE": self.target_ip = self.resolve_target()
                            continue

                    if self.mode == "REMOTE" and self.target_ip:
                        msg = f"{event.type},{event.code},{event.value}".encode()
                        self.sock.sendto(msg, (self.target_ip, TARGET_PORT))
                    else:
                        self.uinput_local.write(event.type, event.code, event.value)
                        self.uinput_local.syn()

if __name__ == "__main__":
    if os.geteuid() != 0:
        print("Run as root.")
        sys.exit(1)
    sender = NeuralSender()
    sender.setup()
    sender.loop()