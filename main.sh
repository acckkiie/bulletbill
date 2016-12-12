#!/bin/bash
set -eu
password=$1
name=$2
email=$3

cd ~

# Check bash files
if [ -f .bash_profile ]; then
    echo "Use existed .bash_profile"
else
    touch .bash_profile
    ./autoreply.sh "sudo chmod 644 .bash_profile" $password
    echo "Created .bash_profile"
fi

if [ -f .bashrc ]; then
    echo "Use existed .bashrc" 
else
    touch .bashrc
    ./autoreply.sh "sudo chmod 644 .bashrc" $password
    echo "Created .bashrc"
fi

# Check alerady file existed
if [ -d /usr/local/include ]; then
    echo "Use existed /usr/local/include" 
else
    ./autoreply.sh "sudo mkdir /usr/local/include" $password
    ./autoreply.sh "sudo chmod 755 /usr/local/include" $password
    echo "Created /usr/local/include"
fi

# Check environment automatically for Installing Homebrew
./autoreply.sh "xcode-select --install" $password

# Install Homebrew
# http://qiita.com/oooaoii/items/c14922eede6a83a750da
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Add repository
cat ./Brewrepository | while read line
do
    if ! echo "$line" | grep -sq "#"; then
        brew tap "$line"
    fi
done

# Install Homebrew and commands
cat ./Brewfile | while read line
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
cat ./Brewcaskfile | while read line
do
    if ! echo "$line" | grep -sq "#"; then
        ./autoreply.sh "brew cask install ${line}" $password
    fi
done

# link
# brew-caskのappをalfredで探せるようにする
brew cask alfred link

# Cleanup .dmg
brew cask cleanup

# Install Applications using mas fron AppStore
cat ./Masfile | while read line
do
    if ! echo "$line" | grep -sq "#"; then
        ./autoreply.sh "mas install ${line}" $password
    fi
done

# Install anyenv
./installanyenv.sh

# Set configration
./setbash.sh $name $mail
