# ==== 环境变量 ====

# Editor
export EDITOR=vim
export PAGER='less -RFXM'

# Go
export GOPATH="$HOME/Workspace/go"

# Python
export PYTHONIOENCODING=utf-8

# CCACHE
export USE_CCACHE=1

# Path
[[ -d /usr/lib/ccache ]] && PATH=/usr/lib/ccache/bin:$PATH
[[ -d $GOPATH ]] && PATH=$GOPATH/bin:$PATH
[[ -d $HOME/bin ]] && PATH=$HOME/bin:$PATH
typeset -U PATH
export PATH
