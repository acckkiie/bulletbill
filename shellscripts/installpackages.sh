#!/bin/zsh
set -eu

password=$1
foldername=$(pwd)

# install Homebrew
curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh > install.sh
./shellscripts/ "/bin/bash -c install.sh" $password
rm -rf install.sh

# install commands and applications
./shellscripts/autoreply.sh "brew bundle --file ${foldername}/resources/homebrew/Brewfile" $password

# clean old version Packages
brew cleanup
