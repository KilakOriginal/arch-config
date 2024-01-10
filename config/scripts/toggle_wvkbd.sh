#/bin/sh

state='on'

if [ $state = 'on' ]; then
    sed -i 's/"modules-left": \["hyprland\/workspaces", "custom\/wvkbd"\]/"modules-left": \["hyprland\/workspaces"\]/g' ~/.config/waybar/config \
    && sed -i "s/^state='on'$/state='off'/g" ~/.config/scripts/toggle_wvkbd.sh
else
    sed -i 's/"modules-left": \["hyprland\/workspaces"\]/"modules-left": \["hyprland\/workspaces", "custom\/wvkbd"\]/g' ~/.config/waybar/config \
    && sed -i "s/^state='off'$/state='on'/g" ~/.config/scripts/toggle_wvkbd.sh
fi

hyprctl dispatch 'exec killall waybar && waybar & disown'
