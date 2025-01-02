#!/bin/bash

# Get the directory where the script is located
DEST_DIR="$(dirname "$(realpath "$0")")"

# List of directories and files to back up
# Add paths to the list as needed
CONFIGS=(
    "$HOME/.config/i3"
    "$HOME/.config/i3blocks"
    "$HOME/.xbindkeysrc"
)

# Back up each item
for SOURCE in "${CONFIGS[@]}"; do
    # Get the base name of the source (e.g., i3 from ~/.config/i3 or .bashrc)
    ITEM_NAME=$(basename "$SOURCE")
    
    # Ensure the source exists
    if [ -e "$SOURCE" ]; then
        echo "Backing up $ITEM_NAME..."
        
        # If it's a directory, sync its contents
        if [ -d "$SOURCE" ]; then
            rsync -av --delete "$SOURCE/" "$DEST_DIR/$ITEM_NAME/"
        else
            # If it's a file, copy it directly
            rsync -av "$SOURCE" "$DEST_DIR/"
        fi
    else
        echo "Warning: $SOURCE does not exist. Skipping."
    fi
done

echo "Backup completed to $DEST_DIR."

