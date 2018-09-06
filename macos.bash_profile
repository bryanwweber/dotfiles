# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Ignore duplicates in the command history
HISTCONTROL=ignoredups:ignorespace

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

. /Users/bryan/miniconda3/etc/profile.d/conda.sh
conda activate

check_conda_env ()
{
    if [ ! -z "$CONDA_DEFAULT_ENV" ]; then
        printf -- "%s" "\[\e[0;35m\][`basename $CONDA_DEFAULT_ENV`]\[\e[0m\] "
    else
        printf -- "%s" ""
    fi
}

source $HOME/bin/git-prompt.sh

PROMPT_COMMAND='__posh_git_ps1 "$(check_conda_env)\[\e[01;32m\]\u@$(scutil --get ComputerName)\[\e[0m\]:\[\e[01;34m\]\w\[\e[0m\]" "\$ "'
eval "$(register-python-argcomplete conda)"

alias la='ls -al'
alias l='ls -alF'

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH
