if [ ! -d "$ZSH_COMPLETIONS_DIR" ]; then
	mkdir -p "$ZSH_COMPLETIONS_DIR"
fi

DOCKER_COMPLETION_FILE="$ZSH_COMPLETIONS_DIR/_docker"
if [ ! -f "$DOCKER_COMPLETION_FILE" ]; then
	if command -v docker > /dev/null; then
		docker completion zsh > "$DOCKER_COMPLETION_FILE" 2>/dev/null
	else
	fi
fi

BREW_COMPLETION_SRC="$(brew --prefix 2>/dev/null)/share/zsh/site-functions/_brew"
BREW_COMPLETION="$ZSH_COMPLETIONS_DIR/_brew"
if [ ! -f "$BREW_COMPLETION" ]; then
	if [ -f "$BREW_COMPLETION_SRC" ]; then
		cp "$BREW_COMPLETION_SRC" "$BREW_COMPLETION"
	fi
fi

export FPATH="$ZSH_COMPLETIONS_DIR:$FPATH"
