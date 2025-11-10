#!/usr/bin/bash

echo -e "1 - nano\n2 - vi\n3 - links\n4 - exit"

read a
case $a in 
1) 
	nano 
	;;
2) 
	vi 
	;;
3) 
	links 
	;;
4) 
	;;
*) 
	echo "Wrong command" ;;

esac
