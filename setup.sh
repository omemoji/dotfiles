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

./install.sh
./link.sh
