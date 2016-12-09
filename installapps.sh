#!/bin/bash
set -eu

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
    brew cask install eclipse-ide
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
    brew cask install visual-studio-code
    brew cask install wireshark
    brew cask install wireshark-chmodbpf

# http://qiita.com/jyotti/items/48115f54ffbf6dfdf6f2
    brew cask install java7
    brew cask install java6

# Cleanup .dmg
    brew cask cleanup

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

# Clean old version Packages
    brew cleanup
