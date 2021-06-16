#!/bin/bash

USAGE=$(ps axch -o cmd,%mem | awk '{ x[$1]+=$2 } END {for (k in x) if(x[k] != "0") print k,x[k]"%"}' | column -t | sort -rnk2 | head)
notify-send "RAM" "$USAGE"

