#!/bin/zsh
set -eu

foldername=$(pwd)
for dotfile in $(ls -a resources/dotfiles/.*); do
    filename=$(basename ${dotfile})
    ln -snf ${foldername}/resources/dotfiles/${filename} ~/${filename}
done
