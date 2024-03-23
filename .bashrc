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

export PATH=$PATH:$(go env GOPATH)/bin

# ~~~~~~~~~~~~~~~ Prompt ~~~~~~~~~~~~~~~~~~~~~~~~
#
# ~~~~~~~~~~~~~~~ Prime Prompt ~~~~~~~~~~~~~~~~~~~~~~~~

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
# 		echo " ✗"
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
#
# export PS1="\[\e[1;32m\]➜  \[\e[m\]\[\e[1;36m\]\w\[\e[m\] \[\e[1;34m\]\`git_exist_fist\`\[\e[1;31m\]\`parse_git_branch\`\[\e[1;34m\]\`git_exist_last\`\[\e[1;33m\]\`parse_git_status\`\[\e[m\] "

# ~~~~~~~~~~~~~~~ Gruvbox Prompt ~~~~~~~~~~~~~~~~~~~~~~~~

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

# Activate the prompt
PROMPT_COMMAND=set_bash_prompt

# ~~~~~~~~~~~~~~~ Aliases ~~~~~~~~~~~~~~~~~~~~~~~~

alias vim=nvim
alias t="tmux"
alias c="clear"
alias bash="z ~ && vim .bashrc"

# zettelkasten
alias notes="z Zettelkasten && nvim ."
alias personal="z Zettelkasten/001 In && nvim ."

# ls
alias ll="exa -l -g --icons --git"

# git
alias g="git"

# fun
alias fishies=asciiquarium

# ~~~~~~~~~~~~~~~ Misc ~~~~~~~~~~~~~~~~~~~~~~~~

eval "$(zoxide init bash)"

