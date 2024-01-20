#!/bin/zsh
set -eu

appaccount=$1
apppassword=$2
password=$3

# install Homebrew
# http://qiita.com/oooaoii/items/c14922eede6a83a750da
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh > install.sh
./autoreply.sh "/bin/bash -c install.sh" $password
rm -rf install.sh

# install commands and applications
brew install mas
./autoreply.sh "mas signin ${appaccount}" $apppassword

# clean old version Packages
brew cleanup
