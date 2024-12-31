#!/bin/bash

# Get the default sink volume using `pactl`
volume=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}' | tr -d '%')

# Check if the sink is muted
is_muted=$(pactl get-sink-mute @DEFAULT_SINK@ | grep yes)

# Determine icon and color based on volume and mute status
if [[ -n "$is_muted" ]]; then
    icon="🔇"  # Muted icon
    color="#FF0000" # Red for muted
elif (( volume > 70 )); then
    icon="🔊"  # High volume icon
    color="#FFFFFF" # White
elif (( volume > 30 )); then
    icon="🔉"  # Medium volume icon
    color="#FFFFFF" # White
else
    icon="🔈"  # Low volume icon
    color="#FFFFFF" # White
fi

# Output for i3blocks
echo -e "$icon ${volume}%"
echo -e "$icon ${volume}%"
echo "$color"

