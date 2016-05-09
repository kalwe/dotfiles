#!/bin/sh
# ~/.xinitrc
#
# executed by startx, run window manager from here

# load Xresources user config  
xrdb -merge $HOME/.Xresources

# xrandr set monitor output
xrandr --output HDMI-0 --mode 1366x768
xrandr --output DVI-0 --auto --right-of HDMI-0

idth 9 --transparent true --tint 0x000000 --height 12 &

# start GUI
case $1 in
	i3) exec i3
	;;
	gnome) exec gnome-session
	;;
	*) echo "ERROR: choice between i3 or gnome-session"
	;;	
esac
