if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ] && [ "$(uname -s)" = "Linux" ]; then
  startx
  if [ "$(cat /etc/os-release | grep "^ID" | sed -e "s/ID=//g")" = \""void"\" ]; then
    setxkbmap -option ctrl:nocaps
  fi
elif [ "$(uname -s)" = "Darwin" ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
