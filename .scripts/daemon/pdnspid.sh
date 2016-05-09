#!/bin/bash
#
# ver-set
# get pdnsd pid and make a env variable

# make function test if var $PDNSD_PID not exist in env

PID_=`env | grep PDNSD_PID | cut -d= -f2`

if [ -z "$PID_" ]; then
	PDNSD_PID=`pgrep -l pdnsd |awk '{print $1}'`
	PDNSD_PIDS=''
	# faze o disable fica piscando
	PDNSD_STATUS="\e[1;91mdisable\e[0m"
	export PDNSD_STATUS
	export PDNSD_PIDS
	export PDNSD_PID
else
    PDNSD_STATUS='Actived'
    PDNSD_PIDS="pid $PDNSD_PID"
fi
