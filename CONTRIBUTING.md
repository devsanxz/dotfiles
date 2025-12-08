# Contributing to Dotfiles

Thank you for your interest in the SANXZ Environment project.
This document outlines the standards for contribution to ensure system stability and coherence.

## Code of Conduct
*   **Consistency:** Follow the existing patterns (e.g., color variables, directory structure).
*   **Testing:** Verify changes on both `note` (Arch/Desktop) and `pi` (ARM/Server) profiles when possible.

## Commit Standards (Conventional Commits)
We follow the [Conventional Commits](https://www.conventionalcommits.org/) specification.

### Structure
```
type(scope): description
```

### Types
*   **`feat`**: A new feature (e.g., adding a new tool to Chameleon).
*   **`fix`**: A bug fix (e.g., fixing a broken symlink).
*   **`docs`**: Documentation only changes.
*   **`style`**: Changes that do not affect the meaning of the code (white-space, formatting, color tweaks).
*   **`refactor`**: A code change that neither fixes a bug nor adds a feature.
*   **`chore`**: Maintenance tasks, dependency updates, etc.

### Examples
*   `feat(chameleon): add support for Alacritty terminal`
*   `style(waybar): update workspace colors for SANXZ4 theme`
*   `fix(zsh): resolve aliases conflict in .zshrc`

## Pull Request Process
1.  Fork the repository.
2.  Create a feature branch (`git checkout -b feat/amazing-feature`).
3.  Commit your changes following the standard above.
4.  Push to the branch.
5.  Open a Pull Request targeting the `main` branch.

---
*Happy Hacking.*
