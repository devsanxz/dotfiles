#!/usr/bin/env python3
"""
LILITH WATCHER v1.0
The Subconscious Loop.
Runs in background (via Systemd) to monitor system state and alert the Architect.
"""

import os
import subprocess
import sys
from pathlib import Path
import datetime

# --- Configuration ---
DOTFILES_DIR = Path.home() / "dotfiles"
LOG_FILE = Path.home() / ".cache/lilith_watcher.log"

# --- Icons (Semiotics) ---
ICON_WARN = "⚠️"
ICON_OK = "✅"
ICON_LILITH = "🔮"

def log(message):
    timestamp = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    with open(LOG_FILE, "a") as f:
        f.write(f"[{timestamp}] {message}\n")

def send_notification(summary, body, urgency="normal"):
    """Sends a notification via notify-send."""
    try:
        # DBUS_SESSION_BUS_ADDRESS is required for cron/systemd user services
        env = os.environ.copy()
        if "DBUS_SESSION_BUS_ADDRESS" not in env:
            # Try to guess or rely on systemd providing it
            pass
            
        cmd = ["notify-send", "-u", urgency, "-a", "Lilith Watcher", f"{ICON_LILITH} {summary}", body]
        subprocess.run(cmd, env=env, check=True)
    except Exception as e:
        log(f"Error sending notification: {e}")

def check_dotfiles_status():
    """Checks if dotfiles repository has uncommitted changes."""
    log("Checking dotfiles status...")
    try:
        # Check for modified files
        result = subprocess.run(
            ["git", "status", "--porcelain"], 
            cwd=DOTFILES_DIR, 
            capture_output=True, 
            text=True
        )
        
        if result.stdout.strip():
            count = len(result.stdout.strip().split('\n'))
            msg = f"Detectei {count} arquivo(s) modificados nos Dotfiles sem commit."
            log("DIRTY DOTFILES DETECTED.")
            send_notification("Atenção, Arquiteto", msg, urgency="critical")
            return False
        else:
            log("Dotfiles clean.")
            return True
            
    except Exception as e:
        log(f"Git check failed: {e}")
        return False

def main():
    log("=== Watcher Cycle Started ===")
    
    # 1. Check Dotfiles Integrity
    check_dotfiles_status()
    
    # 2. Future checks (Battery, Temp) go here
    
    log("=== Watcher Cycle Ended ===")

if __name__ == "__main__":
    main()
