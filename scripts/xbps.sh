#!/bin/bash
set -eu
echo "Install repositories"
sudo xbps-install -Sy void-repo-multilib void-repo-multilib-nonfree void-repo-nonfree
echo repository=https://raw.githubusercontent.com/Makrennel/hyprland-void/repository-x86_64-glibc | sudo tee /etc/xbps.d/hyprland-void.conf
echo "Update"
sudo xbps-install -Syu
echo "### Install Void Linux apps ###"
cat "$(pwd)/pkg/xbps.txt" | xargs sudo xbps-install -Sy
