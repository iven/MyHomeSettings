# Common
alias pg='pgrep -lf'
alias f='fd'
alias tree='ls --tree'
alias vimdiff='nvim -d'

# yay
alias y='yay'
alias yql='y -Ql'
alias yqo='y -Qo'
alias yr='y -Rs'
alias yrd='y -Rdd'
alias ys='y -S'
alias ysu='y -Su'
alias ysyu='y -Syu'
alias yu='y -U'

# zinit
alias ziclean='zi delete --clean -y && zi cclear'

# aws
alias awslogin='aws sso login --profile=sso'

# kitty
# https://wiki.archlinux.org/title/Kitty#Terminal_issues_with_SSH
[ "$TERM" = "xterm-kitty" ] && [ -z "$SSH_TTY" ] && alias ssh="kitty +kitten ssh"
