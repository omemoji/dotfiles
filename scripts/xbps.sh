#!/bin/bash
set -eu
MACHINE="$(./scripts/machine.sh)"
echo "Install repositories"
sudo xbps-install -Sy void-repo-nonfree
echo "Update"
yes | sudo xbps-install -Syu
echo "### Install Void Linux apps (common) ###"
xargs sudo xbps-install -Sy <"$(pwd)/pkg/xbps/common.txt"
if [ -f "$(pwd)/pkg/xbps/${MACHINE}.txt" ]; then
    echo "### Install Void Linux apps (${MACHINE}) ###"
    xargs sudo xbps-install -Sy <"$(pwd)/pkg/xbps/${MACHINE}.txt"
fi
