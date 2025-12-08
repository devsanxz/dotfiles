# Chameleon 🦎

**Chameleon** is a universal theme manager/switcher designed for modular dotfiles. It reads a single "Source of Truth" (YAML palette definition) and intelligently distributes it across your entire system (Window Manager, Terminal, Bar, Shell, etc.).

## Philosophy

1.  **Single Source of Truth:** Define colors once in YAML, use everywhere.
2.  **Non-Destructive:** Uses `include`/`source` files instead of modifying your main config files.
3.  **Smart Detection:** Only generates configs for applications currently installed on your system.
4.  **Extensible:** Plugin-based architecture makes it easy to add support for new apps.

## Requirements

*   **Python 3.8+**
*   **No external dependencies:** Uses only the Python Standard Library (`pathlib`, `json`, `subprocess`, etc.) for maximum portability and minimal footprint.

## Usage

```bash
# Apply a theme to all detected apps
python3 main.py apply sanxz4

# Apply only to specific apps
python3 main.py apply sanxz4 --apps hyprland,foot

# List available themes
python3 main.py list

# Dry run (preview changes)
python3 main.py apply sanxz4 --dry-run
```

## Supported Apps (Providers)

- [x] **Hyprland** (Generates `$variables`)
- [x] **Foot Terminal** (Generates `[colors]` section)
- [x] **Waybar** (Generates `@define-color` CSS)
- [x] **Zsh** (Exports `$ENV_VARS` + Syntax Highlighting)
- [x] **Neovim** (Generates Lua module)
- [x] **Wofi** (Generates CSS variables)
- [x] **GTK 3/4** (Generates `gtk.css` overrides)

## Directory Structure

The tool expects your themes to be located in `../../common/resources/colors/` relative to its execution path (or configured via args).
