#!/usr/bin/bash

grep -roE "[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}" /etc/ | cut -d':' -f2 | paste -s | sed "s/\t/, /g" > ./emails.lst
