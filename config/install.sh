#!/bin/bash

ln -sfT ~/.dotfiles/config/profile ~/.profile

rm -Rf ~/.config/alacritty
ln -sfT ~/.dotfiles/config/alacritty ~/.config/alacritty

echo_info "Enable gestures..."
yay -Sy libinput-gestures
sudo gpasswd -a $USER input
ln -sfT ~/.dotfiles/config/libinput-gestures.conf ~/.config/libinput-gestures.conf
libinput-gestures-setup autostart
libinput-gestures-setup start

yay -Sy nerd-fonts-complete
yay -Sy ttf-font-awesome
yay -Sy noto-fonts-emoji

sudo ln -sfT ~/.dotfiles/polybar/95-battery.rules /etc/udev/rules.d/

