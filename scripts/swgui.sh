#!/bin/bash
#
# This script is made for aux the user switch the GUI
# kill actual GUI 

# Get PID and NAME of actual GUI
PID_GUI=`pgrep -u $USER -l i3$\|gnome-session | awk '{print $1}'`
ACTUAL_GUI=`pgrep -u $USER -l i3$\|gnome-session | awk '{print $2}'`

if [ -n "$PID_GUI" ]; then
	echo -e "\nCurrent GUI: \e[4m\e[31m$ACTUAL_GUI\e[0m"
	echo -e "Process PID: \e[4m\e[31m$PID_GUI\e[0m"
	echo -e "Stoping \e[4m$ACTUAL_GUI\e[0m with \e[4mPID $PID_GUI\e[0m ..."
	sleep 1
	kill -9 $PID_GUI
fi

