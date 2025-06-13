#!/bin/bash

echo "Linking dotfiles..."

# Get the directory this script is in
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

mkdir -p "$HOME/.config"

ln -sf "$SCRIPT_DIR/tmux/.tmux.conf" ~/.tmux.conf
ln -sf "$SCRIPT_DIR/nvim" ~/.config/nvim


echo "✅ Done."
