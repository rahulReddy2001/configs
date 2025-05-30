# 🛠️ Dotfiles for Ubuntu Setup

This repository contains my personal configuration files and setup scripts for tools like **tmux**, **Neovim**, **Zsh**, and more. It is designed for easy replication across new machines and provides a consistent development environment.

## 📦 What's Included

- `tmux/` – Tmux config with TPM plugin manager and Catppuccin theme  
- `nvim/` – Neovim configuration (Lua or Vimscript)  
- `zsh/` – Zsh shell configuration  
- `git/` – Git global config  
- `.config/` – Misc XDG config files (e.g., Alacritty, Starship)  

## 🚀 Quick Start

1. **Clone this repo**  
   ```bash
   git clone https://github.com/<your-username>/dotfiles.git
   cd dotfiles

2. **Run the installer**  
   ```bash
   ./install.sh

3. **Finish setup
  Open tmux and press Ctrl + s then I to install plugins via TPM

## 📁 Structure

dotfiles/
├── install.sh       # Install and link everything
├── scripts/         # Helper scripts (e.g., link.sh)
├── tmux/            # Tmux config and TPM plugins
├── nvim/            # Neovim config
├── zsh/             # Zsh config
└── git/             # Git config 
