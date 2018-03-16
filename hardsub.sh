#!/bin/bash
video="$1"
subtitle="$2"
logo="$3"
videoname=$(echo "$1" | rev | cut -f2 -d '.' | rev)
subtitlename=$(echo "$2" | rev | cut -f2 -d '.' | rev | sed -e 's/ /_/g')
ffmpeg -i "$2" ".sample999.ass"
sed -i "9 d" ".sample999.ass"
sed -i "9i Style: Default,ubvazir,20,&H0000FFFF,&H000000FF,&H71000000,&HFF000000,0,0,0,0,100,100,0,0,1,0,0,2,10,10,20,178" ".sample999.ass"
ffpb -i "$1" -i "$3" -filter_complex "[0]subtitles=.sample999.ass:force_style='OutlineColour=&H80000000,BorderStyle=3,Outline=0.1, Shadow=0,MarginV=20'[0v];[0v][1:v]overlay=W-w-10:10" -c:v libx264 -c:a libmp3lame -ar 48000 "$videoname-Hs".mkv
rm .sample999.ass
mkvmerge -o "$videoname-Intro".mkv intro.mkv + "$videoname-Hs".mkv
rm "$videoname-Hs".mkv
clear


