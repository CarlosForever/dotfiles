#!/bin/sh
[[ -f /usr/bin/xcompmgr ]] && xcompmgr -c -C -t-5 -l-5 -r4.2 -o.55 &
[[ -f /usr/bin/xbindkeys ]] && xbindkeys &
[[ -f /usr/bin/unclutter ]] && unclutter --timeout 5 -b
[[ -f /usr/bin/nitrogen ]] && nitrogen --restore &
scrips/status_bar.sh &
xrdb ~/.Xresources
