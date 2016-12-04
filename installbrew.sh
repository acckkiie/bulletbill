#!/bin/bash

# Check environment automatically for Installing Homebrew
    xcode-select --install

# Install Homebrew
# http://qiita.com/oooaoii/items/c14922eede6a83a750da
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Add repository
    brew tap homebrew/versions
    brew tap homebrew/binary
    brew tap homebrew/dupes
    brew tap phinze/homebrew-cask
    brew tap caskroom/versions
    brew tap peco/peco

# Install packages
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

# http://klabgames.tech.blog.jp.klab.com/archives/1047107113.html
    if [ -d /usr/local/include ]; then
        echo "Use existed /usr/local/include" 
    else
        mkdir /usr/local/include
        chmod 755 /usr/local/include
        echo "Created /usr/local/include"
    fi
    brew install autoconf
    brew install automake
    brew install libtool

# https://caskroom.github.io/
    brew install brew-cask

# http://rcmdnk.github.io/blog/2016/02/13/computer-mac/
    brew install mas

# http://blog.glidenote.com/blog/2013/02/28/the-silver-searcher-better-than-ack/
    brew install ag

# http://gitpub.hatenablog.com/entry/2014/01/14/215659
    brew install htop

# http://tech.basicinc.jp/JavaScript/2013/05/17/json_jq/
    brew install jq

# http://qiita.com/n-yamanaka/items/3268cdd2179d31a93ee3
    brew install libyaml

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

# http://qiita.com/vintersnow/items/be4b29652ff665c45198
# http://qiita.com/upinetree/items/cd80bc7865c52091be10
    brew install tmux
    brew install reattach-to-user-namespace

# http://qiita.com/okamos/items/c97970ab34ff55ff3167
    brew install vim

# http://scribble.washo3.com/mac/homebrew-install-gui-wireshark.html
    brew linkapps
