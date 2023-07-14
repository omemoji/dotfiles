#!/bin/bash
set -u
if [ "$(uname -s)" = "Darwin" ]; then
    OS='macOS'
elif [ "$(uname -s)" = "Linux" ]; then
    OS='Linux'
else
    echo "Your platform ($(uname -a)) is not supported."
    exit 1
fi

if [ OS="Linux" ]; then

    if [ $(cat /etc/os-release | grep ^ID | sed -e "s/ID=//g")="debian" ]; then
        echo "### Install Debian apps ###"
        yes | sudo apt-get update
        yes | sudo apt-get upgrade
        cat "$(pwd)/pkg/apt/apt.txt" | xargs sudo apt-get -y install
    fi

elif [ OS="macOS" ]; then
    echo "### Install macOS apps ###"
fi
