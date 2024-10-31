#!/bin/bash
set -eu
if [ "$(uname -s)" = "Linux" ]; then
    if [ "$(cat /etc/os-release | grep "^ID" | sed -e "s/ID=//g")" = \""void"\" ]; then
        echo "Services and Daemons - runit"

        echo "/etc/runit/runsvdir/default/"
        sudo mkdir -p /etc/runit/runsvdir/default
        sudo ln -snfv /etc/sv/NetworkManager /etc/runit/runsvdir/default/
        sudo ln -snfv /etc/sv/bluetoothd /etc/runit/runsvdir/default/
        sudo ln -snfv /etc/sv/dbus /etc/runit/runsvdir/default/
        sudo ln -snfv /etc/sv/elogind /etc/runit/runsvdir/default/
        sudo ln -snfv /etc/sv/ntpd /etc/runit/runsvdir/default/
        sudo ln -snfv /etc/sv/polkitd /etc/runit/runsvdir/default/

        echo "/ver/service/"
        sudo mkdir -p /var/service
        sudo ln -snfv /etc/sv/NetworkManager /var/service/
        sudo ln -snfv /etc/sv/bluetoothd /var/service/
        sudo ln -snfv /etc/sv/dbus /var/service/
        sudo ln -snfv /etc/sv/elogind /var/service/
        sudo ln -snfv /etc/sv/ntpd /var/service/
        sudo ln -snfv /etc/sv/polkitd /var/service/

        echo "Enable services"
        sudo sv up NetworkManager
        sudo sv up bluetoothd
        sudo sv up dbus
        sudo sv up elogind
        sudo sv up ntpd
        sudo sv up polkitd

        echo "void-packages"
        git clone https://github.com/void-linux/void-packages.git ~/void-packages
    fi
else
    echo "Your platform is not supported."
    exit 1
fi
