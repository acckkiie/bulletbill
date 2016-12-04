#!/bin/bash

cd ~
if [ -f .bash_profile ]; then
    echo "Use exisiting .bash_profile"
else
    touch .bash_profile
    echo "Created .bash_profile"
fi

if [ -f .bashrc ]; then
    echo "Use exisiting .bashrc" 
else
    touch .bashrc
    echo "Created .bashrc"
fi

./installbrew.sh
./installapps.sh
./installanyenv.sh
./setbash.sh
