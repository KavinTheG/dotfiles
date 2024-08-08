#!/bin/sh

wallpaper_dir=/home/kavin/Pictures/Wallpaper/
wallpaper=$(ls -d "$wallpaper_dir"* | shuf -n 1)

# copy and rename selected wallpaper
cp $wallpaper $wallpaper_dir/current_wallpaper.png
