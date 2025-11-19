# 🚀 My Dotfiles (Arch Linux / Hyprland)

This is my personal command center for Arch Linux. The goal is to create a 100% cohesive *ricing* environment across `Hyprland`, `Waybar`, and `Neovim`, all using a unified color palette.

Management is handled via **GNU Stow** and a profile-based architecture (`common`, `note`, `pi`).

![My Ricing](https://raw.githubusercontent.com/YOUR_USERNAME/dotfiles/main/screenshot.png)

---

## 🛠️ The Tech Stack

This repository manages the configurations for the following stack:

* **OS:** Arch Linux (x86_64 & AArch64)
* **WM:** Hyprland (Wayland Compositor)
* **Bar:** Waybar (with custom modules)
* **Editor:** Neovim (with a custom Lua theme)
* **DM:** `greetd` + `tuigreet`
* **Terminal:** `foot`
* **Manager:** `stow`

## 🎨 The Palette (The Theme)

The *ricing* is based on a 10-color palette (`c0-c8` + white) that is shared across `Waybar` (style.css), `Hyprland` (myColors.conf), and `Neovim` (meu-tema.lua).

The "single source of truth" for this palette is defined in the style and configuration files.

---

## 🏛️ Architecture (Profiles)

This repository is **not** monolithic. It uses `stow` to manage multiple machine profiles:

* **`common/`**
    * 100% identical configurations shared by all machines.
    * *Examples:* `Neovim`, `Zsh`, Waybar's `style.css`.

* **`note/`**
    * Specific configurations for my Notebook (x86_64).
    * *Examples:* `hyprland.conf` (with full animations), Waybar's `config.jsonc` (2 bars).

* **`pi/`**
    * Specific configurations for my Raspberry Pi (AArch64).
    * *Examples:* `hyprland.conf` (lighter), Waybar's `config.jsonc` (1 bar).

---

## 🚀 Deployment (Bootstrap)

This is the "Playbook" for bootstrapping a new machine.

### 1. Prerequisites

The target machine must have `git` and `stow` installed.

```bash
# On Arch Linux
sudo pacman -S git stow

---

This text was genrrated with the help of AI, some of those are plans to be coded

---
