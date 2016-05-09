#!/bin/zsh
# print in terminal ram used and free in MB

echo "RAM: used/free "`free -m | tr -s ' ' | sed '/^Mem/!d' | cut -d" " -f 3,4`
