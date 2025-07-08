#!/bin/bash

set -e

ZSHRC="$HOME/.zshrc"

# Add alias if not already present
if ! grep -Fxq "alias vim='nvim'" "$ZSHRC"; then
    echo "alias vim='nvim'" >> "$ZSHRC"
    echo "✅ Added alias to .zshrc"
fi

# Add prompt if not already present
if ! grep -Fxq 'PROMPT="%B%F{blue}%n%f %F{green}%~%f ➜ %b"' "$ZSHRC"; then
    echo 'PROMPT="%B%F{blue}%n%f %F{green}%~%f ➜ %b"' >> "$ZSHRC"
    echo "✅ Added PROMPT to .zshrc"
fi

cdf() {
  local dir
  dir=$(find . -type d -not -path '*/\.*' 2> /dev/null | fzf --height 40% --reverse --preview 'ls -la {}' --prompt="📂 Select dir: ") || return
  cd "$dir"
}

echo "✅ All done. Please run 'source ~/.zshrc' or restart your terminal to apply changes."
