#!/bin/sh

# /etc/X11/xinit/xinitrc
#
# global xinitrc file, used by all X sessions started by xinit (startx)

# invoke global X session script
# xrdb -merge ~/.Xresources
# setxkbmap -option ctrl:nocaps

# Xのスクリーンセーバーを無効化
xset s off
xset dpms 0 0 0
# export GTK_IM_MODULE=fcitx
# export QT_IM_MODULE=fcitx
# export XMODIFIERS=@im=fcitx

# 起動
if [ "$(uname -s)" = "Linux" ]; then
    if [ "$(cat /etc/os-release | grep "^ID" | sed -e "s/ID=//g")" = \""void"\" ]; then
        /usr/bin/pipewire &
        /usr/bin/pipewire-pulse &
        exec dbus-run-session i3
    fi
fi
