#!/bin/bash
set -eu

appaccount=$1
apppassword=$2
password=$3

# install Homebrew
# http://qiita.com/oooaoii/items/c14922eede6a83a750da
curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install > installhomebrew.rb
./autoreply.sh "ruby installhomebrew.rb" $password
rm -rf installhomebrew.rb

# add repository
exec < Brewrepository
while read line
do
    if ! echo "$line" | grep -sq "#"; then
        brew tap "$line" &
    fi
done
wait

# install commands
exec < Brewfile
while read line
do
    if ! echo "$line" | grep -sq "#"; then
        ./autoreply.sh "brew install ${line}" $password &
    fi
done
wait 

# http://scribble.washo3.com/mac/homebrew-install-gui-wireshark.html
brew linkapps

# clean old version Packages
brew cleanup

# install applications by homebrew-cask
exec < Brewcaskfile
while read line
do
    if ! echo "$line" | grep -sq "#"; then
        ./autoreply.sh "brew cask install ${line}" $password &
    fi
done
wait

# cleanup .dmg
brew cask cleanup

# install Applications using mas fron AppStore
./autoreply.sh "mas signin ${appaccount}" $apppassword
exec < Masfile
while read line
do
    if ! echo "$line" | grep -sq "#"; then
        ./autoreply.sh "mas install ${line}" $password &
    fi
done
wait
