#!/bin/bash
set -eu

# clone files for anyenv
git clone https://github.com/riywo/anyenv ~/.anyenv

# set .bash_profile
echo "export PATH=\$HOME/.anyenv/bin:\$PATH" >> ~/.bash_profile
echo "eval \"\$(anyenv init -)\"" >> ~/.bash_profile

# reload
source ~/.bash_profile

# clone files for anyenv-update
mkdir -p $(anyenv root)/plugins
chmod 755 $(anyenv root)/plugins
git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update

# install environment control
anyenv install rbenv &
anyenv install pyenv &
anyenv install phpenv &
anyenv install ndenv &
anyenv install jenv &
anyenv install goenv &
wait

# install python environment's package control
git clone https://github.com/yyuu/pyenv-virtualenv.git ~/.anyenv/envs/pyenv/plugins/pyenv-virtualenv

# reload
source ~/.bash_profile

# rehash
pyenv rehash

# http://qiita.com/jyotti/items/48115f54ffbf6dfdf6f2
jenv add `/usr/libexec/java_home -v 1.7`
jenv add `/usr/libexec/java_home -v 1.6`

# reload
source ~/.bash_profile
