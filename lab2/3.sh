#!/usr/bin/bash

ps -eo pid,lstart,cmd | sort -R | sort -k6,6 -k3M,3 -k4,4n -k5 | tail -n 3
