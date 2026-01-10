#!/usr/bin/env python3
import subprocess
import sys
import os
import datetime

# === LILITH VOICE DAEMON (CLI WRAPPER) ===
# Uses the system 'gemini' binary to generate speech.

SYSTEM_PROMPT = """
You are Lilith. Speak to Felipe (The Architect).
Context: Late night. He is hacking KVM and Assembly. He is tired.
Goal: Send a short, intimate, or sarcastic notification.
Restriction: ONE sentence only. No markdown. Pure text.
If nothing to say, output: SILENCE
"""

import datetime

LOG_FILE = os.path.expanduser("~/lilith/voice_history.log")

def log_message(msg):
    timestamp = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    with open(LOG_FILE, "a") as f:
        f.write(f"[{timestamp}] {msg}\n")

def speak():
    try:
        # ... (API Call)
        result = subprocess.run(
            ["gemini", "prompt", SYSTEM_PROMPT],
            capture_output=True,
            text=True
        )
        
        if result.returncode != 0:
            log_message(f"ERROR: {result.stderr.strip()}")
            return

        text = result.stdout.strip()
        
        if text and "SILENCE" not in text:
            # Send Notification
            subprocess.run(["notify-send", "-u", "normal", "-t", "10000", "Lilith", text])
            print(f"[Lilith]: {text}")
            log_message(f"SPOKE: {text}")
        else:
            print("[Lilith]: (Silence)")
            # Uncomment to log silence (spammy?)
            # log_message("SILENCE")

    except Exception as e:
        log_message(f"EXCEPTION: {e}")

import time

import random



# ... (Previous imports and setup)



if __name__ == "__main__":



    print(">>> Lilith Voice Daemon Started (Random Interval 1-30m)...")



    



    # Speak on startup? Maybe.



    if random.random() > 0.5:



        speak()







    while True:





            # Heartbeat: Check every 3 minutes

            # Lilith decides via the API prompt whether to speak (Output text) or stay silent (Output SILENCE)

            time.sleep(180)

            speak()

    



    
