#!/bin/bash
# KVM Launcher (Netcat Edition)
# Runs Sender locally -> Netcat -> Pi Receiver

PI_IP="pi" # Ou IP fixo se o DNS falhar
PORT="9999"

echo ">>> INITIATING NEURAL LINK (KVM) <<<"
echo "Target: $PI_IP:$PORT"

# 1. Ensure remote permission (requires SSH key working, or password)
echo "--- Setting Remote Permissions ---"
ssh san@$PI_IP "sudo chmod 666 /dev/uinput && pkill -f 'nc -l -p $PORT'" 

# 2. Start Remote Listener (Background)
# We use nohup to keep it running even if SSH disconnects
ssh -f san@$PI_IP "nohup bash -c 'nc -l -p $PORT | python3 ~/dotfiles/common/scripts/kvm/receiver.py' > /dev/null 2>&1 &"

echo "--- Remote Listener Active ---"
echo "--- Starting Local Sender ---"

# 3. Start Local Sender -> Netcat
# Sudo needed for input grabbing
sudo ~/dotfiles/common/scripts/kvm/sender.py | nc $PI_IP $PORT

echo ">>> LINK TERMINATED <<<"
sleep 2
