#!/usr/bin/env bash

# starship
starship config palette rose-pine-dawn

# kitty
echo "include light-theme.auto.conf" > $HOME/.config/kitty/no-preference-theme.auto.conf
kill -s USR1 $(pidof kitty)
