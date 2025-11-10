#!/usr/bin/bash

a=-1
b=0
n=0

: > 5.log

while read -r line
do
	ppid=$(echo "$line" | cut -d " " -f 3 | cut -d "=" -f 2)
	if [[ $n == 0 ]]
	then
		a=$ppid
	fi

	if [[ $a != "$ppid" && $n != 0 ]]
	then
		echo "Average_Running_Children_of_ParentID=$a is $(echo "scale=3; $b / $n" | bc)" >> 5.log
		b=0
		a=$ppid
		n=0
	fi
	n=$((n + 1))
	c=$(echo "$line" | cut -d " " -f 5 | cut -d "=" -f 2)

	b=$(echo "scale=3; $b + $c" | bc)
    echo "$line" >> 5.log
done < <(cat ./4.log)

echo "Average_Running_Children_of_ParentID=$a is $(echo "scale=3; $b / $n" | bc)" >> 5.log
