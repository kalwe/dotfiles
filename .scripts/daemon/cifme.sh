#!/bin/bash
#

if [ -n "$MY_IP" ];then
	IP_EXT=`curl ifconfig.me`
	export IP_EXT
fi
