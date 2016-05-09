#!/bin/bash
#
# script for management youtube-dl
# give options for download video or audio only 
# from a URL 

SAVEPWD=$PWD

banner() {
	echo "Youtube-Manager - for youtube-dl"
	echo "usage: youtm <OPTION> <URL>"
	echo "\tOPTIONS:"
	echo "\t-y Download video and thumbnail from url.(default)"
	echo "\t-m Extract in mp3 audio and thumbnail from url."
	echo "\t-x Option for urls from xxx sites."
	echo "\t-a Download audio and video change between directories."
	echo "\t-h Help."
}

yt_video($yurl) {
	echo "Download video, wait..."
	cd $HOME/videos
	youtube-dl --write-thumbnail --no-playlist -o "%(title)-%(autonumber).%(ext)" $yurl
	cd $SAVEPWD
}

yt_xvideo($yurl) {
	echo "Download video, wait..."
	cd $HOME/xp
	youtube-dl --no-playlist -o "%(title)-%(autonumber).%(ext)" $yurl
	cd $SAVEPWD
}

yt_music($yurl) {
	echo "Only audio will be downloaded.. !!!"	
	cd $HOME/musics
	echo $2
	youtube-dl --extract-audio --audio-format=mp3 --embed-thumbnail -o "%(title)-%(autonumber).%(ext)" $yurl
	cd $SAVEPWD
}

#if [ $# -gt 2 ]; then

if [ "$#" -lt 2 ]; then
	banner()
else
	yurl=$2
	case $1 in
		-y) yt_video($yurl)
		;;
		-m) yt_music($yurl)
		;;
		-x) yt_xvideo($yurl)
		;;
		-a) yt_video($yurl)
			yt_music($yurl)
		;;
		*|-h) banner()
		;;
 	esac
fi
