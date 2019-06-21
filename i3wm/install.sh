#!/bin/bash

mkdir -p ~/.i3
rm -Rf ~/.i3/config
rm -Rf ~/.config/i3
ln -sfT ~/.dotfiles/i3wm/config ~/.i3/config
