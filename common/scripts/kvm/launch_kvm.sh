#!/bin/bash
# KVM Launcher (SSH Direct Edition)
# Runs Sender locally -> SSH Pipe -> Pi Receiver
# Requirement: SSH Key auth working without password.

TARGET="san@pi"

echo ">>> INITIATING NEURAL LINK (SSH DIRECT) <<<"
echo "Target: $TARGET"

# 1. Ensure remote permission (just in case udev rule failed)
# echo "--- Setting Remote Permissions ---"
# ssh $TARGET "sudo chmod 666 /dev/uinput" 

echo "--- Starting Link ---"
echo "Press 'PAUSE' to toggle control."
echo "Close window to kill."

# 2. Start Local Sender -> SSH -> Remote Receiver
# Unbuffered (-u) is critical for low latency
sudo python3 -u ~/dotfiles/common/scripts/kvm/sender.py | ssh $TARGET "python3 -u /home/san/dotfiles/common/scripts/kvm/receiver.py"

echo ">>> LINK TERMINATED <<<"
sleep 2