#!/bin/bash
set -eu

appaccount=$1
apppassword=$2
password=$3

# Install Homebrew
# http://qiita.com/oooaoii/items/c14922eede6a83a750da
curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install > installhomebrew.rb
./autoreply.sh "ruby installhomebrew.rb" $password
rm -rf installhomebrew.rb

# Add repository
cat Brewrepository | while read line
do
    if ! echo "$line" | grep -sq "#"; then
        brew tap "$line"
    fi
done

# Install Homebrew and commands
cat Brewfile | while read line
do
    if ! echo "$line" | grep -sq "#"; then
        ./autoreply.sh "brew install ${line}" $password
    fi
done

# http://scribble.washo3.com/mac/homebrew-install-gui-wireshark.html
brew linkapps

# Clean old version Packages
brew cleanup

# Install applications by homebrew-cask
cat Brewcaskfile | while read line
do
    if ! echo "$line" | grep -sq "#"; then
        ./autoreply.sh "brew cask install ${line}" $password
    fi
done

# Cleanup .dmg
brew cask cleanup

# Install Applications using mas fron AppStore
./autoreply.sh "mas signin ${appaccount}" $apppassword
cat Masfile | while read line
do
    if ! echo "$line" | grep -sq "#"; then
        ./autoreply.sh "mas install ${line}" $password
    fi
done
