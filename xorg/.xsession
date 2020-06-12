#!/bin/bash

# source for the terminal
xrdb -merge $HOME/.xres &

# font
xset fp+ $HOME/.fonts &
xset fp rehash &

# set keyboard layout to us
setxkbmap us &

# Start your wm!
exec dwm
