#!/bin/bash
# Set the parameters passed to this script to meaningful variable names.
connection_type="$1"
essid="$2"
bssid="$3"
#poisoned_mac=`arp -a | cut -d\  -f 4`

if [ -d "arp-log" ]; then 
	mkdir arp-log
	# generate log 
	echo "MAC Poisoned($`date %F%T`): $`arp -a | cut -d\  -f 4` " >> mac.log
fi

if [ "${connection_type}" == "wireless" ]; then

        #Change below to match your networks.
        case "$essid" in
        KALWE)
                arp -s 192.168.0.1 90:B1:34:41:DF:94
         ;;
         ANOTHER-ESSID)
                arp -s 192.168.0.1 11:33:55:77:99:00
         ;;
         *)
                echo "Static ARP not set. No network defined."
         		arp -a
		 ;;
       esac
fi
