#!/bin/bash
set -eu
echo "### Install Void Linux apps ###"
sudo xbps-install -Su
cat "$(pwd)/pkg/xbps.txt" | xargs sudo xbps-install -Sy 