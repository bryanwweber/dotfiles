# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Ignore duplicates in the command history
HISTCONTROL=ignoredups:ignorespace

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

check_conda_env ()
{
    if [ ! -z "$CONDA_DEFAULT_ENV" ]; then
        printf -- "%s" "\[\e[0;35m\][`basename $CONDA_DEFAULT_ENV`]\[\e[0m\] "
    fi
}

source ~/.git-prompt.sh

PROMPT_COMMAND='__git_ps1 "\[\e]0;\u@$(scutil --get ComputerName): \w\a\]$(check_conda_env)\[\e[01;32m\]\u@$(scutil --get ComputerName)\[\e[00m\]:\[\e[01;34m\]\w\[\e[00m\]" "\$ "'
eval "$(register-python-argcomplete conda)"

alias la='ls -al'
alias l='ls -alF'
