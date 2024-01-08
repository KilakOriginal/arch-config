#/bin/sh

windows_in(){
hyprctl clients -j | jq ".[] | select(.workspace.name == \"special:$1\" )"
}

toggle_scratchpad(){
    workspace_name="$1"
    cmd="$2"

    windows=$( windows_in "$workspace_name" )
    # If not on latest , check the edit history of this post
    if [ -z "$windows" ];then
        hyprctl dispatch "exec [workspace special:$workspace_name] $cmd"
        else
        hyprctl dispatch togglespecialworkspace "$workspace_name"
    fi
}

if [ "$1" = "terminal" ];then
    toggle_scratchpad "terminal" "kitty --class float1"
elif [ "$1" = "mega" ];then
    toggle_scratchpad "mega" "megasync --class float1"
fi
