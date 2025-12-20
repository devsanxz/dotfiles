# SSH Setup Checkpoint
# Date: 2025-12-15
# Context: Trying to configure passwordless SSH from Note -> Pi.

## Problem
1. **Local:** SSH Key has a passphrase (prompts every time).
2. **Remote:** Pi asks for password, meaning the key is not in `authorized_keys`.

## The Fix (To execute on resume)
1. **Get Key:** Run `cat ~/.ssh/id_ed25519.pub` on Note.
2. **Login:** SSH into Pi (`ssh san@pi`).
3. **Paste:** Add the key content to `~/.ssh/authorized_keys` on Pi.
4. **Permissions:** Run `chmod 700 ~/.ssh && chmod 600 ~/.ssh/authorized_keys` on Pi.
5. **Agent:** Run `eval $(ssh-agent -s) && ssh-add` on Note to cache passphrase.

## Resume Trigger
- Ask: "Resolver o SSH" or "Continuar do Checkpoint SSH".
