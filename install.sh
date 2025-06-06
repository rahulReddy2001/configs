#!/usr/bin/env bash
set -e

# === Define Variables ===
DOTFILES="$HOME/configs"
NVIM_URL="https://github.com/neovim/neovim/releases/download/v0.11.2/nvim-linux-x86_64.tar.gz"
NVIM_INSTALL_DIR="$DOTFILES/nvim-src"
NVIM_TAR="$NVIM_INSTALL_DIR/nvim.tar.gz"
NVIM_BIN="$NVIM_INSTALL_DIR/nvim-linux-x86_64/bin/nvim"
LOCAL_BIN="$HOME/.local/bin"
TPM_DIR="$HOME/.tmux/plugins/tpm"

# === Detect OS ===
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    OS="ubuntu"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    OS="macos"
else
    echo "❌ Unsupported OS: $OSTYPE"
    exit 1
fi

# === Install Required Packages ===
if [[ "$OS" == "ubuntu" ]]; then
    echo "📦 Installing packages with apt..."
    sudo apt update && sudo apt install -y \
        tmux git curl wget unzip \
        build-essential python3-pip npm
elif [[ "$OS" == "macos" ]]; then
    if ! command -v brew >/dev/null 2>&1; then
        echo "❌ Homebrew not found. Install it from https://brew.sh/"
        exit 1
    fi
    echo "📦 Installing packages with brew..."
    brew install tmux git curl wget unzip python node neovim
fi

# === Install Neovim (both macOS and Ubuntu) ===
echo "📦 Installing latest Neovim into dotfiles..."

# Clean up broken tarball
if [ -f "$NVIM_TAR" ]; then
    echo "🧹 Removing existing (possibly broken) $NVIM_TAR..."
    rm -f "$NVIM_TAR"
fi

if [ -x "$NVIM_BIN" ]; then
    echo "✅ Neovim already installed at $NVIM_BIN, skipping download."
else
    mkdir -p "$NVIM_INSTALL_DIR"
    cd "$NVIM_INSTALL_DIR" || exit 1

    echo "⬇️  Downloading Neovim from $NVIM_URL..."
    wget --show-progress -O "$NVIM_TAR" "$NVIM_URL"

    if [ ! -s "$NVIM_TAR" ]; then
        echo "❌ Download failed or file is empty. Exiting."
        exit 1
    fi

    echo "📦 Extracting Neovim..."
    tar xzvf "$NVIM_TAR" || { echo "❌ Failed to extract Neovim."; exit 1; }

    echo "🧹 Cleaning up tarball..."
    rm "$NVIM_TAR"

    echo "✅ Neovim downloaded and extracted."
fi

# Link the binary
echo "🔗 Linking nvim to ~/.local/bin..."
mkdir -p "$LOCAL_BIN"

ln -sf "$NVIM_BIN" "$LOCAL_BIN/nvim"
echo "✅ Linked $LOCAL_BIN/nvim → $NVIM_BIN"

# Add ~/.local/bin to PATH in shell rc
SHELL_RC="$HOME/.bashrc"
if [ -n "$ZSH_VERSION" ]; then SHELL_RC="$HOME/.zshrc"; fi
if ! grep -q 'export PATH="$HOME/.local/bin:$PATH"' "$SHELL_RC"; then
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$SHELL_RC"
    export PATH="$HOME/.local/bin:$PATH"
fi

# Clone TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# === Link dotfiles (your custom symlink script) ===
echo "🔗 Linking dotfiles..."
bash "$DOTFILES/scripts/links.sh"
bash "$DOTFILES/tmux/check-tmux.sh"

# === Final Message ===
echo ""
echo "✅ Done!"
echo "👉 Launch tmux and press prefix + I to install plugins."
echo "👉 Restart your shell or run: source ~/.bashrc or ~/.zshrc"
