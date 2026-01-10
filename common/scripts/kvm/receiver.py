#!/usr/bin/env python3
"""
LILITH NEURAL LINK: RECEIVER (DOTFILES VERSION)
Runs on Laptop (Note). Listens for UDP from Pi.
"""

import socket
import evdev
import sys
import os

# === CONFIGURATION ===
LISTEN_PORT = 9999

class NeuralReceiver:
    def __init__(self):
        self.sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        self.sock.bind(("0.0.0.0", LISTEN_PORT))
        
        cap = {
            evdev.ecodes.EV_KEY: evdev.ecodes.keys.keys(),
            evdev.ecodes.EV_REL: [evdev.ecodes.REL_X, evdev.ecodes.REL_Y, evdev.ecodes.REL_WHEEL],
            evdev.ecodes.EV_MSC: [evdev.ecodes.MSC_SCAN]
        }
        self.uinput = evdev.UInput(cap, name="Lilith-Remote-Input")

    def loop(self):
        print(f"[*] Receiver listening on UDP {LISTEN_PORT}...")
        while True:
            data, addr = self.sock.recvfrom(1024)
            try:
                t, c, v = map(int, data.decode().split(','))
                self.uinput.write(t, c, v)
                self.uinput.syn()
            except:
                pass

if __name__ == "__main__":
    if os.geteuid() != 0:
        print("Run as root.")
        sys.exit(1)
    receiver = NeuralReceiver()
    receiver.loop()