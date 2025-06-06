#!/bin/bash

set -e

# Step 1: Install dependencies
echo "🔧 Installing dependencies..."
sudo apt-get update
sudo apt-get install -y libevent-dev ncurses-dev build-essential bison pkg-config

# Step 2: Download and extract tmux 3.5a
echo "📦 Downloading tmux 3.5a..."
wget -q https://github.com/tmux/tmux/releases/download/3.5a/tmux-3.5a.tar.gz

echo "📂 Extracting..."
tar xzf tmux-3.5a.tar.gz
cd tmux-3.5a

# Step 3: Build and install
echo "🔨 Building tmux..."
./configure
make
echo "🚀 Installing tmux to /usr/local/bin..."
sudo make install

# Step 4: Ensure /usr/local/bin comes before /usr/bin in PATH
ZSHRC="$HOME/.zshrc"
PATH_LINE='export PATH="/usr/local/bin:$PATH"'

if ! grep -Fxq "$PATH_LINE" "$ZSHRC"; then
    echo "$PATH_LINE" >> "$ZSHRC"
    echo "✅ Added /usr/local/bin to PATH in $ZSHRC"
fi

# Step 5: Remove any tmux alias from previous runs
sed -i '/alias tmux=.*tmux-3\.5a/d' "$ZSHRC"

# Step 6: Reload shell config
echo "🔄 Reloading shell config..."
source "$ZSHRC"

# Step 7: Verify
echo "✅ Done! tmux version is:"
which tmux
tmux -V
