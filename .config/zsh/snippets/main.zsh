# ==== 环境变量 ====

# Editor
export EDITOR=vim
export PAGER='less -RFXM'

# Go
export GOPATH="$HOME/Workspace/go"
export GOPRIVATE="github.com/tidbcloud"

# Python
export PYTHONIOENCODING=utf-8

# CCACHE
export USE_CCACHE=1

# Nix
[[ -d ${HOME}/.nix-profile ]] && source ${HOME}/.nix-profile/etc/profile.d/nix.sh

# Path
[[ -d /usr/lib/ccache ]] && PATH=/usr/lib/ccache/bin:$PATH
[[ -d $GOPATH ]] && PATH=$GOPATH/bin:$PATH
[[ -d $HOME/bin ]] && PATH=$HOME/bin:$PATH
[[ -d $HOME/.local/bin ]] && PATH=$HOME/.local/bin:$PATH
[[ -d /opt/homebrew/bin ]] && PATH=/opt/homebrew/bin:$PATH
[[ -d ${HOME}/.krew/bin ]] && PATH=$PATH:${HOME}/.krew/bin
typeset -U PATH
export PATH
