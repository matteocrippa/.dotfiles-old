#!/bin/bash

# force update all
yay -Syyu

# install apps
. packages.sh

for pkg in "${PKG[@]}"; do
    echo "Installing ${pkg}"
    yay -Sy $pkg --needed --noconfirm
done
