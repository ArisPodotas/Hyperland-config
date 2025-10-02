#!/bin/bash

#Pick the monitor you want to scale (e.g. eDP-1 or HDMI-A-1)
#In case the name isnt right
# MONITOR=$(hyprctl -j monitors | jq -r '.[] | select(.focused==true) | .name')
MONITOR="eDP-1"

# current scale, resolution, position
CURSCALE=$(hyprctl -j monitors | jq -r ".[] | select(.name==\"$MONITOR\") | .scale")
RES=$(hyprctl -j monitors | jq -r ".[] | select(.name==\"$MONITOR\") | .width")
HEIGHT=$(hyprctl -j monitors | jq -r ".[] | select(.name==\"$MONITOR\") | .height")
POSX=$(hyprctl -j monitors | jq -r ".[] | select(.name==\"$MONITOR\") | .x")
POSY=$(hyprctl -j monitors | jq -r ".[] | select(.name==\"$MONITOR\") | .y")

# add 0.1, force one decimal
NEW=$(echo "scale=2; $CURSCALE + 0.25" | bc)

# format to 1 decimal place (e.g., 1.10 → 1.1)
# NEW=$(printf "%.1f" "$NEW")

# apply with preserved resolution + position
hyprctl keyword monitor "$MONITOR,$RESx$HEIGHT@0,$POSXx$POSY,$NEW"

notify-send "Hyprland" "Monitor $MONITOR scale set to $NEW"
