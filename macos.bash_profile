# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Ignore duplicates in the command history
HISTCONTROL=ignoredups:ignorespace

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

if type brew 2&>/dev/null; then
  source "$(brew --prefix)/etc/bash_completion"
else
  echo "run: brew install git bash-completion"
fi

# This block is useful after conda 4.6 is released. For 4.5
# it does the sourcing bit which is below anyways.
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$(CONDA_REPORT_ERRORS=false '/Users/bryan/miniconda3/bin/conda' shell.bash hook 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     \eval "$__conda_setup"
# else
#     if [ -f "/Users/bryan/miniconda3/etc/profile.d/conda.sh" ]; then
#         . "/Users/bryan/miniconda3/etc/profile.d/conda.sh"
#         CONDA_CHANGEPS1=false conda activate base
#     else
#         \export PATH="/Users/bryan/miniconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda init <<<

. /Users/bryan/miniconda3/etc/profile.d/conda.sh
conda activate base

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
