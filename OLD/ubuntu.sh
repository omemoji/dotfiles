#!/bin/bash
cd debian

./install.sh

yes | sudo apt install --install-recommends linux-generic-hwe-22.04

##Java
yes | sudo apt install openjdk-19-jdk
yes | sudo apt purge needrestart
#PPA

##Neovim
yes | sudo add-apt-repository ppa:neovim-ppa/stable
yes | sudo apt update
yes | sudo apt install neovim

##Inkscape 
yes | sudo add-apt-repository ppa:inkscape.dev/stable
yes | sudo apt update
yes | sudo apt install inkscape

#---Sound(Pipewire)---
echo "---set sound---"
yes | sudo add-apt-repository ppa:pipewire-debian/pipewire-upstream
yes | sudo add-apt-repository ppa:pipewire-debian/wireplumber-upstream
yes | sudo apt update
yes | sudo apt install gstreamer1.0-pipewire libpipewire-0.3-{0,dev,modules} libspa-0.2-{bluetooth,dev,jack,modules} pipewire{,-{audio-client-libraries,pulse,bin,jack,alsa,v4l2,libcamera,locales,tests}} \
libpipewire-module-x11-bell \
wireplumber{,-doc} gir1.2-wp-0.4 libwireplumber-0.4-{0,dev} 
yes | sudo apt install --no-install-recommends pavucontrol pulseaudio-utils

./dotinstall.sh
./vscode.sh
./flatpak.sh
./advanced.sh

cd ..