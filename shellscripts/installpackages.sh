#!/bin/zsh
set -eu

password=$1
foldername=$(pwd)

# install commands and applications
./shellscripts/autoreply.sh "brew bundle --file ${foldername}/resources/homebrew/Brewfile" $password

# clean old version Packages
brew cleanup
