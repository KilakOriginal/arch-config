#!/bin/zsh

HOUR=$(date +%H)

if [ $HOUR -ge 22 ] || [ $HOUR -lt 6 ]; then
    hyprsunset -t 3500
else
    hyprsunset -i
fi
