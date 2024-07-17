source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# PATH
PATH=/usr/local/bin:$PATH
PATH=/System/Cryptexes/App/usr/bin:$PATH
PATH=/usr/bin:$PATH
PATH=/bin:$PATH
PATH=/usr/sbin:$PATH
PATH=/sbin:$PATH
PATH=/opt/homebrew/bin:$PATH
PATH=$HOME/.local/bin:$PATH

# Docker
source /Users/eojysele/.docker/init-zsh.sh || true

# FPATH
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
FPATH="${HOME}/.zsh/completions/:${FPATH}"

# SDKMAN
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

