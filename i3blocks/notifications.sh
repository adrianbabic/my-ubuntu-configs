#!/bin/bash

# Check if dunst is paused
if pgrep -x "dunst" > /dev/null && dunstctl is-paused | grep -q "true"; then
    icon="🔕"
else
    icon="🔔"
fi

# Output for i3blocks
echo -e "$icon"
echo -e "$icon"
echo "$color"

