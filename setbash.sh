#!/bin/bash
set -eu

# .bash_profile setting
# http://qiita.com/eumesy/items/3bb39fc783c8d4863c5f#coreutils-用に特別な-path-を通す理由
echo ". \$(brew --prefix)/etc/bash_completion" >> .bash_profile

# http://d.hatena.ne.jp/katz_24/20120126/1327586474
echo "/usr/local/bin:\$PATH" >> ~./bash_profile
echo "export PATH=\$(brew --prefix coreutils)/libexec/gnubin:\$PATH" >> .bash_profile
echo "export MANPATH=\$(brew --prefix coreutils)/libexec/gnuman:\$MANPATH" >> .bash_profile

# .bashrc setting
echo "alias diff='colordiff'" >> .bashrc
echo "alias ls='ls --color=auto'" >> .bashrc
echo "alias awk='gawk'" >> .bashrc
echo "alias rm='rmtrash'" >> .bashrc

# reload
source .bash_profile
source .bashrc

git config --global user.name $1
git config --global user.email $2

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