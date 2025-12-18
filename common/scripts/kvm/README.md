# Neural Link (Custom KVM) 🧠🔗

A low-latency, kernel-level Keyboard & Mouse sharing solution over SSH. Allows controlling a remote machine (Raspberry Pi) using the local machine's (Laptop) input devices, bypassing Wayland compositors.

## Architecture

*   **Sender (`sender.py`):** Runs on Local (Note). Reads `/dev/input/event*` directly using `evdev`.
*   **Transport:** SSH Pipe (Standard I/O).
*   **Receiver (`receiver.py`):** Runs on Remote (Pi). Creates a virtual input device using `uinput` and injects events.

## Prerequisites

*   **Both Machines:** `python-evdev`
    ```bash
    sudo pacman -S python-evdev
    ```
*   **Remote (Pi):** Kernel module `uinput` loaded.
    ```bash
    sudo modprobe uinput
    ```

## Usage

1.  **Identify Devices:**
    Run `identify_devices.py` on the Local machine to find the correct event paths for your Keyboard and Mouse. Update `sender.py` `KBD_PATH` and `MOUSE_PATH` constants.

2.  **Launch:**
    Run from the Local machine:
    ```bash
    sudo ./sender.py | ssh user@remote "sudo ~/dotfiles/common/scripts/kvm/receiver.py"
    ```

3.  **Toggle Control:**
    Press **`SCROLL LOCK`** to switch between Local and Remote control.
    *   **LED ON:** Controlling Remote (Pi).
    *   **LED OFF:** Controlling Local (Note).

## Safety
*   The script "grabs" the input devices, meaning the local OS stops receiving events when active.
*   **Emergency Exit:** If SSH freezes, the script should detect the broken pipe and exit, releasing the grab. If stuck, kill the python process from another TTY.
