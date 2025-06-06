#!/bin/bash

set -e

BASHRC="$HOME/.bashrc"

# Add alias if not already present
if ! grep -Fxq "alias vim='nvim'" "$BASHRC"; then
	  echo "alias vim='nvim'" >> "$BASHRC"
	    echo "✅ Added alias to .bashrc"
fi

# Source updated bashrc
source "$BASHRC"
