#!/usr/bin/bash

awk '{ if ($3 == "(II)" || $3 == "(WW)") print $0 }' ./X.log | sed 's/(II)/Information:/' | sed 's/(WW)/Warning:/' | sort -k3 -r > full.log 
