#/bin/sh

state='mirror'

if [ $state = 'mirror' ]; then
    sed -i 's/^monitor=HDMI-A-1,highres,auto,1.333333,mirror,eDP-1$/# monitor=HDMI-A-1,highres,auto,1.333333,mirror,eDP-1/g' ~/.config/hypr/hyprland.conf \
    && sed -i "s/^state='mirror'$/state='extend'/g" ~/.config/scripts/toggle_hdmi_mode.sh
else
    sed -i 's/^# monitor=HDMI-A-1,highres,auto,1.333333,mirror,eDP-1$/monitor=HDMI-A-1,highres,auto,1.333333,mirror,eDP-1/g' ~/.config/hypr/hyprland.conf \
    && sed -i "s/^state='extend'$/state='mirror'/g" ~/.config/scripts/toggle_hdmi_mode.sh
fi

hyprctl dispatch 'exec killall waybar && waybar & disown'
