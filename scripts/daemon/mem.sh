#!/bin/zsh
# print in terminal ram used and free in MB

# clear cache
#sysctl -w vm.drop_caches=3

echo "RAM: used/free "`free -m | tr -s ' ' | sed '/^Mem/!d' | cut -d" " -f 3,4`
