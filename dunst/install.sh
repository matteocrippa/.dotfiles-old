#!/bin/bash

yay -Sy dunst

rm -Rf ~/.config/dunst
mkdir ~/.config/dunst
ln -sfT ~/.dotfiles/dunst/dunstrc ~/.config/dunst/dunstrc
