#!/usr/bin/env zsh
BIN_DIR="$(dirname "$(realpath "$0")")"

if [[ $# != 1 ]]; then
  echo "Usage $0 <Light|Dark>"
  exit 1
fi

case $1 in
  "Dark")
    . "$BIN_DIR/dark_theme.sh"
    ;;
  "Light")
    . "$BIN_DIR/light_theme.sh"
    ;;
  *)
    echo "Use Dark or Light..."
    exit 1
    ;;
esac

exit 0
