#!/bin/bash

# Get the wireless interface name
interface=$(iw dev | awk '$1=="Interface"{print $2}')

# Get the SSID (network name)
ssid=$(iw dev "$interface" link | awk -F': ' '/SSID/ {print $2}')

# Get the signal strength in dBm
signal=$(iw dev "$interface" link | awk -F': ' '/signal/ {print $2}' | awk '{print int($1)}')

icon="\uf1eb"

# Determine color based on signal strength
if [[ -z "$ssid" ]]; then
    icon="❌"         # No connection
    color="#FF0000"  # Red for disconnected
    output="Disconnected"
elif [[ $signal -ge -50 ]]; then # Strong signal
    color="#FFFFFF"  # White
    output="$ssid"
elif [[ $signal -ge -70 ]]; then # Medium signal
    color="#FFFF00"  # Yellow
    output="$ssid"
elif [[ $signal -ge -90 ]]; then # Weak signal
    color="#FFA500"  # Orange
    output="$ssid"
else # Very weak signal
    color="#FF0000"  # Red
    output="$ssid"
fi

# Output for i3blocks
echo -e "$icon $output"
echo -e "$icon $output"
echo "$color"

