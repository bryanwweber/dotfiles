source /usr/share/defaults/etc/profile

FG="\[\033[38;5;081m\]"
BG="\[\033[38;5;245m\]"
AT="\[\033[38;5;245m\]"
HCOLOR="\[\033[38;5;206m\]"
CONDA_COLOR="\[\033[38;5;015m\]"

alias la="ls -la"

export PATH=$PATH:$HOME/.local/bin

. $HOME/miniconda3/etc/profile.d/conda.sh
conda activate base

check_conda_env ()
{
    if [ ! -z "$CONDA_DEFAULT_ENV" ]; then
        printf -- "%s" "${CONDA_COLOR}(`basename $CONDA_DEFAULT_ENV`)\[\e[0m\] "
    fi
}

source $HOME/bin/git-prompt.sh
PROMPT_COMMAND='__posh_git_ps1 "$(check_conda_env)${FG}\u${AT}@${HCOLOR}\H ${BG}\w\[\e[0m\]" "${FG}\\\$ \[\e[0m\]";'$PROMPT_COMMAND
eval "$(register-python-argcomplete conda)"
