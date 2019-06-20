#!/bin/bash

yay -Sy ranger --need --noconfirm

mkdir -p ~/.config/ranger
ln -sfT ~/.dotfiles/ranger/rc.conf ~/.config/ranger/rc.conf

