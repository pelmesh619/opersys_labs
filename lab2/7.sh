#!/usr/bin/bash

declare -A start

while read -r pid
do
	if [[ -f /proc/$pid/io ]]
	then
		start[$pid]=$(grep "read_bytes" "/proc/$pid/io" | awk '{ print $2 }')
	fi
done < <(ps ao pid)

echo Waiting...

sleep 60s

for pid in "${!start[@]}"
do
	if [[ -f /proc/$pid/io ]]
	then
		b=$(grep "read_bytes" "/proc/$pid/io" | awk '{ print $2 }')
		c=$((b - ${start[$pid]}))

		echo "$pid:$(cat "/proc/$pid/comm"):$c" 
	fi
done | sort -t':' -k3 -n -r | head -n 3
