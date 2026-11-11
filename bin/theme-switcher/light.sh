#!/usr/bin/env bash

set -Eeuo pipefail

# starship
/opt/homebrew/bin/starship config palette rose-pine-dawn

# kitty
if [[ "$OSTYPE" != "darwin"* ]]; then
  echo "include light-theme.auto.conf" > $HOME/.config/kitty/no-preference-theme.auto.conf
  kill -s USR1 $(pidof kitty)
fi
