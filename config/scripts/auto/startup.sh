#/bin/sh

toggle_scratchpad(){
    hyprctl dispatch "exec [workspace special:$1] $2"
}

# mega-sync
#toggle_scratchpad "mega" "megasync --class float1" && hyprctl dispatch togglespecialworkspace "mega"
