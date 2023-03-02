#!/usr/bin/env zsh
#
# Defines some local variables, post-zshrc.
#
# Authors:
#   Yendor <lecoqjacob@gmail.com>
#

# Projects directory
export PROJECTS="$HOME/projects"

# chmod
alias chmox="chmod +x"

# ls
alias l='ls -alG'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias ls='exa --header --icons'
eval "$(dircolors -b  ~/.config/dircolors/dircolors-solarized/dircolors.ansi-dark)"

# cp
alias cp="cp -i"

# df
alias df="df -h"

# free
alias free="free -m"

# Rendermark
export RENDERMARK_DEFAULT_FILEPATH="README.md"

# The Fuck
eval "$(thefuck --alias)"

# Color man pages
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export LESS=-R

# Wakatime
export ZSH_WAKATIME_PROJECT_DETECTION=true

# Make Kitty play nicely with SSH (see https://github.com/kovidgoyal/kitty/issues/1613#issuecomment-734753530)
if test "$TERM" = "xterm-kitty"
then
    alias ssh="kitty +kitten ssh"
fi