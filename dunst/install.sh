#!/bin/bash

yay -Sy dunst

ln -sfT "$HOME/.dotfiles/dunst/dunstrc" "$HOME/.config/dunst/dunstrc"
