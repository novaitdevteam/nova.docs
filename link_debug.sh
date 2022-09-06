#! usr/bin/bash

dirpath=$1
linkfile=$2
diffile=$3
index=$4

if [ -z "$dirpath" ] || [ -z "$linkfile" ] || [ -z "$diffile" ] || [ -z "$index" ]; then
	echo "one or more variables are empty, fill all of them please"
	echo '$1 - is for the path of directory to check in'
	echo '$2 - is for the name of your file with task links'
	echo '$3 - is for the name of file where the missing tasks I would store'
	echo '$4 - is for what project index do I check?'
	echo "I'll give you an example: link_debug.sh ./docs/components/ links.md diff.txt NOV"
	exit
else
	echo "All variables are set. I'm starting!"
	targets=$(ls -p "$dirpath" | grep -v /)
	for i in $targets; do
		cat "${dirpath}${i}" | egrep "$index\-[0-9]{1,}" >> "./$diffile"
	done
	sed -i -r "s;^.*($index\-[0-9]{1,}).*$;\1;g" "./$diffile"
	count=1
	while read -r line; do 
		search=$(cat "${dirpath}${linkfile}" | egrep "^\[$line\].*$line$")
		if [[ -z $search ]]; then
			echo "Entity $line doesn't exist in links file"
			count=$((count+=1))
		else
			sed -i "${count}d" "$diffile"
		fi
	done < $diffile
fi