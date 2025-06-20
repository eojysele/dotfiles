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
[[ -s "$HOME/.docker/init-zsh.sh" ]] && source $HOME/.docker/init-zsh.sh || true

# SDKMAN
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
