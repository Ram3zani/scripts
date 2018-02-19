#!/bin/bash
vidoe="$1"
subtitle="$2"
logo="$3"
vname=$(echo "$1" | rev | cut -f2 -d '.' | rev | sed -e 's/ /_/g')
extname=$(echo "$1" | rev | cut -f1 -d '.' | rev)
sname=$(echo "$2" | rev | cut -f2 -d '.' | rev | sed -e 's/ /_/g')
ffmpeg -i "$2" "$sname.ass"
sed -i "9 d" "$sname.ass"
sed -i "9i Style: Default,ubvazir,20,&H0000FFFF,&H000000FF,&H71000000,&HFF000000,0,0,0,0,100,100,0,0,1,0,0,2,10,10,4,178" "$sname.ass"
mv "$1" "$vname"."$extname"
ffpb -i "$vname.$extname" -i "$3" -filter_complex "[0]subtitles=$sname.ass:force_style='OutlineColour=&H80000000,BorderStyle=3,Outline=0.1,Shadow=0,MarginV=10'[0v];[0v][1:v]overlay=W-w-10:10" -c:v libx264 -c:a copy $vname-razito.mkv
rm $sname.ass
clear
