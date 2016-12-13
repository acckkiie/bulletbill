#!/bin/bash
set -eu

echo -n "Password:"
read -rs password
echo
echo -n "\nGit Name:"
read -r name
echo -n "Git Email:"
read -r email

# Check bash files
if [ -f ~/.bash_profile ]; then
    echo "Use existed ~/.bash_profile"
else
    touch ~/.bash_profile
    bulletbill/autoreply.sh "sudo chmod 644 ~/.bash_profile" $password
    echo "Created ~/.bash_profile"
fi

if [ -f ~/.bashrc ]; then
    echo "Use existed ~/.bashrc" 
else
    touch ~/.bashrc
    bulletbill/autoreply.sh "sudo chmod 644 ~/.bashrc" $password
    echo "Created ~/.bashrc"
fi

# Check alerady file existed
if [ -d /usr/local/include ]; then
    echo "Use existed /usr/local/include" 
else
    bulletbill/autoreply.sh "sudo mkdir /usr/local/include" $password
    bulletbill/autoreply.sh "sudo chmod 755 /usr/local/include" $password
    echo "Created /usr/local/include"
fi

# Install Homebrew
# http://qiita.com/oooaoii/items/c14922eede6a83a750da
curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install > bulletbill/installhomebrew.rb
bulletbill/autoreply.sh "ruby bulletbill/installhomebrew.rb" $password
rm -rf bulletbill/installhomebrew.rb

# Add repository
cat bulletbill/Brewrepository | while read line
do
    if ! echo "$line" | grep -sq "#"; then
        brew tap "$line"
    fi
done

# Install Homebrew and commands
cat bulletbill/Brewfile | while read line
do
    if ! echo "$line" | grep -sq "#"; then
        bulletbill/autoreply.sh "brew install ${line}" $password
    fi
done

# http://scribble.washo3.com/mac/homebrew-install-gui-wireshark.html
brew linkapps

# Clean old version Packages
brew cleanup

# Install applications by homebrew-cask
cat bulletbill/Brewcaskfile | while read line
do
    if ! echo "$line" | grep -sq "#"; then
        bulletbill/autoreply.sh "brew cask install ${line}" $password
    fi
done

# Cleanup .dmg
brew cask cleanup

# Install Applications using mas fron AppStore
cat bulletbill/Masfile | while read line
do
    if ! echo "$line" | grep -sq "#"; then
        bulletbill/autoreply.sh "mas install ${line}" $password
    fi
done

# Install anyenv
bulletbill/installanyenv.sh

# Set configration
bulletbill/setbash.sh $name $mail
