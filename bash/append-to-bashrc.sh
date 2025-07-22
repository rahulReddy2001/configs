#!/bin/bash

set -euo pipefail

BASHRC="$HOME/.bashrc"

# Add alias if not already present
if ! grep -Fxq "alias vim='nvim'" "$BASHRC"; then
  echo "alias vim='nvim'" >> "$BASHRC"
  echo "✅ Added alias 'vim=nvim' to .bashrc"
fi

# Add cdf function if not already present
if ! grep -Fq "cdf() {" "$BASHRC"; then
  cat << 'EOF' >> "$BASHRC"

# fzf-based change directory function
cdf() {
  local dir
  dir=$(find . -type d -not -path '*/\.*' 2> /dev/null | fzf --height 40% --reverse --preview 'ls -la {}' --prompt="📂 Select dir: ") || return
  cd "$dir"
}
EOF
  echo "✅ Added cdf() function to .bashrc"
fi

echo "✨ Done. Please run 'source ~/.bashrc' or restart your terminal to apply changes."
