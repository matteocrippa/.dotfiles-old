yay -Sy virtualbox virtualbox-host-modules-arch
sudo modprobe vboxdrv
sudo gpasswd -a matteo vboxusers
yay -Sy virtualbox-ext-oracle
git clone git@github.com:myspaghetti/macos-guest-virtualbox.git ~/VirtualBox\ VMs/vbox
cd ~/VirtualBox\ VMs/vbox
sh macos-guest-virtualbox.sh
