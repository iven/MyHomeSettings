# ==== bat ====
export BAT_THEME="1337"

# ==== fzf ====
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# ==== fzf-tab ====

local extract="
# trim input
local in=\${\${\"\$(<{f})\"%\$'\0'*}#*\$'\0'}
# get ctxt for current completion
local -A ctxt=(\"\${(@ps:\2:)CTXT}\")
# real path
local realpath=\${ctxt[IPREFIX]}\${ctxt[hpre]}\$in
realpath=\${(Qe)~realpath}
"

# 补全 cd 时使用 exa 预览其中的内容
zstyle ':fzf-tab:complete:cd:*' extra-opts --preview=$extract'exa -1a --color=always $realpath'

# ==== grc ====
[[ -s "/etc/grc.zsh" ]] && source /etc/grc.zsh
[[ -s "/usr/local/etc/grc.zsh" ]] && source /usr/local/etc/grc.zsh

# ==== ssh-agent ====
zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle :omz:plugins:ssh-agent identities id_ed25519

# ==== you-should-use ====
YSU_MESSAGE_POSITION="after"
YSU_MESSAGE_FORMAT="\n$(tput bold)$(tput setaf 3)!! 发现 $(tput setaf 5)\"%command\"$(tput setaf 3) 的简写：$(tput setaf 5)\"%alias\"$(tput setaf 3)，下次注意点儿！ !!$(tput sgr0)\n"

# ==== zsh-autosuggestions ====
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#737373,underline"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_USE_ASYNC=1
ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# ==== zsh-history-substring-search ====
bindkey -r '^[[A'
bindkey -r '^[[B'

function __bind_history_keys() {
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
}
