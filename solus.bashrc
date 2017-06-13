source /usr/share/defaults/etc/profile

FG="\[\033[38;5;081m\]"
BG="\[\033[38;5;245m\]"
AT="\[\033[38;5;245m\]"
HCOLOR="\[\033[38;5;206m\]"

alias la="ls -la"

export PATH=$HOME/miniconda3/bin:$HOME/bin:$HOME/.local/bin:$PATH

check_conda_env ()
{
    if [ ! -z "$CONDA_DEFAULT_ENV" ]; then
        printf -- "%s" "${HCOLOR}[`basename $CONDA_DEFAULT_ENV`]\[\e[0m\] "
    fi
}

source $HOME/bin/git-prompt.sh
PROMPT_COMMAND='__posh_git_ps1 "$(check_conda_env)${FG}\u${AT}@${HCOLOR}\H ${BG}\w\[\e[0m\]" "${FG}\\\$ \[\e[0m\]";'$PROMPT_COMMAND
eval "$(register-python-argcomplete conda)"
