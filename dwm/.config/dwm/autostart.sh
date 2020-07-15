#!/bin/bash
#run your start commands
xrdb ~/.Xresources -global
xcompmgr -c -C -t-5 -l-5 -r4.2 -o.55 &
~/.config/dwm/scrips/status_bar.sh &
nitrogen --restore &
unclutter --timeout 5 -b
echo 3 > /tmp/libinput_discrete_deltay_multiplier
xbindkeys &
