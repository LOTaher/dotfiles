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

# . ~/.git-prompt.sh

# PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 " (%s) ")'; PS1='[\t] \[\e[38;5;110m\]\u\[\e[0m\]@\[\e[38;5;106m\]\h\[\e[0m\]:\[\e[38;5;220m\]\W\[\e[38;5;214m\]${PS1_CMD1}\[\e[0m\]\\$ '
# PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 " (%s)")'; PS1='\[\e[38;5;112m\]\w\[\e[38;5;229m\]${PS1_CMD1}\n\[\e[38;5;247m\]λ\[\e[0m\] '

# function git_exist_fist() {
# 	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
# 	if [ ! "${BRANCH}" == "" ]
# 	then
# 		echo "git:("
# 	else
# 		echo ""
# 	fi
# }
#
# function git_exist_last() {
# 	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
# 	if [ ! "${BRANCH}" == "" ]
# 	then
# 		echo ")"
# 	else
# 		echo ""
# 	fi
# }
#
# # get current branch in git repo
# function parse_git_branch() {
# 	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
# 	if [ ! "${BRANCH}" == "" ]
# 	then
# 		echo "${BRANCH}"
# 	else
# 		echo ""
# 	fi
# }
#
# function parse_git_status() {
# 	STAT=`parse_git_dirty`
# 	if [ ! "${STAT}" == "" ]
# 	then
# 		STAT=`parse_git_dirty`
# 		echo " ✗"
# 	else
# 		echo ""
# 	fi
# }
#
# # get current status of git repo
# function parse_git_dirty {
# 	status=`git status 2>&1 | tee`
# 	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
# 	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
# 	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
# 	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
# 	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
# 	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
# 	bits=''
# 	if [ "${renamed}" == "0" ]; then
# 		bits=">${bits}"
# 	fi
# 	if [ "${ahead}" == "0" ]; then
# 		bits="*${bits}"
# 	fi
# 	if [ "${newfile}" == "0" ]; then
# 		bits="+${bits}"
# 	fi
# 	if [ "${untracked}" == "0" ]; then
# 		bits="?${bits}"
# 	fi
# 	if [ "${deleted}" == "0" ]; then
# 		bits="x${bits}"
# 	fi
# 	if [ "${dirty}" == "0" ]; then
# 		bits="!${bits}"
# 	fi
# 	if [ ! "${bits}" == "" ]; then
# 		echo " ${bits}"
# 	else
# 		echo ""
# 	fi
# }

# export PS1="\[\e[32m\]➜  \[\e[m\]\[\e[36m\]\w\[\e[m\] \[\e[32m\]\`git_exist_fist\`\[\e[31m\]\`parse_git_branch\`\[\e[32m\]\`git_exist_last\`\[\e[33m\]\`parse_git_status\`\[\e[m\] "
PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null)'; PS1='\[\e[38;5;244m\][\[\e[93;1m\]\u\[\e[0;38;5;244m\]@\[\e[36m\]\h\[\e[0m\] \[\e[35m\]\W\[\e[0m\] \[\e[92m\]${PS1_CMD1}\[\e[38;5;244m\]]\\$\[\e[0m\] '

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
