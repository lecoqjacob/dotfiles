#!/usr/bin/env zsh
#
# Defines Path variables, post-zshrc.
#
# Authors:
#   Yendor <lecoqjacob@gmail.com>
#

# User-provided executables
path_prepend "$HOME/bin:$HOME/.local/bin"

# Rust
path_append "$HOME/.cargo/bin"

# FNM
path_append "$HOME/.local/share/fnm"
