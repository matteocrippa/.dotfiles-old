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

# printer install
while true; do
    read -p 'do you want to install a printer y or n?' printer

    case $printer in
        [yY]* ) install_printer; break;;
        [nN]* ) break;;
        * ) echo 'Plase answer y or n';;
    esac
done

install_printer() {
    yay -Sy sane brother-dcp1610w cups brscan4 simple-scan-git system-config-printer
    sudo brsaneconfig4 -a name="Brother" model="DCP1610W" ip=192.168.0.16
    sudo systemctl enable org.cups.cupsd.service
    sudo systemctl start org.cups.cupsd.service
}
