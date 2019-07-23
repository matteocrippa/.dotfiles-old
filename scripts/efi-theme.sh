mkdir /boot/EFI/refind/themes
sudo git clone https://github.com/EvanPurkhiser/rEFInd-minimal.git /boot/EFI/refind/themes/rEFInd-minimal
sudo echo "include themes/rEFInd-minimal/theme.conf" | sudo tee -a /boot/EFI/refind/refind.conf
