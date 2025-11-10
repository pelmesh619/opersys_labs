#!/usr/bin/bash

if [[ "$PWD" == "$HOME" ]]
then echo "Welcome home"
	exit 0
else echo "ERROR: THIS IS NOT MY HOME!"
	exit 1
fi
