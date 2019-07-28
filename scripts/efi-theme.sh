sudo mkdir -p /boot/EFI/refind/themes
cd /boot/EFI/refind/themes
sudo git clone https://github.com/kgoettler/ursamajor-rEFInd.git
sudo echo "include themes/ursamajor-rEFInd/theme.conf" | sudo tee -a /boot/EFI/refind/refind.conf
