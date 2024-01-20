#!/bin/zsh
set -eu

echo -n "Git Name:"
read -r gitname
echo -n "Git Email:"
read -r gitemail
echo -n "AppStore Account:"
read -r appaccount
echo -n "AppStore Password:"
read -rs apppassword
echo
echo -n "PC Password:"
read -rs password
echo

shellscripts/setdotfiles.sh
shellscripts/sethomebrew.sh $appaccount $apppassword $password
shellscripts/setanyenv.sh
