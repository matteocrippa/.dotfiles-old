#!/bin/bash

yay -Sy rofi

mkdir -p ~/.config/rofi
ln -sfT ~/.dotfiles/rofi/config ~/.config/rofi/config
ln -sfT ~/.dotfiles/rofi/aliases.sh ~/.config/rofi/aliases.sh
