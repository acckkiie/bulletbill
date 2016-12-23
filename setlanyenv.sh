#!/bin/bash
set -eu

# Clone files for anyenv
git clone https://github.com/riywo/anyenv ~/.anyenv

# Set .bash_profile
echo "export PATH=\$HOME/.anyenv/bin:\$PATH" >> ~/.bash_profile
echo "eval \"\$(anyenv init -)\"" >> ~/.bash_profile

# reload
source ~/.bash_profile

# Clone files for anyenv-update
mkdir -p $(anyenv root)/plugins
chmod 755 $(anyenv root)/plugins
git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update

# Install environment control
anyenv install rbenv
anyenv install pyenv
anyenv install phpenv
anyenv install ndenv
anyenv install jenv
anyenv install goenv

# http://qiita.com/jyotti/items/48115f54ffbf6dfdf6f2
jenv add `/usr/libexec/java_home -v 1.7`
jenv add `/usr/libexec/java_home -v 1.6`

# Reload
source ~/.bash_profile
