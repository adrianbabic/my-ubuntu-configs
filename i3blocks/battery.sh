#!/bin/bash

battery_status=$(cat /sys/class/power_supply/BAT*/status)
battery_percentage=$(cat /sys/class/power_supply/BAT*/capacity)

if [[ "$battery_status" == "Charging" ]]; then
    emoji="⚡"
    color="#00FF00" # Green
else
    if ((battery_percentage > 55)); then
        emoji="\uf240"
        color="#00FF00" # Green
    elif ((battery_percentage > 40)); then
        emoji="\uf241"
        color="#FFFF00" # Yellow
    elif ((battery_percentage > 20)); then
        emoji="\uf242"
        color="#FFA500" # Orange
    else
        emoji="\uf243"
        color="#FF0000" # Red
        if ((battery_percentage <= 10)); then
            notify-send -u critical "Battery Critical!" "Battery is at $battery_percentage%!"
        elif ((battery_percentage <= 20)); then
            notify-send -u normal "Battery Low" "Battery is at $battery_percentage%."
        fi
    fi
fi

echo -e "$emoji $battery_percentage%"
echo -e "$emoji $battery_percentage%"
echo "$color"

