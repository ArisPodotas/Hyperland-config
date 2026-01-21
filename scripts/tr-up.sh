#!/bin/bash

current=$(hyprctl getoption decoration:active_opacity -j | jq -r '.float')
new=$(echo "$current + 0.05" | bc)
if (( $(echo "$new > 1.0" | bc -l) )); then
    new=1.0
fi

hyprctl keyword decoration:active_opacity "$new"

notify-send "Hyprland" "Opacity set to $new"

current=$(hyprctl getoption decoration:inactive_opacity -j | jq -r '.float')
new=$(echo "$current + 0.05" | bc)
if (( $(echo "$new > 1.0" | bc -l) )); then
    new=1.0
fi

hyprctl keyword decoration:inactive_opacity "$new"

current=$(hyprctl getoption decoration:fullscreen_opacity -j | jq -r '.float')
new=$(echo "$current + 0.05" | bc)
if (( $(echo "$new > 1.0" | bc -l) )); then
    new=1.0
fi

hyprctl keyword decoration:fullscreen_opacity "$new"
