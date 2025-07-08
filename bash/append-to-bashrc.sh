#!/bin/bash

set -e

BASHRC="$HOME/.bashrc"

# Add alias if not already present
if ! grep -Fxq "alias vim='nvim'" "$BASHRC"; then
	  echo "alias vim='nvim'" >> "$BASHRC"
	    echo "✅ Added alias to .bashrc"
fi

cdf() {
  local dir
  dir=$(find . -type d -not -path '*/\.*' 2> /dev/null | fzf --height 40% --reverse --preview 'ls -la {}' --prompt="📂 Select dir: ") || return
  cd "$dir"
}

# Source updated bashrc
source "$BASHRC"
