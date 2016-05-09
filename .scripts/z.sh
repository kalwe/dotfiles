#!/bin/bash
#

case $1 in
	-v) vim $HOME/.zsh/$2.zsh
	;;
	-c) cat $HOME/.zsh/$2.zsh
	;;
	*) echo "Use z <PARAM> <NAME-NO-DOT-EXT>\nOptions\n\t-v vim\n\t-c cat"
	;;
esac
