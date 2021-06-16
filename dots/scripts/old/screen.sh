#!/bin/bash


read -r -p "Brightness[1000-7500]: "

sudo sh -c "echo ${REPLY} > /sys/class/backlight/intel_backlight/brightness"
