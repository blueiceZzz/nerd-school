# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

####################################################################################
# BASH HISTORY
####################################################################################
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# eternal bash history
source $HOME/.eternal_bash_hist_snippet.bash

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar
# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

####################################################################################
# PROMPT STYLE
####################################################################################
# Color PS1 and display git branch
if [ -x /usr/bin/tput ] && tput setaf 1 >/dev/null 2>&1; then
    color_prompt=yes
else
    color_prompt=
fi
parse_git_branch() {
    git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
if [ "$color_prompt" = yes ]; then
    PS1='\[\e[1;32m\]\u@\h\[\e[m\] \[\e[1;31m\]\w\[\e[m\]\[\e[1;37m\]$(parse_git_branch)\[\e[m\]\n[\D{%T}]\[\e[1;32m\] \$\[\e[m\] '
else
    PS1='\u@\h \w$(parse_git_branch)\n[\D{%T}] \$ '
fi
# Reset formatting before each command so colors do not bleed into command output.
trap '[[ -t 1 ]] && tput sgr0' DEBUG

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

####################################################################################
# ALIAS
####################################################################################
# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# some more ls aliases
alias ll='ls -alhF'
alias la='ls -A'
alias l='ls -CF'
# Alias for docker-compose
alias docker-compose='docker compose'
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# git aliases
alias gst='git status'
alias gdd='git add'
alias gcm='git commit -m'
alias gcma='git commit --amend'
alias gcp='git cherry-pick'
alias gft='git fetch'
alias glg='git log'
alias gps='git push'
alias gpsup='git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)'
alias gpl='git pull'
alias gsw='git switch'
alias gsh='git stash'
alias ghide='git update-index --skip-worktree'
alias gunhide='git update-index --no-skip-worktree'
alias ghidden='git ls-files -v | grep "^S" | sed "s/^S //"'
# oneparking
alias dtib='dti bazel build'
alias dtit='dti bazel test'
alias dti-bdao='dti build linux-x86_64-gcc-8-debug --build-packages=missing -o rbp_*:ENABLE_AOS=OFF'
alias dti-td="dti test linux-x86_64-gcc-8-debug -ts all_test"
alias dti-mfpbbc="dti mfpb-configure --build-check -pbc linux-x86_64-gcc-8-relwithdebinfo-aos-off"
alias dti-cnbuild="dti build linux-x86_64-gcc-8-relwithdebinfo-aos-off --build-packages=missing"
alias dti-cntest="dti test linux-x86_64-gcc-8-relwithdebinfo-aos-off"
alias testmate="./setup_testmate.sh"
alias setcl="./setup_clangd.sh"
alias runre="./_generated/recompute_command.sh"

# wsl-network.service, px-proxy.service, wsl-vpnkit.service aliases
alias network-status='sudo journalctl -u wsl-network.service -f | grep -v "sudo"'
alias px-status='sudo journalctl -u px-proxy.service -f | grep -v "sudo"'
alias vpnkit-status='sudo journalctl -u wsl-vpnkit.service -f | grep -v "sudo"'
alias network-restart='sudo systemctl restart wsl-network.service'
alias px-restart='sudo systemctl restart px-proxy.service'
alias vpnkit-restart='sudo systemctl restart wsl-vpnkit.service'

####################################################################################
# ACCESS TOKENS AND AUTHENTIFICATION
####################################################################################

####################################################################################
# ONEPARKING TOOLS
####################################################################################
# dti API GW auto completions
if [[ -f "$HOME/.bash_completions/dti.sh" ]]; then
    source /home/zho7lr/.bash_completions/dti.sh
fi

####################################################################################
# PROXY AND CONNECTION
####################################################################################
export http_proxy="http://localhost:3128"
export https_proxy="http://localhost:3128"
export ftp_proxy="http://localhost:3128"
export no_proxy='no_proxy=127.0.0.1,127.*,10.*,169.254.*,172.16.*,172.17.*,172.18.*,172.19.*,172.20.*,172.21.*,172.22.*,172.23.*,172.24.*,172.25.*,172.26.*,172.27.*,172.28.*,172.29.*,172.30.*,172.31.*,192.168.*,::1,localhost,de.bosch.com,apac.bosch.com,emea.bosch.com,us.bosch.com,rb-artifactory.bosch.com,sourcecode01.de.bosch.com,sourcecode.socialcoding.bosch.com,dev.bosch.com,sourcecode06.dev.bosch.com,osd.bosch.com'

####################################################################################
# TOOL SETUP, PATHS, AND VENV
####################################################################################
# change dir, if not already in ~/repos or a subfolder of it
if [[ $(pwd) == /home/$USER ]]; then
    cd /home/$USER/repos
fi

# Add the users bin-directory to the path
export PATH=$HOME/bin:${PATH}
# Add bin path for python pkg, e.g. pre-commit
export PATH="$PATH:$HOME/.local/bin"

# PYENV setup
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)" # init pyenv in current shell
eval "$(pyenv virtualenv-init -)" # Load pyenv-virtualenv automatically

# PYTHON VENV
# Auto-activate .venv if it exists in the current directory or parent directories
auto_activate_venv() {
    local dir="$PWD"
    while [ "$dir" != "/" ]; do
        if [ -f "$dir/.venv/bin/activate" ]; then
            # Only activate if not already in a virtual environment or if it's a different one
            if [ -z "$VIRTUAL_ENV" ] || [ "$VIRTUAL_ENV" != "$dir/.venv" ]; then
                source "$dir/.venv/bin/activate"
            fi
            return
        fi
        dir="$(dirname "$dir")"
    done
}
# Run auto-activation on cd
cd() {
    builtin cd "$@" && auto_activate_venv
}
# Auto-activate when opening a new terminal
auto_activate_venv

# use local poetry version, if one is installed in the .venv
poetry() {
    # Get the current directory and all parent directories
    local dir="$PWD"
    while [ "$dir" != "/" ]; do
        local base="$(basename "$dir")"
        if [[ "$base" == dasem* ]]; then
            if [ -x "$dir/.venv/bin/poetry" ]; then
                "$dir/.venv/bin/poetry" "$@"
                return
            fi
        fi
        dir="$(dirname "$dir")"
    done
    command poetry "$@"
}

# JULIA
# >>> juliaup initialize >>>
# Ensure juliaup's Julia takes precedence over system Julia (/usr/bin/julia)
export PATH=$HOME/.juliaup/bin:${PATH}
# !! Contents within this block are managed by juliaup !!

case ":$PATH:" in
    *:/home/zho7lr/.juliaup/bin:*)
        ;;

    *)
        export PATH=/home/zho7lr/.juliaup/bin${PATH:+:${PATH}}
        ;;
esac

# <<< juliaup initialize <<<
