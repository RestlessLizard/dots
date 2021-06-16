#!/bin/sh

free --si | grep Mem | awk '{ printf("%.0f%\n", $3*100/$2) }'
