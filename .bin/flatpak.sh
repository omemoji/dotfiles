#!/bin/bash
set -eu
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak update -y
#Social
flatpak install flathub com.slack.Slack -y
flatpak install flathub com.discordapp.Discord -y
flatpak install flathub us.zoom.Zoom -y
#Creativity
flatpak install flathub org.blender.Blender -y
flatpak install flathub org.ardour.Ardour -y
flatpak install flathub org.kde.krita -y
#Game
# flatpak install flathub com.valvesoftware.Steam
flatpak install flathub com.obsproject.Studio -y
