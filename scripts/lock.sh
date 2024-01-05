#/bin/sh

screen="50%"
keyboard=1

swayidle -w timeout 295 "screen=$(brightnessctl get) && brightnessctl set 1%" \
	resume "brightnessctl set $screen" \
timeout 300 "swaylock -f && hyprctl dispatch dpms off && keyboard=$(brightnessctl --device='platform::kbd_backlight' get) && brightnessctl --device='platform::kbd_backlight' s 0" \
	resume "hyprctl dispatch dpms on && brightnessctl set $screen && brightnessctl --device='platform::kbd_backlight' s $keyboard" \
timeout 600 'systemctl suspend'
