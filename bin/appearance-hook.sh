#!/usr/bin/env zsh
BIN_DIR="$(dirname "$(realpath "$0")")"
MODE=$1 

case $MODE in
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
