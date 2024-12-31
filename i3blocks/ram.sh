#!/bin/bash

# Get raw memory stats from /proc/meminfo
mem_total_kb=$(grep MemTotal /proc/meminfo | awk '{print $2}')
mem_free_kb=$(grep MemFree /proc/meminfo | awk '{print $2}')
mem_buffers_kb=$(grep Buffers /proc/meminfo | awk '{print $2}')
mem_cached_kb=$(grep ^Cached /proc/meminfo | awk '{print $2}')

# Calculate total used memory (includes buffers and cache)
mem_used_kb=$((mem_total_kb - mem_free_kb - mem_buffers_kb - mem_cached_kb))

# Convert to gigabytes with one decimal point
mem_total=$(echo "scale=2; $mem_total_kb / 1024 / 1024" | bc)
mem_used=$(echo "scale=2; $mem_used_kb / 1024 / 1024" | bc)

# Calculate percentage of RAM used
mem_percentage=$(echo "scale=2; $mem_used_kb / $mem_total_kb * 100" | bc)

# Set color based on usage percentage
if (( $(echo "$mem_percentage > 80" | bc -l) )); then
    color="#FF0000" # Red for >80%
elif (( $(echo "$mem_percentage > 50" | bc -l) )); then
    color="#FFA500" # Orange for 50%-80%
else
    color="#FFFFFF" # White for <=50%
fi

# Output for i3blocks
echo -e "🐏 ${mem_used}/${mem_total}GB"
echo -e "🐏 ${mem_used}/${mem_total}GB"
echo "$color"

