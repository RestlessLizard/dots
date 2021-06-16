#!/bin/sh

USAGE=$(ps axch -o cmd,%cpu | awk '{ x[$1]+=$2 } END {for (k in x) if(x[k] != "0") print k,x[k]"%"}' | column -t | sort -rnk2 | head)
notify-send "CPU" "$USAGE"

