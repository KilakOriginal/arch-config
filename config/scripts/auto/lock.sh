#/bin/sh

swayidle -w before-sleep 'swaylock -f'
timeout 295 'echo screen=$(brightnessctl get) > /tmp/brightness_levels && brightnessctl set 1%' \
	resume 'source /tmp/brightness_levels ; brightnessctl set $screen' \
timeout 300 'swaylock -f && hyprctl dispatch dpms off && echo keyboard=$(brightnessctl --device="platform::kbd_backlight" get) >> /tmp/brightness_levels && brightnessctl --device="platform::kbd_backlight" s 0' \
	resume 'source /tmp/brightness_levels ; hyprctl dispatch dpms on && brightnessctl set $screen && brightnessctl --device="platform::kbd_backlight" s $keyboard' \
timeout 600 'systemctl suspend' \
	resume 'source /tmp/brightness_levels ; hyprctl dispatch dpms on && brightnessctl set $screen && brightnessctl --device="platform::kbd_backlight" s $keyboard' 
