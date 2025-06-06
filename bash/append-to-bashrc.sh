et -e

BASHRC="$HOME/.bashrc"

# Add alias if not already present
if ! grep -Fxq "alias vim='nvim'" "$BASHRC"; then
	  echo "alias vim='nvim'" >> "$BASHRC"
	    echo "✅ Added alias to .bashrc"
fi

# Add prompt if not already present
if ! grep -Fxq 'PROMPT="%B%F{blue}%n%f %F{green}%~%f ➜ %b"' "$BASHRC"; then
	  echo 'PROMPT="%B%F{blue}%n%f %F{green}%~%f ➜ %b"' >> "$BASHRC"
	    echo "✅ Added PROMPT to .bashrc"
fi

# Source updated bashrc
source "$BASHRC"
