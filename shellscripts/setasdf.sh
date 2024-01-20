#!/bin/zsh
set -eu

# install environment control
asdf plugin add python https://github.com/danhper/asdf-python.git &
asdf plugin-add php https://github.com/asdf-community/asdf-php.git &
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git &
asdf plugin-add java https://github.com/halcyon/asdf-java.git &
asdf plugin-add golang https://github.com/kennyp/asdf-golang.git &
wait
