#!/bin/bash

mkdir -p ~/.i3
rm -Rf ~/.i3/config
rm -Rf ~/.config/i3
ln -sfT ~/.dotfiles/i3/config ~/.i3/config
