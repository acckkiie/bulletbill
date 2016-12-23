#!/bin/bash
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

./setfiles.sh $password
./setbrew.sh  $appaccount $apppassword $password
./setbash.sh $gitname $gitemail $password
./setanyenv.sh
