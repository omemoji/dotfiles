#!/bin/bash
cd debian

./install.sh


yes | sudo apt install inkscape neovim

##Java
yes | sudo apt install openjdk-17-jdk

## Sound
yes | sudo apt install pipewire wireplumber
yes | sudo apt install gstreamer1.0-pipewire libpipewire-0.3-{0,dev,modules} libspa-0.2-{bluetooth,dev,jack,modules} pipewire{,-{audio-client-libraries,pulse,bin,jack,alsa,v4l2,libcamera,tests}} \
libpipewire-module-x11 \
wireplumber{,-doc} gir1.2-wp-0.4 libwireplumber-0.4-{0,dev} 
yes | sudo apt install --no-install-recommends pavucontrol pulseaudio-utils

./dotinstall.sh
./vscode.sh
./flatpak.sh
./advanced.sh

cd ..