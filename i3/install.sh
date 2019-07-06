#!/bin/bash

rm -Rf ~/.i3
rm -Rf ~/.config/i3
mkdir -p ~/.config/i3
ln -sfT ~/.dotfiles/i3/config ~/.config/i3/config
rm -Rf ~/.config/i3-scrot.conf
ln -sfT ~/.dotfiles/i3/i3-scrot.conf ~/.config/i3-scrot.conf
