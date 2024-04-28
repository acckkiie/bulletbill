#!/bin/zsh
set -eu

echo -n "PC Password:"
read -rs password
echo

./shellscripts/installdotfiles.sh
./shellscripts/installpackages.sh $password
