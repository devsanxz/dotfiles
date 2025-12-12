#!/usr/bin/env python3
"""
LILITH DASHBOARD MANAGER (Dynamic Geometry)
Implements the Sacred Grid: (j+k)(l+m) = jl + jm + kl + km
Universal Resolution Support.
Target: Workspace 2.
"""

import subprocess
import json
import time
import sys
import shutil

# --- Configuration ---
# Apps & Titles
APPS = {
    "youtube":  {"cmd": "chromium --app=https://www.youtube.com", "match": "title:^(YouTube)(.*)$"},
    "chromium": {"cmd": "chromium --new-window",                 "match": "^(chromium)$"},
    "nvim":     {"cmd": "foot -T nvim_special -e nvim",          "match": "title:^(nvim_special)$"},
    "term":     {"cmd": "foot -T term_aux",                      "match": "title:^(term_aux)$"}
}

def run_cmd(cmd):
    """Run shell command silently."""
    subprocess.Popen(cmd, shell=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)

def hyprctl(cmd):
    """Execute hyprctl command."""
    subprocess.run(f"hyprctl {cmd}", shell=True, stdout=subprocess.DEVNULL)

def get_active_monitor_res():
    """Get width/height of the focused monitor."""
    try:
        output = subprocess.check_output("hyprctl -j monitors", shell=True).decode()
        monitors = json.loads(output)
        for m in monitors:
            if m.get("focused"):
                return m["width"], m["height"]
        # Fallback to first if none focused
        return monitors[0]["width"], monitors[0]["height"]
    except Exception as e:
        print(f"Error detecting resolution: {e}")
        sys.exit(1)

def main():
    # 1. Geometry Calculation
    W, H = get_active_monitor_res()
    
    # Logic: j=2k, l=2m  ->  3k=W, 3m=H
    k = W // 3
    j = W - k    # Ensure j+k = W perfectly (handle rounding)
    
    m = H // 3
    l = H - m    # Ensure l+m = H perfectly
    
    print(f"Detected: {W}x{H}")
    print(f"Grid: j={j}, k={k} | l={l}, m={m}")

    # 2. Switch to Workspace 2
    hyprctl("dispatch workspace 2")
    time.sleep(0.2)

    # 3. Inject Dynamic Rules (Float + Geometry)
    # Syntax: hyprctl keyword windowrule "rule,regex"
    
    rules = []
    
    # YouTube (Top-Left: j*l) -> Pos 0,0
    rules.append(f"float, {APPS['youtube']['match']}")
    rules.append(f"move 0 0, {APPS['youtube']['match']}")
    rules.append(f"size {j} {l}, {APPS['youtube']['match']}")
    rules.append(f"workspace 2, {APPS['youtube']['match']}")

    # Chromium (Top-Right: k*l) -> Pos j,0
    rules.append(f"float, {APPS['chromium']['match']}")
    rules.append(f"move {j} 0, {APPS['chromium']['match']}")
    rules.append(f"size {k} {l}, {APPS['chromium']['match']}")
    rules.append(f"workspace 2, {APPS['chromium']['match']}")

    # Nvim (Bottom-Left: j*m) -> Pos 0,l
    rules.append(f"float, {APPS['nvim']['match']}")
    rules.append(f"move 0 {l}, {APPS['nvim']['match']}")
    rules.append(f"size {j} {m}, {APPS['nvim']['match']}")
    rules.append(f"workspace 2, {APPS['nvim']['match']}")

    # Term (Bottom-Right: k*m) -> Pos j,l
    rules.append(f"float, {APPS['term']['match']}")
    rules.append(f"move {j} {l}, {APPS['term']['match']}")
    rules.append(f"size {k} {m}, {APPS['term']['match']}")
    rules.append(f"workspace 2, {APPS['term']['match']}")

    # Apply Rules
    for r in rules:
        hyprctl(f'keyword windowrule "{r}"')

    # 4. Launch Apps
    # Launch order slightly delayed to prevent race conditions
    print("Launching apps...")
    run_cmd(APPS['youtube']['cmd'])
    time.sleep(1.5)
    
    run_cmd(APPS['chromium']['cmd'])
    time.sleep(0.5)
    
    run_cmd(APPS['nvim']['cmd'])
    time.sleep(0.2)
    
    run_cmd(APPS['term']['cmd'])

    subprocess.run(['notify-send', 'Lilith Geometry', f'Grid Deployed on {W}x{H}'])

if __name__ == "__main__":
    main()
