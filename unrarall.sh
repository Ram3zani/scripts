#!/bin/bash
IFS=$'\n'
in="$1"
out="$2"
read -p "Enter Password:" pass
echo $pass
for i in $(ls $in)
do
	unrar x -p$pass "$in/$i" "$out"  
done
