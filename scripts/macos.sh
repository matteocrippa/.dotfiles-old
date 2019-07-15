yay -Sy virtualbox virtualbox-host-modules-arch
sudo modprobe vboxdrv
sudo gpasswd -a matteo vboxusers
yay -Sy virtualbox-ext-oracle
git clone git@github.com:myspaghetti/macos-guest-virtualbox.git /tmp/vbox
cd /tmp/vbox
sh macos-guest-virtualbox.sh
