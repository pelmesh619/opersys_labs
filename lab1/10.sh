#!/usr/bin/bash

declare -A dict

while read word;
do
	if [[ -n ${dict[$word]} ]]
	then dict[$word]=$(( ${dict[$word]}+1 ))
	else dict[$word]="1"
	fi
done < <(man -E 'UTF-8' bash | grep -oiE "[a-z]{4,}") 

for word in "${!dict[@]}"
do
	echo "$word ${dict[$word]}"
done | sort -rn -k2 | head -n 3
