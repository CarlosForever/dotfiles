#pidof xcompmgr >/dev/null && killall sh autostart.sh || ~/.config/dwm/autostart.sh &
xbindkeys &
xautolock -time 5 -locker slock &
xrandr --output VGA-0 --primary --mode 1920x1080 --pos 1920x0 --rotate normal --output DVI-D-0 --off --output HDMI-0 --mode 1920x1080 --pos 0x0 --rotate normal &
echo 3 > /tmp/libinput_discrete_deltay_multiplier
exec dwm

