#!/bin/bash
set -eu

password=$1

if [ -f ~/.bash_profile ]; then
    echo "Use existed ~/.bash_profile"
else
    touch ~/.bash_profile
    ./autoreply.sh "sudo chmod 644 ~/.bash_profile" $password
    echo "Created ~/.bash_profile"
fi

if [ -f ~/.bashrc ]; then
    echo "Use existed ~/.bashrc" 
else
    touch ~/.bashrc
    ./autoreply.sh "sudo chmod 644 ~/.bashrc" $password
    echo "Created ~/.bashrc"
fi

if [ -d /usr/local/include ]; then
    echo "Use existed /usr/local/include" 
else
    ./autoreply.sh "sudo mkdir /usr/local/include" $password
    ./autoreply.sh "sudo chmod 755 /usr/local/include" $password
    echo "Created /usr/local/include"
fi

if [ -f ~/.vimrc ]; then
    echo "Use existed ~/.vimrc" 
else
    mv .vimrc ~
    echo "Created ~/.vimrc"
fi
