#!/bin/bash

# import packages
. packages.sh

# force update all
yay -Syyu

# install apps
while true; do
    read -p 'do you want to make "full" or "light" install?' fl

    case $fl in
        [fullFull]* ) light; full; break;;
        [lightLight]* ) light; break;;
        * ) echo 'Please answer full or light';;
    esac
done


# light install
light() {
    for pkg in "${LIGHT[@]}"; do
        echo "Installing ${pkg}"
        yay -Sy $pkg --needed --noconfirm
    done
}

# full install with also extra apps
full() {
    for pkg in "${FULL[@]}"; do
        echo "Installing ${pkg}"
        yay -Sy $pkg --needed --noconfirm
    done
}
