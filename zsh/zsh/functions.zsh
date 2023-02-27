#!/usr/bin/env zsh
#
# Defines some usefull functions, post-zshrc.
#
# Authors:
#   Yendor <lecoqjacob@gmail.com>
#

function reload_zsh() { 
    echo "Reloading zshrc..."; 
    source ~/.zshrc;
}

# Make a new directory and enter it.
mk() {
    mkdir "$@" && cd "$@"
}

# Quickly enter a project directory.
c() {
    cd "$PROJECTS/$1"
}

# Quickly open VS Code in a project directory
v() {
    code "$PROJECTS/$1"
}

# Quickly open VS code in the current directory
vwd() {
    code $(pwd)
}

# List everything in the current directory with nice defaults
d() {
    du --human-readable --all --max-depth 1 "$@" | sort --human-numeric-sort --reverse
}

# Start programs silently and without making them dependent on an open terminal
start() {
    nohup "$@" > /dev/null 2> /dev/null
}

# Clear downloads
clrdl() {
    setopt localoptions rmstarsilent
    rm $HOME/tmp/dl/* -rf
}

# Clear bluetooth transfers
clrkde() {
    setopt localoptions rmstarsilent
    rm $HOME/tmp/kdeconnect/* -rf
}

# Clear misc temp files
clrmisc() {
    setopt localoptions rmstarsilent
    rm $HOME/tmp/misc/* -rf
}

# Clear temporary files
clrtmp() {
    clrdl
    clrkde
    clrmisc
}

## Dotfile management ##

# Update dotfiles
dfu() {
    cd "$PROJECTS/dotfiles" && git pull --ff-only && ./install
}

# Update VS Code extensions list
upext() {
    xin "$PROJECTS/dotfiles" ./script/code-export-ext && git reset > /dev/null && git stage "vscode/extensions.txt" > /dev/null && git commit -m "Update extensions list" && git push
}

# Remove from PATH
path_remove() {
    PATH=$(echo -n "$PATH" | awk -v RS=: -v ORS=: "\$0 != \"$1\"" | sed 's/:$//')
}

# Append to PATH
path_append() {
    path_remove "$1"
    PATH="${PATH:+"$PATH:"}$1"
}

# Prepend to PATH
path_prepend() {
    path_remove "$1"
    PATH="$1${PATH:+":$PATH"}"
}