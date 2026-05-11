if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ] && [ "$(uname -s)" = "Linux" ]; then
  export XDG_SESSION_TYPE=wayland
  export XDG_CURRENT_DESKTOP=niri
  export XDG_CURRENT_SESSION=niri
  export DESKTOP_SESSION=niri
  export QT_QPA_PLATFORM="wayland;xcb"
  # GDK_DPI_SCALE=1
  # QT_SCALE_FACTOR=1
  export MOZ_ENABLE_WAYLAND=1
  export WINIT_UNIX_BACKEND=x11
  export XDG_SCREENSHOTS_DIR=$HOME/Pictures/screenshots
  # export QT_IM_MODULE=fcitx
  # export GTK_IM_MODULE=fcitx
  export XMODIFIERS=@im=fcitx
  export DefaultIMModule=fcitx
  export INPUT_METHOD=fcitx
  export XCURSOR_PATH=${XCURSOR_PATH}:~/.icons
fi