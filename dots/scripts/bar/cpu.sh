#!/bin/bash

LOAD=$(cat /proc/loadavg | sed 's/ .*//')
#TEMP=$(sensors | grep "Package" | awk '{ print $4 }')
TEMP="$(expr $(cat /sys/class/thermal/thermal_zone0/temp) / 1000)°C"
echo "$LOAD $TEMP"

