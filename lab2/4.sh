#!/usr/bin/bash

: > 4.log

while read -r line
do
	pid=${line%% *}
	ppid=${line##* }
	if [[ -f /proc/$pid/sched ]]
	then
		runtime=$(cat "/proc/$pid/sched" | grep "sum_exec_runtime" | awk '{ print $3 }')
		switches=$(cat "/proc/$pid/sched" | grep "nr_switches" | awk '{ print $3 }')
		echo "ProcessId=$pid : Parent_ProcessID=$ppid : Average_Running_Time=$(echo "scale=3; $runtime / $switches" | bc)" >> 4.log
	fi
done < <(ps axo pid,ppid | sort -k2 -n)
