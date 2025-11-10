#!/usr/bin/bash

a=""
b=""

while [[ $b != "q" ]]
do 
	read b
	a="$a$b"
done

echo $a
