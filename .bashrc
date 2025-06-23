#
# LOTaher's ~/.bashrc
#

# cat /etc/motd
# neofetch

# to tell zsh to shutup
export BASH_SILENCE_DEPRECATION_WARNING=1

# if not running interactively, don't do anything
[[ $- != *i* ]] && return

# set to superior editing mode
set -o vi

# ~~~~~~~~~~~~~~~ Environment Variables ~~~~~~~~~~~~~~~~~~~~~~~~


# ~~~~~~~~~~~~~~~ Path Configuration ~~~~~~~~~~~~~~~~~~~~~~~~~~~

export PATH="$HOME/.local/bin/:$PATH"

export PATH=$PATH:/usr/local/go/bin

# ~~~~~~~~~~~~~~~ Prompt ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# PS1='\[\e[1;31m\][\[\e[1;33m\]\u\[\e[1;32m\]@\[\e[1;34m\]\h \[\e[1;35m\]\w\[\e[1;31m\]]\[\e[1;00m\]\$\[\e[0;00m\] '
PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null)'; PS1='\[\e[38;5;244m\][\[\e[93;1m\]\u\[\e[0;38;5;244m\]@\[\e[36m\]\h\[\e[0m\] \[\e[35m\]\W\[\e[0m\] \[\e[92m\]${PS1_CMD1}\[\e[38;5;244m\]]\\$\[\e[0m\] '

# ~~~~~~~~~~~~~~~ Aliases ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

alias vim="nvim"
alias v="vim"
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
# [l]ist [l]ong
alias ll="ls -la"

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

# ~~~~~~~~~~~~~~~ Misc ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


# ~~~~~~~~~~~~~~~ Claim ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
alias cp='cp -iv'
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation

#   Shows you the last 10 branches you've been on (you can pass it a number to show more e.g. git_history -n 10)
git_history () {
    local num_results=10  # Default number of results
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

#   Shorthand for the above function
alias gith='git_history'
