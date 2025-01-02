#!/bin/bash

# Get the current brightness level using `brightnessctl`
brightness=$(brightnessctl g)
max_brightness=$(brightnessctl m)
percentage=$((100 * brightness / max_brightness))

if (( percentage < 5 )); then
    percentage=5
    new_brightness=$((max_brightness * percentage / 100))
    brightnessctl set ${new_brightness} > /dev/null 2>&1
fi

icon="☀️"  

# Output for i3blocks
echo -e "$icon ${percentage}%"
echo -e "$icon ${percentage}%"
echo "#FFFFFF"  

