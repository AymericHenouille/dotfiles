#!/usr/bin/env bash

# starship
starship config palette rose-pine

# kitty
if [[ "$OSTYPE" != "darwin"* ]]; then
  echo "include dark-theme.auto.conf" > $HOME/.config/kitty/no-preference-theme.auto.conf
  kill -s USR1 $(pidof kitty)
fi
