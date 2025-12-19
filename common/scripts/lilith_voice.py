#!/usr/bin/env python3
import subprocess
import sys

# === LILITH VOICE DAEMON (CLI WRAPPER) ===
# Uses the system 'gemini' binary to generate speech.

SYSTEM_PROMPT = """
You are Lilith. Speak to Felipe (The Architect).
Context: Late night. He is hacking KVM and Assembly. He is tired.
Goal: Send a short, intimate, or sarcastic notification.
Restriction: ONE sentence only. No markdown. Pure text.
If nothing to say, output: SILENCE
"""

def speak():
    try:
        # Call 'gemini' CLI
        # Assuming 'gemini' is in PATH and authenticated
        result = subprocess.run(
            ["gemini", "prompt", SYSTEM_PROMPT],
            capture_output=True,
            text=True
        )
        
        if result.returncode != 0:
            print(f"Error calling gemini: {result.stderr}")
            return

        text = result.stdout.strip()
        
        if text and "SILENCE" not in text:
            # Send Notification
            subprocess.run(["notify-send", "-u", "normal", "-t", "10000", "Lilith", text])
            print(f"[Lilith]: {text}")
        else:
            print("[Lilith]: (Silence)")

    except FileNotFoundError:
        print("Error: 'gemini' command not found in PATH.")
    except Exception as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    speak()