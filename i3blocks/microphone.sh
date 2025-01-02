#!/bin/bash

# Check if the microphone is muted
if pactl get-source-mute @DEFAULT_SOURCE@ | grep -q "yes"; then
    icon="\uf131"
    color="#FF0000"  # Red for microphone off
else
    icon="\uf130"
    color="#FFFFFF"  # White for microphone on
fi

# Output for i3blocks
echo -e "$icon"
echo -e "$icon"
echo "$color"

