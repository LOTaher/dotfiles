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

export GOBIN="$HOME/go/bin"
export GOPATH="$HOME/go/"

# ~~~~~~~~~~~~~~~ Path Configuration ~~~~~~~~~~~~~~~~~~~~~~~~~~~

export PATH="$HOME/bin/.local/scripts:$HOME/go/bin:$PATH"

# ~~~~~~~~~~~~~~~ Prompt ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

. ~/.git-prompt.sh

# old gruvbox prompt
# PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null)'; PS1='\[\e[38;5;244m\][\[\e[93;1m\]\u\[\e[0;38;5;244m\]@\[\e[36m\]\h\[\e[0m\] \[\e[35m\]\W\[\e[0m\] \[\e[92m\]${PS1_CMD1}\[\e[38;5;244m\]]\\$\[\e[0m\] '

PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 " (%s)")'; PS1='\[\e[38;5;247m\]λ\[\e[0m\] \[\e[38;5;184m\]\W\[\e[38;5;221m\]${PS1_CMD1}\[\e[0m\] '

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
. "$HOME/.cargo/env"
. "/Users/lotaher/.deno/env"
# pnpm
export PNPM_HOME="/Users/lotaher/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
