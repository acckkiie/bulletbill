#!/bin/zsh
set -eu

echo -n "Git Name:"
read -r gitname
echo -n "Git Email:"
read -r gitemail
echo -n "PC Password:"
read -rs password
echo

# ./shellscripts/setdotfiles.sh
./shellscripts/installpackages.sh $password
./shellscripts/asdf.sh
