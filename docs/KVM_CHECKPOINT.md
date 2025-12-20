# KVM Automation Checkpoint
# Date: 2025-12-18
# Context: 'launch_kvm.sh' fails due to SSH Password prompt. Manual Netcat works.

## The Problem
The script tries to start the remote listener (`nc -l ...`) via SSH:
`ssh -f san@$PI_IP "nohup ..."`
This fails because SSH asks for a password, and the script runs non-interactively or inside a script block that doesn't handle the prompt well.

## The Fix (To execute on resume)
1. **Fix SSH Keys:** The root cause is that `ssh san@pi` still requires a password.
   - Verify `~/.ssh/authorized_keys` permissions on Pi (`chmod 600`).
   - Verify user home permissions on Pi (`chmod 755 /home/san`).
2. **Verify Agent:** Ensure `ssh-agent` is forwarding properly if needed.
3. **Test:** Run `ssh san@pi "echo ok"` from Note. It MUST NOT ask for a password.

## Workaround (Current)
Run listener manually on Pi:
`nc -l -p 9999 | python3 ~/dotfiles/common/scripts/kvm/receiver.py`
Run sender manually on Note:
`sudo ~/dotfiles/common/scripts/kvm/sender.py | nc pi 9999`
