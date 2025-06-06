#!/bin/bash

echo "Linking dotfiles..."
mkdir -p "$HOME/.config"

ln -sf "$PWD/tmux/.tmux.conf" ~/.tmux.conf
ln -sf "$PWD/nvim" ~/.config/nvim
ln -sf "$PWD/git/.gitconfig" ~/.gitconfig
# Add more as needed

echo "Done."
