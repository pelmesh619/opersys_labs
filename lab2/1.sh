#!/usr/bin/bash

this_user=$(whoami)

ps u -e | awk -v thisuser="$this_user" '{ if (thisuser == $1) print $2 ":" $11 }'
