#!/bin/bash

set -e

# === Step 0: Check if tmux is installed ===
if ! command -v tmux >/dev/null 2>&1; then
    echo "⚠️ tmux is not installed. Proceeding with installation..."
    bash ./install_tmux.sh
    exit 0
fi

# === Step 1: Get current tmux version ===
CURRENT_VERSION=$(tmux -V | awk '{print $2}')
REQUIRED_VERSION="3.2a"

echo "🔍 Current tmux version: $CURRENT_VERSION"

# === Step 2: Compare versions ===
version_le() {
    [ "$(printf '%s\n' "$1" "$2" | sort -V | head -n1)" = "$1" ]
}

if version_le "$CURRENT_VERSION" "$REQUIRED_VERSION"; then
    echo "⚠️ tmux version $CURRENT_VERSION is ≤ $REQUIRED_VERSION. Installing 3.5a..."
    bash ./tmux-setup.sh
else
    echo "✅ tmux version $CURRENT_VERSION is up-to-date."
fi
