if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ] && [ "$(uname -s)" = "Linux" ]; then
  startx
elif [ "$(uname -s)" = "Linux" ]; then
  if [ "$(cat /etc/os-release | grep "^ID" | sed -e "s/ID=//g")" = \""void"\" ]; then
    startx
    setxkbmap -option ctrl:nocaps
  fi
elif [ "$(uname -s)" = "Darwin" ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
