#!/bin/bash
set -eu
if [ "$(uname -s)" = "Linux" ]; then
    if [ "$(cat /etc/os-release | grep "^ID" | sed -e "s/ID=//g")" = \""void"\" ]; then
    sudo ln -snfv /etc/sv/dbus /var/service 
    sudo ln -snfv /etc/sv/elogind /var/service  
    sudo ln -snfv /etc/sv/bluetoothd /var/service
    sudo sv up dbus
    sudo sv up elogind
    fi
fi