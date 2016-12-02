#!/bin/bash

# This is the initialization for Mac OSX

# Install Homebrew
# http://qiita.com/oooaoii/items/c14922eede6a83a750da
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# TODO check xcode-select --install

# Make sure using latest Homebrew
brew update

# Update already-installed formula
brew upgrade

# Add Repository
brew tap homebrew/versions
brew tap homebrew/binary
brew tap homebrew/dupes
brew tap phinze/homebrew-cask
brew tap caskroom/versions
brew tap peco/peco

# Install Packages
# http://qiita.com/takamario/items/982ddc85a6a924516301
brew install bash-completion

# http://qiita.com/eumesy/items/3bb39fc783c8d4863c5f
brew install coreutils
brew install diffutils
brew install colordiff
brew install findutils --with-default-names
brew install gawk
brew install gnu-sed --with-default-names
brew install gnu-tar --with-default-names
brew install grep --with-default-names
brew install gzip
# TODO check colordiff "less -R"

# http://klabgames.tech.blog.jp.klab.com/archives/1047107113.html
brew install autoconf
brew install automake
brew install libtool
# TODO http://kopan580.hatenadiary.com/entry/2016/01/30/223044

# https://caskroom.github.io/
brew install brew-cask

# http://blog.glidenote.com/blog/2013/02/28/the-silver-searcher-better-than-ack/
brew install ag
# TODO check Bundle 'rking/ag.vim'

# http://tech.basicinc.jp/JavaScript/2013/05/17/json_jq/
brew install jq

# http://qiita.com/massa142/items/ef39b9192c0955720f8d
brew install nkf

# http://bicycle1885.hatenablog.com/entry/2014/08/10/143612
brew install parallel

# http://www.softantenna.com/wp/mac/rmtrash/
brew install rmtrash

# http://qiita.com/kanuma1984/items/c158162adfeb6b217973
brew install tree

# http://momijiame.tumblr.com/post/50746752938/watch-%E3%82%B3%E3%83%9E%E3%83%B3%E3%83%89%E3%81%A6%E4%BE%BF%E5%88%A9%E3%81%A0%E3%82%88%E3%81%AD
brew install watch

# http://km-d.blogspot.jp/2012/06/mac-osx-wget-homebrew.html
brew install wget

# http://qiita.com/micheleno13/items/133aee005ae37c28960e
# http://www.paka3.net/github05/
brew install git
brew install gist

# http://gitpub.hatenablog.com/entry/2014/01/14/215659
brew install htop

# http://qiita.com/n-yamanaka/items/3268cdd2179d31a93ee3
brew install libyaml

# http://rcmdnk.github.io/blog/2016/02/13/computer-mac/
brew install mas

# http://qiita.com/vintersnow/items/be4b29652ff665c45198
# http://qiita.com/upinetree/items/cd80bc7865c52091be10
brew install tmux
brew install reattach-to-user-namespace

# http://qiita.com/okamos/items/c97970ab34ff55ff3167
brew install vim

# http://scribble.washo3.com/mac/homebrew-install-gui-wireshark.html
brew linkapps
# TODO what is this

# Install Environment
# anyenv
# mysql
# jenkins
# http://qiita.com/imura81gt/items/860ac6196e571c17b7e1
# http://qiita.com/muran001/items/409b8cb42cca02b147a0#tmuxを入れてクリップボード共有もついでにやっておく

# Install Applications using cask
brew cask install virtualbox
brew cask install alfred
brew cask install astah-community
brew cask install avast
brew cask install blender
brew cask install clipmenu
brew cask install cyberduck
brew cask install docker
brew cask install doxygen
brew cask install dropbox
brew cask install evernote
brew cask install genymotion
brew cask install google-chrome
brew cask install google-drive
brew cask install google-japanese-ime
brew cask install iterm2
brew cask install mysqlworkbench
brew cask install shiftit
brew cask install skype
brew cask install sourcetree
brew cask install teamviewer
brew cask install thunderbird
brew cask install totalspaces
brew cask install unity
brew cask install wireshark
# TODO eclipse, calendar

# Install Applications using mas fron AppStore
# Alfred (1.2)
mas install 405843582
# GarageBand (10.1.3)
mas install 682658836
# Evernote (6.10)
mas install 406056744
# LINE (4.10.2)
mas install 539883307
# SpeakLine (3.1.4)
mas install 441968334
# The Unarchiver (3.11.1)
mas install 425424353
# Slack (2.3.2)
mas install 803453959

# link
# brew-caskのappをalfredで探せるようにする
brew cask alfred link 

# font
# http://qiita.com/muran001/items/409b8cb42cca02b147a0#tmuxを入れてクリップボード共有もついでにやっておく

# Clean old version Packages
brew cleanup

# http://qiita.com/eumesy/items/3bb39fc783c8d4863c5f#coreutils-用に特別な-path-を通す理由
# export PATH=/usr/local/opt/coreutils/libexec/gnubin:${PATH}
# export MANPATH=/usr/local/opt/coreutils/libexec/gnuman:${MANPATH}

# http://qiita.com/upinetree/items/cd80bc7865c52091be10
# .tmux.conf (zshの部分は適宜変更)
# set-option -g default-command "reattach-to-user-namespace -l bash"

# Bash completion @bashenv
# if [ -f `brew --prefix`/etc/bash_completion ]; then
#  . `brew --prefix`/etc/bash_completion
# fi

#@ .bashrc
# if [ -d ${HOME}/.anyenv ] ; then
#     export PATH="$HOME/.anyenv/bin:$PATH"
#     eval "$(anyenv init -)"
#    for D in `ls $HOME/.anyenv/envs`
#    do
#        export PATH="$HOME/.anyenv/envs/$D/shims:$PATH"
#    done
# fi

# alias diff='colordiff'
# alias ls='ls --color=auto'
# alias awk='gawk'
# alias rm='rmtrash'

# git config --global user.name "4885rhkA"
# git config --global user.email "sun.moon.bow.reverse7@gmail.com"
