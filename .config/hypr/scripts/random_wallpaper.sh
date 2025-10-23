#!/bin/sh

wallpaper_dir=/home/kavin/Pictures/Wallpaper/
history_file="$wallpaper_dir/.wallpaper_history"

# Get last wallpaper
last_wallpaper=$(tail -n 1 "$history_file" 2>/dev/null)

# Pick a new one that's different
wallpaper=$(ls -d "$wallpaper_dir"* | grep -v "current_wallpaper.png" | grep -v "$(basename "$last_wallpaper")" | shuf -n 1)

# If we got nothing (only one wallpaper exists), just use any wallpaper
if [ -z "$wallpaper" ]; then
    wallpaper=$(ls -d "$wallpaper_dir"* | grep -v "current_wallpaper.png" | shuf -n 1)
fi

# Copy and save to history
cp "$wallpaper" "$wallpaper_dir/current_wallpaper.png"
echo "$wallpaper" >> "$history_file"
