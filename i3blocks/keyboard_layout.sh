#!/bin/bash

# Get the LED mask value
led_status=$(xset -q | grep LED | awk '{print $10}')

# Determine the layout based on the LED mask value
if [ "$led_status" == "00000000" ]; then
    layout="en"
elif [ "$led_status" == "00001000" ]; then
    layout="hr"
else
    layout="unknown"
fi
# Output for i3blocks
echo -e "$layout "
echo -e "$layout "
echo "#FFFFFF"

