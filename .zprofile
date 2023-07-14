if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ] && [ $(uname -s) = "Linux" ]; then
  startx
fi
