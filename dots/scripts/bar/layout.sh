#!/bin/bash

HEX_L=$(xset -q | grep -i "LED" | grep -Eo "[0-9]{8}")
L=${HEX_L:4:1}
LAYOUTS=($(setxkbmap -query | grep layout | grep -Eo "[^ ]+,.+" | sed 's/,/ /g'))
echo "${LAYOUTS[$L]^^}"
