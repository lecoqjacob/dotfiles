#!/usr/bin/env zsh
#
# Configure ZSH
#
# Authors:
#   Yendor <lecoqjacob@gmail.com>
#

## Powerlevel10k
source "$HOME/.p10k.zsh"

ZSH="$HOME/.oh-my-zsh"

## Options
setopt correct                  								# Auto correct mistakes
setopt extendedglob             								# Extended globbing. Allows using regular expressions with *
setopt nocaseglob               								# Case insensitive globbing
setopt rcexpandparam            								# Array expension with parameters
setopt nocheckjobs              								# Don't warn about running processes when exiting
setopt numericglobsort          								# Sort filenames numerically when it makes sense
setopt nobeep                   								# No beep
setopt inc_append_history       								# Immediately append history instead of overwriting
setopt histignorealldups        								# If a new command is a duplicate, remove the older one
setopt autocd                   								# if only directory path is entered, cd there.
setopt inc_append_history       								# save commands are added to the history immediately, otherwise only when shell exits.
setopt histignorespace          								# Don't save commands that start with space

zstyle ':completion:*' insert-tab pending # pasting with tabs doesn't perform completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                              # automatically find new executables in path

# Speed up completions
zstyle ':completion:*' use-cache on
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' cache-path ~/.zsh/cache

zstyle ':omz:update' mode auto      # update automatically without asking

HISTSIZE=10000
SAVEHIST=10000
HIST_STAMPS="mm/dd/yyyy"
COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"

## Plugins
plugins=(
    branch
    copyfile colorize
    gh git-auto-fetch gitfast git-prompt
    npm
    sudo systemd
    rust
    themes
    web-search
    yarn
    zellij
    zsh-autosuggestions zsh-syntax-highlighting zsh-wakatime
)
source $ZSH/oh-my-zsh.sh  # Oh-my-zsh

#====================
#==== Starship
#====================
eval "$(starship init zsh)"

#====================
#==== FNM
#====================
eval "$(fnm env --use-on-cd)"