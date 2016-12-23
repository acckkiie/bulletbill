#!/bin/bash
set -eu
gitname=$1
gitemail=$2

# http://qiita.com/key-amb/items/d053ed80590697435650
./autoreply.sh "echo '/usr/local/bin/bash' | sudo tee -a /etc/shells"
chsh -s /usr/local/bin/bash

# bash setting
shopt -s autocd
shopt -s cdspell
shopt -s dotglob
shopt -s extglob

# http://d.hatena.ne.jp/katz_24/20120126/1327586474
echo "/usr/local/bin:\$PATH" >> ~./bash_profile
echo "export PATH=\$(brew --prefix coreutils)/libexec/gnubin:\$PATH" >> ~/.bash_profile
echo "export MANPATH=\$(brew --prefix coreutils)/libexec/gnuman:\$MANPATH" >> ~/.bash_profile

# .bashrc setting
echo "alias diff='colordiff'" >> ~/.bashrc
echo "alias ls='ls --color=auto'" >> ~/.bashrc
echo "alias awk='gawk'" >> ~/.bashrc
echo "alias rm='rmtrash'" >> ~/.bashrc
echo "alias tree='tree -N'" >> ~/.bashrc

# load .bashrc automatically
echo "source ~/.bashrc" >> ~/.bash_profile

# change view of bash
"export PS1='\[\e[1;34m\][\d \t \u@\h \W]\$\[\e[0m\] '" >> ~/.bash_profile

# reload
source ~/.bash_profile
source ~/.bashrc

git config --global user.name $gitname
git config --global user.email $gitemail

# font
# http://qiita.com/muran001/items/409b8cb42cca02b147a0#tmuxを入れてクリップボード共有もついでにやっておく

# http://qiita.com/upinetree/items/cd80bc7865c52091be10
# .tmux.conf
# set-option -g default-command "reattach-to-user-namespace -l bash"

# Install Environment
# mysql
# jenkins
# http://qiita.com/imura81gt/items/860ac6196e571c17b7e1
# http://qiita.com/muran001/items/409b8cb42cca02b147a0#tmuxを入れてクリップボード共有もついでにやっておく
