# PATH
export PATH=/usr/local/bin:$PATH
export PATH=/System/Cryptexes/App/usr/bin:$PATH
export PATH=/usr/bin:$PATH
export PATH=/bin:$PATH
export PATH=/usr/sbin:$PATH
export PATH=/sbin:$PATH
export PATH=/opt/homebrew/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

# Docker
source /Users/eojysele/.docker/init-zsh.sh || true

# FPATH
export FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
export FPATH="${HOME}/.zsh/completions/:${FPATH}"

# SDKMAN
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
