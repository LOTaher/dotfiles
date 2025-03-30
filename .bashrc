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


# ~~~~~~~~~~~~~~~ Prompt ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

. ~/.git-prompt.sh

# old gruvbox prompt
PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null)'; PS1='\[\e[38;5;244m\][\[\e[93;1m\]\u\[\e[0;38;5;244m\]@\[\e[36m\]\h\[\e[0m\] \[\e[35m\]\W\[\e[0m\] \[\e[92m\]${PS1_CMD1}\[\e[38;5;244m\]]\\$\[\e[0m\] '

# PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 " (%s)")'; PS1='\[\e[38;5;247m\]λ\[\e[0m\] \[\e[38;5;184m\]\W\[\e[38;5;221m\]${PS1_CMD1}\[\e[0m\] '

# ~~~~~~~~~~~~~~~ Aliases ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

alias vim="nvim"
alias v="vim"
alias v="nvim"
alias c="clear"

# fzf

# [f]zf search and [p]review the files
alias fp="fzf --preview 'bat --color=always --style=numbers --line-range :500 {}'"
# [v]im [f]zf
# alias vf="vim $(fzf)"

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

eval "$(zoxide init bash)"

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f "/Users/lotaher/.ghcup/env" ] && . "/Users/lotaher/.ghcup/env" # ghcup-env

# ~~~~~~~~~~~~~~~ Claim ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
alias cp='cp -iv'
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation

#   Moves a File to the MacOS trash
trash () { command mv "$@" ~/.Trash ; }

#   Opens cwd in MacOS Finder
alias finder='open -a Finder ./'

alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels

#   Helpful for quickly navigating to common git directories
#   i.e. Regardless of your cwd, you can jump straight to one
#   of our project roots
alias sources='cd ~/dev'
alias clmobile='cd ~/dev/mobile'
alias clclaim='cd ~/dev/claim'
alias clcore='cd ~/dev/claim/core'
alias cldash='cd ~/dev/claim/cs-dashboard'

#   'Cd's to the path of frontmost window of MacOS Finder
#   Basically "Reveal in Finder" but on the command line :)
cdf () {
        currFolderPath=$( /usr/bin/osascript <<EOT
            tell application "Finder"
                try
            set currFolder to (folder of the front window as alias)
                on error
            set currFolder to (path to desktop folder as alias)
                end try
                POSIX path of currFolder
            end tell
EOT
        )
        echo "cd to \"$currFolderPath\""
        cd "$currFolderPath"
    }

#   Shows you the last 5 branches you've been on (you can pass it a number to show more e.g. git_history -n 10)
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

#   Creates an invisible, unclickable app icon in your dock that can act as a spacer between groups of apps
addDockSpacer() { defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}' && killall Dock ; }
