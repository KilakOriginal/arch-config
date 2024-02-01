#!/bin/zsh

if [ $1 = "lower" ]; then
    pactl set-sink-volume @DEFAULT_SINK@ -5%
elif [ $(pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '\d+(?=%)' | head -n 1) -lt 100 ]; then 
        pactl set-sink-volume @DEFAULT_SINK@ +5%
fi
