#!/bin/bash
#---Files---
echo "---create folders---"
mkdir ~/Downloads
mkdir ~/Documents
mkdir ~/Pictures
mkdir ~/Pictures/screenshot
mkdir ~/Pictures/wallpaper 
for i in wallpaper/*; do
    cp "$i" ~/Pictures/"$i"
done
mkdir ~/workspace
mkdir ~/tmp
mkdir ~/.fonts

echo "---install apps---"
yes | sudo apt update
yes | sudo apt upgrade

#---Commands---
##essential commands
echo "---install commands---"
yes | sudo apt install --no-install-recommends zsh build-essential python3 python3-pip python3-dev ranger curl wget git vim tlp powertop w3m w3m-img htop atool rclone sqlite3 \
network-manager openssh-server proxychains openssl ca-certificates tor \
software-properties-common apt-transport-https ppa-purge \
neofetch
yes | sudo apt purge needrestart

#---GUI---
echo "---install GUI apps---"
##Desktop Environment
yes | sudo apt install --no-install-recommends xinit network-manager-gnome light picom arandr blueman \
feh vlc ristretto screengrab evince
yes | sudo apt install xserver-xorg i3 i3status polybar rxvt-unicode x11-xserver-utils dmenu libgtk-3-0 xss-lock \
xarchiver thunar gvfs autofs gvfs-backends thunar-archive-plugin ntfs-3g \
fcitx5 fcitx5-mozc fonts-noto fonts-noto-cjk fonts-noto-cjk-extra ttf-ancient-fonts-symbola fonts-noto-color-emoji \
qemu-system libvirt-clients libvirt-daemon-system \
gimp gimp-gmic filezilla thunderbird ffmpegthumbnailer 

##Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O ~/google-chrome.deb
yes | sudo apt update
yes | sudo apt install ~/google-chrome.deb
rm ~/google-chrome.deb

##Visual Studio Code
yes | curl -sSL https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor -o /usr/share/keyrings/ms-vscode-keyring.gpg
yes | echo "deb [arch=amd64 signed-by=/usr/share/keyrings/ms-vscode-keyring.gpg] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
yes | sudo apt update
yes | sudo apt install code

#---Input Method---
echo "---set input method"
rm -r ~/.config/fcitx5
cp -rf $(pwd)/fcitx5 ~/.config/fcitx5

echo "---change caps to ctrl---"
sudo cp keyboard /etc/default/keyboard
sudo systemctl restart console-setup

echo "---Installation completed---"