#!/usr/bin/bash

a=0

while read -r line 
do
	a=$(( a + $(cat "$line" | wc -l) ))
done < <(find /var/log/ -type f -name '*.log')

echo $a
