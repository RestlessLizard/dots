#!/bin/sh

notify-send "$(cat /sys/class/power_supply/BAT0/status)" "$(printf "%s\nLOCAL: %s\nEST: %s\nBattery level: %s%%\n" "$(date +%F)" "$(date +%R)" "$(TZ=Canada/Eastern date +%R)" "$(cat /sys/class/power_supply/BAT0/capacity)")"

