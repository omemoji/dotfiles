#!/bin/sh
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ] && [ "$(uname -s)" = "Linux" ]; then
  if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    if [ "$(cat /etc/os-release | grep "^ID" | sed -e "s/ID=//g")" = \""void"\" ]; then
      exec dbus-run-session Hyprland
    fi
  fi
elif [ "$(uname -s)" = "Darwin" ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
