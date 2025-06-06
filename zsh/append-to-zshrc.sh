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

# Source updated zshrc
source "$ZSHRC"
