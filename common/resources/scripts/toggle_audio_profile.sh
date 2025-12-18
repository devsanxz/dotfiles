#!/bin/bash

# Audio Profile Toggle Script (Baby Sleep vs Regular)
# Author: Lilith (for Felipe)
# Dependency: pulseaudio-ladspa, swh-plugins, libnotify

STATE_FILE="/tmp/lilith_audio_profile"
CURRENT_STATE=$(cat "$STATE_FILE" 2>/dev/null)

# SC4 Plugin Parameters (ID 1882)
# Control: rms_peak, attack, release, threshold, ratio, knee, makeup, amplitude, gate

# Mode: BABY SLEEP (Flat, Night Mode)
# Target: Input [-30, 0] -> Output [-15, +1]
# -15dB Threshold, 20:1 Ratio (Brickwall), +15dB Gain
PARAMS_BABY="0,5,300,-15,20,3,15,0,-90"

# Mode: REGULAR (Dynamic, Day Mode)
# -20dB Threshold, 4:1 Ratio, +2dB Gain (Standard Dynamic)
PARAMS_REGULAR="0,5,300,-20,4,3,2,0,-90"

# Function to apply profile
apply_profile() {
    local name=$1
    local params=$2
    local icon=$3
    
    # Unload existing compressor
    pactl unload-module module-ladspa-sink 2>/dev/null
    
    # Load new compressor
    # Try finding the real sink to attach to, or let it attach to default
    # Using label=sc4 as discovered
    if pactl load-module module-ladspa-sink sink_name=compressor plugin=sc4_1882 label=sc4 control=$params; then
        pactl set-default-sink compressor
        echo "$name" > "$STATE_FILE"
        notify-send -u low -t 2000 "Audio Profile" "$name Mode Activated $icon"
    else
        notify-send -u critical "Audio Error" "Failed to load compressor module."
    fi
}

if [[ "$CURRENT_STATE" == "BABY" ]]; then
    apply_profile "REGULAR" "$PARAMS_REGULAR" "🔊"
else
    apply_profile "BABY" "$PARAMS_BABY" "👶"
fi
