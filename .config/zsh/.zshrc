# ==== Powerlevel10k instant prompt ====

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "$XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "$XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# ==== Zinit 初始化 ====

ZINIT_HOME=$ZDOTDIR/zinit

typeset -A ZINIT=(
  BIN_DIR         $ZINIT_HOME/bin
  HOME_DIR        $ZINIT_HOME
  COMPINIT_OPTS   -C
  ZCOMPDUMP_PATH  $XDG_CACHE_HOME/zsh/zcompdump
)

if [[ ! -f $ZINIT_HOME/bin/zinit.zsh ]]; then
  mkdir -p $ZINIT_HOME
	git clone https://github.com/zdharma-continuum/zinit.git $ZINIT_HOME/bin
fi

source $ZDOTDIR/zinit/bin/zinit.zsh

# ==== 加载自定义配置 ====

for i in $ZDOTDIR/snippets/*.zsh; do
  source $i
done

# ==== 加载插件 ====

# 加载 Annexes
zinit light zdharma-continuum/zinit-annex-bin-gem-node

# 不知道为啥这个要单独写在这里才能正常安装
# zinit ice has'asdf'
# zinit light asdf-vm/asdf

zinit wait silent for OMZP::ssh-agent

zinit wait lucid from'gh-r' for \
  sbin'fzf' \
    junegunn/fzf \
  sbin'**/fd' \
    @sharkdp/fd \
  sbin'**/bat' \
    @sharkdp/bat \
  sbin'**/bin/exa' \
    ogham/exa \
  sbin'**/delta' \
    dandavison/delta

zinit wait lucid as'completion' for \
  OMZP::docker/_docker \
  OMZP::fd/_fd \
  OMZP::ripgrep/_ripgrep

zinit wait lucid for \
  OMZL::clipboard.zsh \
  OMZL::completion.zsh \
  OMZL::directories.zsh \
  OMZL::functions.zsh \
  OMZL::git.zsh \
  OMZL::misc.zsh \
  OMZL::theme-and-appearance.zsh \
  OMZP::colored-man-pages \
  OMZP::fzf \
  OMZP::git \
  DarrinTisdale/zsh-aliases-exa \
  agkozak/zsh-z \
  MichaelAquilina/zsh-you-should-use \
  atload'!__bind_history_keys' \
    zsh-users/zsh-history-substring-search \
  has'systemctl' \
    OMZP::systemd \
  has'gls' \
    OMZP::gnu-utils \
  has'gpg-agent' \
    OMZP::gpg-agent \
  has'kubectl' \
    OMZP::kubectl \
  has'minikube' \
    OMZP::minikube \
  pack \
    ls_colors \
  lucid atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay; bindkey -M menuselect '^[[Z' reverse-menu-complete" \
    zdharma-continuum/fast-syntax-highlighting \
  blockf \
    zsh-users/zsh-completions \
  atload'!_zsh_autosuggest_start' \
    zsh-users/zsh-autosuggestions
  # as'command' atclone'rm -f ^(rgg|agv)' atload'alias s=rgg; alias F=agv' \
  #   lilydjwg/search-and-view \
  # Aloxaf/fzf-tab \

# ==== 加载主题 ====

source $ZDOTDIR/.p10k.zsh
zinit ice depth=1
zinit light romkatv/powerlevel10k

[[ -x "$(command -v archey)" ]] && archey && echo
