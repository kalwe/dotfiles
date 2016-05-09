#!/bin/bash
#
# script use dd command for write in blocks of harddriver
# a sequence of zeros and after cover with random data
# and do this for 27 times, so by NSA...but is ultra slow

for (( i=0 ; i<=27 ; i++ )); do
	dd if=/dev/zero of=/dev/sdX$1 bs=1024
	dd if=/dev/urandom of=/dev/sdX$1 bs=1024
done
