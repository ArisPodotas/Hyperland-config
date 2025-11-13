#!/bin/bash

dx=$1
dy=$2

# Get current position
eval "$(hyprctl cursorpos | awk -F'[(), ]+' '{print "x="$1" y="$2}')"

# Move relative
newx=$((x + dx))
newy=$((y + dy))

# Move cursor to new position
hyprctl dispatch movecursor "$newx" "$newy"
