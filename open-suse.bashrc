check_conda_env ()
{
    if [ ! -z "$CONDA_DEFAULT_ENV" ]; then
        printf -- "%s" "\[\e[0;35m\][`basename $CONDA_DEFAULT_ENV`]\[\e[0m\] "
    fi
}

source $HOME/bin/git-prompt.sh
PROMPT_COMMAND='__posh_git_ps1 "\[\e]0;\u@\h: \w\a\]$(check_conda_env)\[\e[01;32m\]\u@\h\[\e[00m\]:\[\e[01;34m\]\w\[\e[00m\]" "\\\$ ";'$PROMPT_COMMAND
eval "$(register-python-argcomplete conda)"
