#!/bin/bash

#Flatpak
yes | sudo apt install flatpak
#add repositories 
yes | flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
yes | flatpak update
#Social
yes | flatpak install flathub com.slack.Slack
yes | flatpak install flathub com.discordapp.Discord
yes | flatpak install flathub us.zoom.Zoom
#Creativity
yes | flatpak install flathub org.blender.Blender
yes | flatpak install flathub org.ardour.Ardour
yes | flatpak install flathub org.kde.krita
#Game
yes | flatpak install flathub com.valvesoftware.Steam
yes | flatpak install flathub com.obsproject.Studio
