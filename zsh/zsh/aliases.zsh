#!/usr/bin/env zsh
#
# Defines some usefull aliases post-zshrc.
#
# Authors:
#   Yendor <lecoqjacob@gmail.com>
#



alias reload!='reload_zsh'
alias zshconfig="code ~/.zshrc"
alias ohmyzsh="code ~/.oh-my-zsh"
alias alacritty="code ~/.alacritty"

alias cls='clear' # Good 'ol Clear Screen command
alias pip=pip3
alias python=python3

# Show current DNS provider
alias dns="( nmcli dev list || nmcli dev show ) 2>/dev/null | grep DNS"

# Get battery charge status
alias batt="upower -i $(upower -e | grep BAT) | grep --color=never -E 'state|to\ full|to\ empty|percentage'"

# Something SFW
alias oops="fuck"

if [[ -e /usr/bin/rg ]]; then
    alias grep='rg'
    alias fgrep='rg'
    alias egrep='rg'
fi

if [[ "$OSTYPE" =~ ^darwin ]]; then
    if [[ -e /usr/bin/gdate ]]; then
        alias date='gdate'
    fi
fi

if [[ "$OSTYPE" =~ ^linux  ]]; then
  # Turn on/off fractional scaling
    alias fracon="gsettings set org.gnome.mutter experimental-features \"['x11-randr-fractional-scaling']\""
    alias fracoff="gsettings reset org.gnome.mutter experimental-features"
fi