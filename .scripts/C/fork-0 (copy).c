#!/bin/bash

for i in `ls`;do
	j=0
	echo $i
	mv $i fork-$j.c
	j++
done
