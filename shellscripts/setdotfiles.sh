#!/bin/zsh
set -eu

for dotfile in resources/dotfiles/*; do
    ln -snf "resources/dotfiles/$dotfile" "~/$dotfile"
done
