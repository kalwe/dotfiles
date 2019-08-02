#!/bin/sh

# .xsession execute by Xorg when logged in graphical mode

[[ -s "$HOME/.Xresources" ]] && xrdb -merge $HOME/.Xresources
[[ -s "$HOME/.fehbg" ]] && sh $HOME/.fehbg &

xrandr --output HDMI-1 --left-of LVDS-1 # --mode 1366x768

