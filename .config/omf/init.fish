# General
if [ -x /usr/bin/vim ]
    set -gx EDITOR vim
else
    set -gx EDITOR vi
end

set -gx VISUAL $EDITOR

if [ -x /usr/bin/most ]
    set -gx PAGER most
else
    set -gx PAGER less
end

# Greeting
function fish_greeting
  if [ -x /usr/bin/archey3 ]
    archey3
  end
end

# mosh
set MOSH_TITLE_NOPREFIX 1

# PATH
set -gx PATH $HOME/bin $PATH

# Python
set -gx PYTHONIOENCODING utf-8

# GO
if [ -x $HOME/Workspace/go/bin ]
  set -gx PATH $HOME/Workspace/go/bin $PATH
  set -gx GOPATH $HOME/Workspace/go
end

# GPG
set -gx GPG_TTY (tty)

# SSH agent
if test -z "$SSH_ENV"
    setenv SSH_ENV $HOME/.ssh/environment
end

if not __ssh_agent_is_started
    __ssh_agent_start
end

# Prompt
set __fish_git_prompt_showcolorhints 'yes'
set __fish_git_prompt_show_informative_status 'yes'

set __fish_git_prompt_color_cleanstate blue
set __fish_git_prompt_color_upstream yellow

#set __fish_git_prompt_char_stateseparator ' '
set __fish_git_prompt_char_dirtystate '+'
set __fish_git_prompt_char_invalidstate '×'
set __fish_git_prompt_char_stagedstate '*'
set __fish_git_prompt_char_stashstate '$'
set __fish_git_prompt_char_untrackedfiles '%'
set __fish_git_prompt_char_cleanstate 'o(*^_^)ρ√'

# fzf
set -gx FZF_DEFAULT_COMMAND 'ag --hidden --ignore .git --ignore .cache --ignore node_modules --ignore .config/session --ignore .config/pulse -g ""'
set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
set -gx FZF_DEFAULT_OPTS ''
