#!/bin/bash
set -eu
echo "Install repositories"
sudo xbps-install -Sy void-repo-multilib void-repo-multilib-nonfree void-repo-nonfree
echo "Update"
sudo xbps-install -Syu
echo "### Install Void Linux apps ###"
cat "$(pwd)/pkg/xbps.txt" | xargs sudo xbps-install -Sy
