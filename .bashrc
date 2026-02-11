#
# LOTaher's ~/.bashrc
#

export BASH_SILENCE_DEPRECATION_WARNING=1

[[ $- != *i* ]] && return

set -o vi

# ~~~~~~~~~~~~~~~ Environment Variables ~~~~~~~~~~~~~~~~~~~~~~~~~~~

export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"

export PATH="$HOME/.local/bin:$PATH"

# Go
export GOROOT="/opt/homebrew/opt/go@1.23/libexec"
export GOBIN="$HOME/.local/bin"
export GOTOOLCHAIN=local
export PATH="/opt/homebrew/opt/go@1.23/bin:$PATH"

# Python
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# ~~~~~~~~~~~~~~~ Prompt ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# mirage prompt
PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null)'; PS1='\[\e[38;5;243m\][\[\e[38;5;196m\]\u\[\e[38;5;243m\]@\[\e[38;5;75m\]\h\[\e[0m\] \[\e[38;5;185m\]\W\[\e[0m\] ${PS1_CMD1}\[\e[38;5;243m\]]\\$\[\e[0m\] '

# ~~~~~~~~~~~~~~~ Functions ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

git_history () {
    local num_results=10
    while getopts ":n:" opt; do
        case ${opt} in
            n )
                num_results=$OPTARG
                ;;
            \? )
                echo "Invalid option: $OPTARG" 1>&2
                return 1
                ;;
            : )
                echo "Invalid option: $OPTARG requires an argument" 1>&2
                return 1
                ;;
        esac
    done
    shift $((OPTIND -1))
    git reflog | egrep -io "moving from ([^[:space:]]+)" | awk '{ print $3 }' | awk ' !x[$0]++' | egrep -v '^[a-f0-9]{40}$' | head -n${num_results}
}

# ~~~~~~~~~~~~~~~ Aliases ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

alias vim="nvim"
alias v="nvim"
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

# ls

alias ls="ls --color=auto"

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
# [git] [h]istory
alias gith='git_history'

# misc

alias ?="google"

# fun

alias fishies=asciiquarium

