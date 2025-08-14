# 🛠️ Dotfiles for Ubuntu Setup

This repository contains my personal configuration files and setup scripts for tools like **tmux**, **Neovim**, **Zsh**, and more. It is designed for easy replication across new machines and provides a consistent development environment.

## What's Included

- `tmux/` – Tmux config with TPM plugin manager and Catppuccin theme  
- `nvim/` – Neovim configuration (Lua or Vimscript)  
- `zsh/` – Zsh shell configuration  
- `git/` – Git global config  
- `.config/` – Misc XDG config files (e.g., Alacritty, Starship)  

## Quick Start

1. **Clone this repo**  
   ```bash
   git clone https://github.com/<your-username>/configs.git
   cd configs

2. **Run the installer**  
   ```bash
   ./install.sh

3. **Finish setup**
  Open tmux and press Ctrl + s then I to install plugins via TPM

## Structure

```text
dotfiles/
├── install.sh         # Install and link everything
├── scripts/           # Helper scripts (e.g., link.sh)
├── tmux/              # Tmux config and TPM plugins
│   └── .tmux.conf
├── nvim/              # Neovim config
│   └── init.lua       # Entrypoint 
│   └── lua/           # Plugin config and settings
│       └── plugins/    
├── zsh/               # Zsh config
├── bash/              # Bash config
└── git/               # Git global config
    └── .gitconfig
