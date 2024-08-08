#!/bin/sh

killall swaybg

script_dir=/home/kavin/.config/hypr/scripts/

/home/kavin/.config/hypr/scripts/random_wallpaper.sh
wallpaper=/home/kavin/Pictures/Wallpaper/current_wallpaper.png

swaybg -m fill -i "$wallpaper" &
wal -n -i "$wallpaper" --cols16

razer-cli -a
/home/kavin/.config/hypr/scripts/reload_dunst.sh
pywalfox update
