#!/bin/bash

rm -Rf ~/.profile
ln -sfT ~/.dotfiles/config/profile ~/.profile

rm -Rf ~/.config/alacritty
ln -sfT ~/.dotfiles/config/alacritty ~/.config/alacritty

yay -Sy nerd-fonts-complete
yay -Sy ttf-font-awesome
yay -Sy noto-fonts-emoji

sudo ln -sfT ~/.dotfiles/polybar/95-battery.rules /etc/udev/rules.d/
