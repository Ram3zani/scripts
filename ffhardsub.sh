#!/bin/bash
vidoe="$1"
subtitle="$2"
logo="$3"
name=$(echo "$1" | rev | cut -f2 -d '.' | rev)
ffpb -i "$1" -i "$3" -filter_complex "[0:v][1:v]overlay=W-w-5:5,ass="$2"[out]"  -map "[out]" -map 0:a $name-watermark.mkv
