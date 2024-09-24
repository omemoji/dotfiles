#!/bin/sh

# /etc/X11/xinit/xinitrc
#
# global xinitrc file, used by all X sessions started by xinit (startx)

# invoke global X session script
if [ -f "/etc/X11/Xsession" ]; then
    . /etc/X11/Xsession
fi

xrdb -merge ~/.Xresources
setxkbmap -option ctrl:nocaps

# Xのスクリーンセーバーを無効化
xset s off
xset dpms 0 0 0

# 起動
if [ "$(uname -s)" = "Linux" ]; then
    if [ "$(cat /etc/os-release | grep "^ID" | sed -e "s/ID=//g")" = \""void"\" ]; then
        setxkbmap -model pc105 -layout jp -option ctrl:nocaps
        /usr/bin/pipewire &
        /usr/bin/pipewire-pulse &
        exec dbus-run-session i3
    fi
fi
