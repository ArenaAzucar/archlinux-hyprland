#!/bin/bash

hyprlock_config_path="$HOME/.config/hypr/hyprlock/hyprlock_theme_*"

find $hyprlock_config_path -type f | shuf -n 1
