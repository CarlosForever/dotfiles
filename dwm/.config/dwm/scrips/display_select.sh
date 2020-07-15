#!/bin/bash
choices=("laptop\nlaptopdual\nVGA\nHDMI\nManual selection")
chosen=$(echo -e "$choices" | dmenu -i)
case "$chosen" in
    laptop)  xrandr --output LVDS-1 --primary --mode 1366x768 --pos 0x0 --rotate normal --output VGA-1 --off --output HDMI-1 --off --output DP-1 --off;;
    laptopdual) xrandr --output LVDS-1 --primary --mode 1366x768 --pos 0x0 --rotate normal --output VGA-1 --mode 1600x900 --pos 1366x0 --rotate normal --output HDMI-1 --off --output DP-1 --off;;
    VGA) xrandr --output LVDS-1 --off --output VGA-1 --mode 1600x900 --pos 0x0 --rotate normal --output HDMI-1 --off --output DP-1 --off ;;
    HDMI) "HDMI";;
    "Manual selection") arandr &;;
esac

