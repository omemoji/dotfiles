#!/bin/bash

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak update
#Social
flatpak install flathub com.slack.Slack
flatpak install flathub com.discordapp.Discord
flatpak install flathub us.zoom.Zoom
#Creativity
flatpak install flathub org.blender.Blender
flatpak install flathub org.ardour.Ardour
flatpak install flathub org.kde.krita
#Game
# flatpak install flathub com.valvesoftware.Steam
flatpak install flathub com.obsproject.Studio
