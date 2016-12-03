#!/bin/sh

# .bash_profile setting
# http://qiita.com/eumesy/items/3bb39fc783c8d4863c5f#coreutils-用に特別な-path-を通す理由
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    echo ". \$(brew --prefix)/etc/bash_completion" >> .bash_profile
fi
# http://qiita.com/yutackall/items/6c48cf56317d8501f6df
if [ -d ${HOME}/.anyenv ] ; then
    echo "export PATH=\$HOME/.anyenv/bin:\$PATH" >> .bash_profile
    echo "eval \$(anyenv init -)" >> .bash_profile
    for D in `ls $HOME/.anyenv/envs`
    do
        echo "export PATH=\$HOME/.anyenv/envs/$D/shims:\$PATH" >> .bash_profile
    done
fi
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