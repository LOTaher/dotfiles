#
# ~/.bashrc
#

# cat /etc/motd
neofetch

# to tell zsh to shutup
export BASH_SILENCE_DEPRECATION_WARNING=1

# if not running interactively, don't do anything
[[ $- != *i* ]] && return

# set to superior editing mode
set -o vi

# ~~~~~~~~~~~~~~~ Environment Variables ~~~~~~~~~~~~~~~~~~~~~~~~

export GOBIN="$HOME/.local/bin"
export GOPATH="$HOME/go/"

# ~~~~~~~~~~~~~~~ Path Configuration ~~~~~~~~~~~~~~~~~~~~~~~~

export PATH="$HOME/bin/.local/scripts:$PATH"

 #~~~~~~~~~~~~~~~ Prompt ~~~~~~~~~~~~~~~~~~~~~~~~

# colors for prompt
RED="\[\033[0;31m\]"
GREEN="\[\033[0;32m\]"
BLUE="\[\033[0;34m\]"
PURPLE="\[\033[0;35m\]"
YELLOW="\[\033[1;33m\]"
CYAN="\[\033[0;36m\]"
WHITE="\[\033[1;37m\]"
RESET="\[\033[0m\]"

# function to fetch git branch name
get_git_branch() {
    # checks if the current directory is in a git repository
    git rev-parse --is-inside-work-tree > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "$(git symbolic-ref HEAD 2>/dev/null | sed -e 's/^refs\/heads\///')"
    fi
}

# function to fetch git repository status
get_git_status() {
    local git_status="$(git status -s 2> /dev/null)"
    local output=""

    if [[ ! -z "$git_status" ]]; then
        output="$RED✗$RESET"
    else
        output="$GREEN✔$RESET"
    fi

    echo $output
}

# function to set the prompt command
set_bash_prompt(){
    local user="\u"
    local host="\h"
    local dir="\W"
    local git_branch=$(get_git_branch)
    local git_status=$(get_git_status)

    if [ ! -z "$git_branch" ]; then
        PS1="${YELLOW}${user}${RESET}@${BLUE}${host}${RESET}:${PURPLE}${dir}${RESET}[${CYAN}${git_branch}${RESET}]$ "
    else
        PS1="${YELLOW}${user}${RESET}@${BLUE}${host}${RESET}:${PURPLE}${dir}${RESET}$ "
    fi
}

# activate the prompt
# PROMPT_COMMAND=set_bash_prompt
PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null)'; PS1='\[\e[38;5;244m\][\[\e[93;1m\]\u\[\e[0;38;5;244m\]@\[\e[36m\]\h\[\e[0m\] \[\e[35m\]\W\[\e[0m\] \[\e[92m\]${PS1_CMD1}\[\e[38;5;244m\]]\\$\[\e[0m\] '
# PS1='\[\e[38;5;244m\][\[\e[38;5;52;1m\]\u\[\e[0;38;5;244m\]@\[\e[38;5;255m\]\h\[\e[0m\] \[\e[92m\]\W\[\e[38;5;244m\]]\\$\[\e[0m\] '

# ~~~~~~~~~~~~~~~ Aliases ~~~~~~~~~~~~~~~~~~~~~~~~

alias vim="nvim"
alias c="clear"

# tmux

# [t]mux
alias t="tmux"
# [t]mux [a]ttach
alias ta="tmux attach-session -t"
# [t]mux [k]ill
alias tk="tmux kill-session -t"
# [t]mux [c]lear
alias tc="tmux list-sessions | grep -v attached | cut -d: -f1 |  xargs -t -n1 tmux kill-session -t"


# yabai
alias ystart="yabai --start-service"
alias ystop="yabai --stop-service"

# ls
alias ls="ls --color=auto"
alias ll="ls -la"
# alias ll="exa -l -g --icons --git"

# git

#[g]it
alias g="git"
# [g]it [s]tatus
alias gs="git status"
# [g]it [a]dd
alias ga="git add"
# [g]it [c]ommit
alias gc="git commit"
# [g]it [p]ush
alias gp="git push"

# fun
alias fishies=asciiquarium

# ~~~~~~~~~~~~~~~ Misc ~~~~~~~~~~~~~~~~~~~~~~~~

eval "$(zoxide init bash)"

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
