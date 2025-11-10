#!/usr/bin/bash

s=0
comm=0

while read -r line
do
        pid=${line%% *}
        c=${line#* }

        if [[ -f /proc/$pid/status ]]
        then
                a=$(cat "/proc/$pid/status" | grep "VmRSS" | awk '{ print $2 }')
		
		if [[ $a -gt $s ]]
		then
			s=$a
			comm=$c
		fi
        fi
done < <(ps xao pid,cmd)

echo "$comm", "$s"
