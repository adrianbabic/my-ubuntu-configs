#!/bin/bash

# Get disk usage for the root (/) filesystem
disk_total=$(df -h / | awk 'NR==2 {print $2}') # Total disk space
disk_used=$(df -h / | awk 'NR==2 {print $3}')  # Used disk space

# Output for i3blocks
echo -e "💽 ${disk_used}/${disk_total}"
echo -e "💽 ${disk_used}/${disk_total}"
echo "#FFFFFF"

