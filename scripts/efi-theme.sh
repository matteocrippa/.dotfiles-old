mkdir /boot/EFI/refind/themes
sudo git clone https://github.com/EvanPurkhiser/rEFInd-minimal.git /boot/EFI/refind/themes/minimal
sudo echo "include themes/minimal/theme.conf" | sudo tee -a /boot/EFI/refind/refind.conf
