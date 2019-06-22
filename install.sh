#!/bin/bash

# import packages
. packages.sh

# start x
if ! xset q &>/dev/null; then
    echo "No X server at \$DISPLAY [$DISPLAY]" >&2
    startx
    exit 1
fi

# force update all
yay -Syyu

# light install
light_install() {
    for pkg in "${LIGHT[@]}"; do
        echo "Installing ${pkg}"
        yay -Sy $pkg --needed --noconfirm
    done
}
light_install

# setup UI
prepare_ui() {
    dirs=$(find . -maxdepth 1 -mindepth 1 -type d -not -name '.git' -print)
    for dir in $dirs; do
        echo "Installing ${dir}..."
        cd "$dir" || exit
        ./install.sh
        cd ..
    done
}
prepare_ui

# install bash
prepare_bash() {
    yay -Sy terminess-powerline-font-git
    echo 'FONT=ter-powerline-v32n' | sudo tee /etc/vconsole.conf
    git clone https://github.com/petobens/trueline ~/.trueline
    echo 'source ~/.trueline/trueline.sh' >> ~/.bashrc
    echo 'source ~/.dotfiles/bash/aliases' >> ~/.bashrc
    chsh -s /bin/bash
}
prepare_bash

# full install with also extra apps
full_install() {
    for pkg in "${FULL[@]}"; do
        echo "Installing ${pkg}"
        yay -Sy $pkg --needed --noconfirm
    done
}

# install apps
while true; do
    read -p 'do you want to install full apps (suggested for workstation only)? (y or n) " ' fl

    case $fl in
        [yY]* ) full_install; break;;
        [nN]* ) break;;
        * ) echo 'Please answer y pr n';;
    esac
done

# printer install
install_printer() {
    yay -Sy sane brother-dcp1610w cups brscan4 simple-scan-git system-config-printer --needed --noconfirm
    sudo brsaneconfig4 -a name="Brother" model="DCP1610W" ip=192.168.0.16
    sudo systemctl enable org.cups.cupsd.service
    sudo systemctl start org.cups.cupsd.service
}

while true; do
    read -p 'do you want to install a printer? (y or n) ' printeryn

    case $printeryn in
        [yY]* ) install_printer; break;;
        [nN]* ) break;;
        * ) echo 'Plase answer y or n';;
    esac
done

# enable daemons
enable_daemons() {
    sudo systemctl enable fstrim.timer
    sudo systemctl enable systemd-timesyncd
    sudo systemctl start systemd-timesyncd
    sudo systemctl enable clamav-freshclam.service
    sudo systemctl enable clamav-daemon.service
}
enable_daemons

# prepare directories
prepare_dirs() {
    mkdir -p ~/work/repositories
    mkdir -p ~/work/material
    mkdir -p ~/gdrive
}
prepare_dirs

# prepare sncli
prepare_sncli() {
    ln -sft ~/.dotfiles/sncli/snclirc ~/.snclirc
}
prepare_sncli

# install macOS
install_macos() {
    git clone git@github.com:matteocrippa/macos-kvm.git ~/vm/macos
    cd ~/vm/macos
    ./install.sh
}

while true; do
    read -p 'do you want to install a macOS? (y or n) ' macosyn

    case $macosyn in
        [yY]* ) install_macos; break;;
        [nN]* ) break;;
        * ) echo 'Plase answer y or n';;
    esac
done

# install gestures
install_gestures() {
    yay -Sy libinput-gestures --needed --noconfirm
    sudo gpasswd -a $USER input
    ln -sfT ~/.dotfiles/config/libinput-gestures.conf ~/.config/libinput-gestures.conf
    libinput-gestures-setup autostart
    libinput-gestures-setup start
}

while true; do
    read -p 'do you want to install gestures? (y or n) ' gesturesyn

    case $gesturesyn in
        [yY]* ) install_gestures; break;;
        [nN]* ) break;;
        * ) echo 'Please answer y or n';;
    esac
done

# setup google drive
setup_gdrive() {
    export GDRIVE_DIR="gdrive"
    cd ~/${GDRIVE_DIR}
    grive -a
    sudo systemctl --user enable grive-timer@$(systemd-escape ${GDRIVE_DIR}).timer
    sudo systemctl --user start grive-timer@$(systemd-escape ${GDRIVE_DIR}).timer
    sudo systemctl --user enable grive-changes@$(systemd-escape ${GDRIVE_DIR}).service
    sudo systemctl --user start grive-changes@$(systemd-escape ${GDRIVE_DIR}).service
    cd ~
}
setup_gdrive

# cleanup
yay -Yc
