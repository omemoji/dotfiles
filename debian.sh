#!/bin/bash
cd debian

./install.sh
./dotinstall.sh
./vscode.sh

##Inkscape
yes | sudo apt install inkscape

##Java
yes | sudo apt install openjdk-17-jdk

##Sound
yes | sudo apt install pipewire wireplumber
yes | sudo apt install gstreamer1.0-pipewire libpipewire-0.3-{0,dev,modules,modules-x11} libspa-0.2-{bluetooth,dev,jack,modules,libcamera} pipewire{,-{audio-client-libraries,pulse,bin,jack,alsa,v4l2,libcamera,tests}} \
wireplumber{,-doc} gir1.2-wp-0.4 libwireplumber-0.4-{0,dev} 
yes | sudo apt install --no-install-recommends pavucontrol pulseaudio-utils

# ./flatpak.sh
# ./advanced.sh

cd ..

sudo cp omemoji.png /usr/share/pixmaps/omemoji.png