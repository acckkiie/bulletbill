#!/bin/bash

# This is the initialization for Mac OSX

# Install Homebrew
# http://qiita.com/oooaoii/items/c14922eede6a83a750da
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# TODO check xcode-select --install

# Make sure using latest Homebrew
brew update || true

# Update already-installed formula
brew upgrade || true

# Add Repository
brew tap homebrew/versions    || true
brew tap homebrew/binary      || true
brew tap phinze/homebrew-cask || true
brew tap caskroom/versions    || true
brew tap homebrew/dupes       || true

# Install Packages
# http://qiita.com/eumesy/items/3bb39fc783c8d4863c5f
brew install coreutils                      || true
brew install diffutils                      || true
brew install colordiff                      || true
brew install findutils --with-default-names || true
brew install gnu-sed --with-default-names   || true
brew install gnu-tar --with-default-names   || true
brew install grep --with-default-names      || true
brew install gzip                           || true
brew install gawk                           || true

# http://klabgames.tech.blog.jp.klab.com/archives/1047107113.html
brew install autoconf || true
brew install automake || true
brew install libtool  || true
# TODO http://kopan580.hatenadiary.com/entry/2016/01/30/223044

# http://blog.glidenote.com/blog/2013/02/28/the-silver-searcher-better-than-ack/
brew install ag || true
# TODO check Bundle 'rking/ag.vim'

# http://tech.basicinc.jp/JavaScript/2013/05/17/json_jq/
brew install jq || true

# http://qiita.com/massa142/items/ef39b9192c0955720f8d
brew install nkf || true

# http://bicycle1885.hatenablog.com/entry/2014/08/10/143612
brew install parallel || true

# http://www.softantenna.com/wp/mac/rmtrash/
brew install rmtrash || true

# http://qiita.com/kanuma1984/items/c158162adfeb6b217973
brew install tree || true

# http://momijiame.tumblr.com/post/50746752938/watch-%E3%82%B3%E3%83%9E%E3%83%B3%E3%83%89%E3%81%A6%E4%BE%BF%E5%88%A9%E3%81%A0%E3%82%88%E3%81%AD
brew install watch || true

# http://km-d.blogspot.jp/2012/06/mac-osx-wget-homebrew.html
brew install wget || true

# http://qiita.com/micheleno13/items/133aee005ae37c28960e
# http://www.paka3.net/github05/
brew install git  || true
brew install gist || true

# http://rcmdnk.github.io/blog/2016/02/13/computer-mac/
brew install mas || true

# https://caskroom.github.io/
brew install brew-cask || true

# http://qiita.com/okamos/items/c97970ab34ff55ff3167
brew install vim || true

# http://qiita.com/vintersnow/items/be4b29652ff665c45198
# http://qiita.com/upinetree/items/cd80bc7865c52091be10
brew install tmux                       || true
brew install reattach-to-user-namespace || true

# http://scribble.washo3.com/mac/homebrew-install-gui-wireshark.html
brew linkapps


# export PATH=/usr/local/opt/coreutils/libexec/gnubin:${PATH}
# export MANPATH=/usr/local/opt/coreutils/libexec/gnuman:${MANPATH}
# alias diff='colordiff'
# alias awk='gawk'
# alias rm='rmtrash'