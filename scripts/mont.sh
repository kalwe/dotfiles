#!/bin/bash
#

if [ "$1" -eq '-l' ]; then
	ls /dev | grep sd
elif [ "$#" -eq 2 ]; then 
	mount /dev/$1 /mnt/$2 -o rw,nodev,nosuid,uid=1000
fi
