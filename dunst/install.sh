#!/bin/bash

yay -Sy dunst --needed --noconfirm

rm -Rf ~/.config/dunst
mkdir ~/.config/dunst
ln -sfT ~/.dotfiles/dunst/dunstrc ~/.config/dunst/dunstrc
