# my-linux-configs

- sudo apt install
    - dunst
        - notification bubble manager
    - papirus-icon-theme
        - custom notification icons for each application
    - flameshot
        - taking screenshots
    - picom
        - don't really know
    - i3blocks
        - status bar koji koristim
    - fonts-font-awesome
    - fonts-noto-color-emoji
        - za emojie u i3blocks

- command for changing multiple monitors relative position
    - ```xrandr --output DP1 --left-of HDMI1```
    - autorandr
        - save config for each specific monitor, use `autorandr --save CONFIG-NAME` to save the config for the current montior, after using xrandr to set the monitors position
        - use `autorandr` to list existing monitor configs