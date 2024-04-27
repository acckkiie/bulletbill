#!/bin/zsh
set -eu

echo -n "PC Password:"
read -rs password
echo

./shellscripts/setdotfiles.sh
./shellscripts/installpackages.sh $password
