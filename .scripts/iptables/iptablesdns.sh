#!/bin/bash 
#
# coder: jotun
#
# script for test iptables rules
# 
# maybe you need exec this command "sysctl -w net.ipv4.conf.eth0.route_localnet=1" or maybe this "sysctl net.ipv4.ip_forward=1 " 

#ip_externo=$(ifconfig ppp0 | grep -i "inet end.:" | cut -d : -f 2 | grep -i [^Bcast] > /tmp/ifconfig.txt && cat /tmp/ifconfig.txt | cut -d " " -f 2)
IPT='/usr/sbin/iptables'
TORDNS='9153'
TORUSER='debian-tor'

modprobe iptable_nat
modprobe ip_conntrack
modprobe ipt_LOG

$IPT -F
$IPT -F INPUT
$IPT -F OUTPUT
$IPT -F FORWARD
$IPT -t nat -F
$IPT -t mangle -F
$IPT -t filter -F
$IPT -t mangle -F
$IPT -t nat -F OUTPUT
$IPT -X
$IPT -t nat -Z
$IPT -t mangle -Z
$IPT -t filter -Z

# define default policy
$IPT -P INPUT DROP
$IPT -P OUTPUT DROP
$IPT -P FORWARD DROP

# NAT
# redirect all dns request for tordns in localhost port 9153
$IPT -t nat -A OUTPUT -m owner --uid-owner "$TORUSER" -j RETURN
$IPT -t nat -A OUTPUT -p tcp -o lo --dport 3306 -j DNAT --to 127.0.0.1:3197
$IPT -t nat -A OUTPUT -p udp --dport 53 -j REDIRECT --to-ports "$TORDNS"
$IPT -t nat -A OUTPUT ! -s 10.42.0.1/32 ! -d 10.42.0.1/32 -p udp -m udp --dport 53 -j DNAT --to-destination 10.42.0.1:53
$IPT -t nat -A OUTPUT -p udp -m udp --dport 53 -m conntrack --cstate NEW -j DNAT --to-destination 127.0.0.1:"$TORDNS"

# FILTER
#
# INPUT
$IPT -A INPUT -p tcp ! --syn -m state --state NEW -j LOG --log-level 6 --log-prefix "FIREWALL: NEW sem syn: "
$IPT -A INPUT -p tcp ! --syn -m state --state NEW -j DROP

# drop pacotes mal formados
$IPT -A INPUT -i $IF_EXTERNA -m unclean -j LOG --log-level 6 --log-prefix "FIREWALL: pacote mal formado: "
$IPT -A INPUT -i $IF_EXTERNA -m unclean -j DROP

# Loga tentativa de acesso a determinadas portas
$IPT -A INPUT -p tcp --dport 21 -i $IF_EXTERNA -j LOG --log-level 6 --log-prefix "FIREWALL: ftp: "
$IPT -A INPUT -p tcp --dport 23 -i $IF_EXTERNA -j LOG --log-level 6 --log-prefix "FIREWALL: ssh: "
$IPT -A INPUT -p tcp --dport 23 -i $IF_EXTERNA -j LOG --log-level 6 --log-prefix "FIREWALL: telnet: "
$IPT -A INPUT -p tcp --dport 25 -i $IF_EXTERNA -j LOG --log-level 6 --log-prefix "FIREWALL: smtp: "

$IPT -A INPUT -m conntrack --cstate INVALID -j LOG --log-level info --log-prefix "PKT INVALIDO - "
$IPT -A INPUT -m conntrack --cstate INVALID -j DROP
$IPT -A INPUT -m conntrack --cstate ESTABLISHED,RELATED -j ACCEPT
$IPT -A INPUT -i lo -j ACCEPT

# Proteção contra port scanners ocultos
#-A FORWARD -p tcp --tcp-flags SYN,ACK,FIN,RST RST -m limit --limit 1/s -j LOG -j DROP
#-A INPUT -p tcp --tcp-flags SYN,ACK,FIN,RST RST -m limit --limit 5/m -j ACCEPT
#-A INPUT -p tcp --tcp-flags SYN,ACK,FIN,RST RST -m limit --limit 5/m -j LOG
$IPT -A INPUT -j DROP

#
# OUTPUT
$IPT -A OUTPUT -m owner --uid-owner "$TORUSER" -j RETURN
$IPT -A OUTPUT -p tcp -m tcp -m multiport --dports 80,443 -m state --state NEW -j ACCEPT
$IPT -A OUTPUT -p udp -m udp -m multiport --dports 80,443 -m state --state NEW -j ACCEPT
$IPT -A OUTPUT -p udp -m multiport --dports 80,443 -j ACCEPT
$IPT -A OUTPUT -o lo -d 127.0.0.1 -j ACCEPT
$IPT -A OUTPUT -j DROP