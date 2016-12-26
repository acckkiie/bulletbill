#!/bin/bash
set -eu
gitname=$1
gitemail=$2
password=$3

# git global setting
git config --global user.name $gitname
git config --global user.email $gitemail

# http://d.hatena.ne.jp/katz_24/20120126/1327586474
echo "export PATH=/usr/local/bin:\$PATH" >> ~/.bash_profile
echo "export PATH=\$(brew --prefix coreutils)/libexec/gnubin:\$PATH" >> ~/.bash_profile
echo "export MANPATH=\$(brew --prefix coreutils)/libexec/gnuman:\$MANPATH" >> ~/.bash_profile

# change view of bash
echo "export PS1='\[\e[1;34m\][\d \t \u@\h \W]\$\[\e[0m\] '" >> ~/.bash_profile

# alias setting
echo "alias diff='colordiff'" >> ~/.bashrc
echo "alias ls='ls --color=auto'" >> ~/.bashrc
echo "alias awk='gawk'" >> ~/.bashrc
echo "alias rm='rmtrash'" >> ~/.bashrc
echo "alias tree='tree -N'" >> ~/.bashrc

# shopt setting
echo "shopt -s autocd"  >> ~/.bashrc
echo "shopt -s cdspell" >> ~/.bashrc
echo "shopt -s dotglob" >> ~/.bashrc
echo "shopt -s extglob" >> ~/.bashrc

# load .bashrc automatically
echo "source ~/.bashrc" >> ~/.bash_profile

# http://qiita.com/key-amb/items/d053ed80590697435650
set +eu
./autoreply.sh "sudo sh -c \"echo '/usr/local/bin/bash' >> /etc/shells\"" $password
./autoreply.sh "chsh -s /usr/local/bin/bash" $password
set -eu
/usr/local/bin/bash

# reload
source ~/.bash_profile

# font
# http://qiita.com/muran001/items/409b8cb42cca02b147a0#tmuxを入れてクリップボード共有もついでにやっておく

# http://qiita.com/upinetree/items/cd80bc7865c52091be10
# .tmux.conf
# set-option -g default-command "reattach-to-user-namespace -l bash"

# Install Environment
# jenkins
# http://qiita.com/imura81gt/items/860ac6196e571c17b7e1
# http://qiita.com/muran001/items/409b8cb42cca02b147a0#tmuxを入れてクリップボード共有もついでにやっておく
