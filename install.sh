#!/bin/bash

set -e

sudo apt update && sudo apt install -y \
  tmux neovim git curl wget unzip \
  build-essential python3-pip

# Clone TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Create .config dir if needed
mkdir -p ~/.config

# Link everything
bash ./scripts/link.sh

echo "Launch tmux and run prefix + I to install plugins"
