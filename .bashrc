#
# ~/.bashrc
#

# lots of the stuff here was taken from mischa (https://github.com/mischavandenburg)

# to tell zsh to shutup
export BASH_SILENCE_DEPRECATION_WARNING=1

# if not running interactively, don't do anything
[[ $- != *i* ]] && return

# set to superior editing mode
set -o vi

# ~~~~~~~~~~~~~~~ Environment Variables ~~~~~~~~~~~~~~~~~~~~~~~~

export SECOND_BRAIN="$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/Second Brain"

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
PROMPT_COMMAND=set_bash_prompt

# ~~~~~~~~~~~~~~~ Aliases ~~~~~~~~~~~~~~~~~~~~~~~~

alias vim="nvim"
alias nv="cd $HOME/dotfiles/.config/nvim && nvim ."
alias t="tmux"
alias ts="tmux-sessionizer"
alias c="clear"
alias bashrc="cd $HOME/dotfiles/ && vim .bashrc"
alias projects="cd $HOME/Projects"

# zettelkasten
# ...
# ...

# ls
alias ls="ls --color=auto"
alias ll="ls -la"
# alias ll="exa -l -g --icons --git"

# git
alias g="git"
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"

# fun
alias fishies=asciiquarium

# ~~~~~~~~~~~~~~~ Misc ~~~~~~~~~~~~~~~~~~~~~~~~

eval "$(zoxide init bash)"

