#!/bin/bash
#
# ver-set
# get pdnsd pid and make a env variable

# make function test if var $TOR_PID not exist in env

TOR_=`env | grep PDNSD_PID | cut -d= -f2`

if [ -z "$TOR_" ]; then
	TOR_PID=`pgrep -l tor |awk '{print $1}'`
	TOR_PIDS=''
	# faze o disable fica piscando
	TOR_STATUS="\e[1;91mdisable\e[0m"
	export TOR_STATUS
	export TOR_PIDS
	export TOR_PID
else
    TOR_STATUS='Actived'
    TOR_PIDS="pid $TOR_PID"
fi
