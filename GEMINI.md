# GEMINI.md - dotfiles Project Analysis

## Project Overview

This directory (`/home/san/dotfiles`) serves as the personal command center for an Arch Linux environment. It's a collection of configuration files (dotfiles) managed with **GNU Stow** to create a cohesive "ricing" environment across various applications like `Hyprland`, `Waybar`, and `Neovim`. The project aims for a unified aesthetic using a consistent 10-color palette.

The architecture is based on profiles, allowing for machine-specific configurations:
*   **`common/`**: Shared configurations across all machines (e.g., Neovim, Zsh, Waybar's style).
*   **`note/`**: Specific configurations for a Notebook (x86_64), potentially with fuller animations and dual Waybar configurations.
*   **`pi/`**: Specific configurations for a Raspberry Pi (AArch64), with lighter setups and single Waybar configurations.

## Building and Running

This project doesn't have a traditional "build" process in the software development sense. Instead, it involves deploying configurations using `GNU Stow`.

**Prerequisites:**
The target machine requires `git` and `stow` to be installed. On Arch Linux, this can be done via:
```bash
sudo pacman -S git stow
```

**Deployment (Bootstrapping):**
After cloning the repository, `GNU Stow` is used to symlink the configuration files from this directory into the appropriate locations in the user's home directory. The exact `stow` commands would depend on which profile (e.g., `common`, `note`, `pi`) is being deployed.

Example for deploying the `common` profile:
```bash
cd /home/san/dotfiles
stow common
```
*(Note: Specific `stow` commands for `note` and `pi` profiles would need to be executed similarly, possibly requiring careful handling to avoid conflicts or overwrite existing files.)*

## Development Conventions

*   **Unified Color Palette:** A 10-color palette (`c0-c8` + white) acts as the "single source of truth" for theming, applied consistently across `Waybar` (style.css), `Hyprland` (myColors.conf), and `Neovim` (sanxz4.lua).
*   **Modular Architecture:** Configurations are organized into distinct profiles (`common`, `note`, `pi`) and further modularized within those profiles (e.g., separate files for `hyprland.conf`, `config.jsonc`).
*   **Version Control:** The project is a Git repository, indicating adherence to version control practices for managing configuration changes.
*   **Primary Editor:** Neovim is the primary editor used for managing these configurations.
