#!/bin/bash

yay -Sy neovim python2-neovim python-neovim --needed --noconfirm

yay -Sy nodejs-neovim --needed --noconfirm

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p ~/.config/nvim
ln -sfT ~/.dotfiles/nvim/init.vim ~/.config/nvim/init.vim

ln -sfT ~/.dotfiles/nvim/ftplugin ~/.config/nvim/ftplugin

