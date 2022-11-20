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
"---install commands---"
yes | sudo apt install --no-install-recommends zsh build-essential python3 python3-pip python3-dev ranger curl wget git vim tlp powertop w3m w3m-img htop atool rclone sqlite3 \
network-manager openssh-server proxychains openssl ca-certificates tor \
--no-install-recommends software-properties-common apt-transport-https ppa-purge \
neofetch
yes | sudo apt install --install-recommends linux-generic-hwe-22.04
yes | sudo apt purge needrestart
##Neovim
yes | sudo add-apt-repository ppa:neovim-ppa/stable
yes | sudo apt update
yes | sudo apt install neovim

#---GUI---
echo "---install GUI apps---"
##Desktop Environment
yes | sudo apt install --no-install-recommends xinit network-manager-gnome light picom arandr blueman \
feh vlc ristretto screengrab evince
yes | sudo apt install xserver-xorg i3 i3status polybar rxvt-unicode x11-xserver-utils dmenu libgtk-3-0 xss-lock \
xarchiver thunar gvfs autofs gvfs-backends thunar-archive-plugin ntfs-3g \
fcitx5 fcitx5-mozc fonts-ubuntu fonts-noto-cjk fonts-noto-cjk-extra \
qemu-system libvirt-clients libvirt-daemon-system \
gimp gimp-gmic filezilla thunderbird ffmpegthumbnailer 
##Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O ~/google-chrome.deb
yes | sudo apt update
yes | sudo apt install ~/google-chrome.deb
rm ~/google-chrome.deb
##Inkscape 
yes | sudo add-apt-repository ppa:inkscape.dev/stable
yes | sudo apt update
yes | sudo apt install inkscape
##Visual Studio Code
yes | curl -sSL https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor -o /usr/share/keyrings/ms-vscode-keyring.gpg
yes | echo "deb [arch=amd64 signed-by=/usr/share/keyrings/ms-vscode-keyring.gpg] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
yes | sudo apt update
yes | sudo apt install code
###VSCode setting
echo "---set Visual Studio Code---"
mkdir -p ~/.config/Code/User
VSCODE_SETTING_DIR=~/.config/Code/User
rm "$VSCODE_SETTING_DIR/settings.json"
ln -snfv "$(pwd)/vscode/settings.json" "${VSCODE_SETTING_DIR}/settings.json"
cat "$(pwd)/vscode/extensions" | while read line
do
 code --install-extension $line
done
code --list-extensions > "$(pwd)/vscode/extensions"
echo "---set Visual Studio Code completed---"

#---Sound(PipeWire)---
echo "---set sound---"
yes | sudo apt install pipewire \
libspa-0.2-bluetooth libspa-0.2-jack \
pipewire-audio-client-libraries \
#LDAC Bluetooth ABR library (shared library)
#LDAC Bluetooth encoder library (shared library)
yes | sudo apt install libldacbt-abr2 libldacbt-enc2
yes | sudo apt install wireplumber pipewire-media-session-
systemctl --user --now enable wireplumber.service
yes | sudo apt install --no-install-recommends pavucontrol

#Flatpak
echo "---install flatpak---"
yes | sudo apt install flatpak
yes | flatpak update

echo "---change caps to ctrl---"
sudo cp keyboard /etc/default/keyboard
sudo systemctl restart console-setup

echo "---Installation completed---"
