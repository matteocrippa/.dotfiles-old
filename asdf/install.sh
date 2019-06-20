#!/bin/bash

git clone https://github.com/asdf-vm/asdf.git ~/.asdf

SAVED_DIR=$PWD

cd ~/.asdf || exit

git checkout "$(git describe --abbrev=0 --tags)"

cd "$SAVED_DIR" || exit

ln -sfT ~/.dotfiles/asdf/asdfrc ~/.asdfrc

ln -sfT ~/.dotfiles/asdf/tool-versions ~/.tool-versions

asdf update

asdf plugin-add R
asdf plugin-add nodejs

asdf plugin-update --all

