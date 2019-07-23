#!/bin/bash

rm -Rf ~/.profile
ln -sfT ~/.dotfiles/config/profile ~/.profile

rm -Rf ~/.config/alacritty
ln -sfT ~/.dotfiles/config/alacritty ~/.config/alacritty

yay -Sy nerd-fonts-complete ttf-font-awesome noto-fonts-emoji --needed --noconfirm

sudo ln -sfT ~/.dotfiles/polybar/95-battery.rules /etc/udev/rules.d/

# laptop mode
sudo ln -sfT ~/.dotfiles/config/tlp /etc/default/tlp
sudo systemctl enable tlp
sudo systemctl enable tlp-sleep.service
sudo systemctl enable thermald
