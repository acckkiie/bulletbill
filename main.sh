#!/bin/bash
set -eu

cd ~

# Check bash files
    if [ -f .bash_profile ]; then
        echo "Use existed .bash_profile"
    else
        touch .bash_profile
        chmod 644 .bash_profile
        echo "Created .bash_profile"
    fi

    if [ -f .bashrc ]; then
        echo "Use existed .bashrc" 
    else
        touch .bashrc
        chmod 644 .bashrc
        echo "Created .bashrc"
    fi

# Check alerady file existed
    if [ -d /usr/local/include ]; then
        echo "Use existed /usr/local/include" 
    else
        mkdir /usr/local/include
        chmod 755 /usr/local/include
        echo "Created /usr/local/include"
    fi

# Check environment automatically for Installing Homebrew
    xcode-select --install

# Install Homebrew
# http://qiita.com/oooaoii/items/c14922eede6a83a750da
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install Homebrew and commands
    ./installbrew.sh

# Install applications by homebrew-cask
    ./installapps.sh

# Install anyenv
    ./installanyenv.sh

# Set configration
    ./setbash.sh $1 $2
