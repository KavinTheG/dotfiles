#!/bin/sh

script_dir=/home/kavin/.config/hypr/scripts/

/home/kavin/.config/hypr/scripts/random_wallpaper.sh
wallpaper=/home/kavin/Pictures/Wallpaper/current_wallpaper.png

MATUGEN_FORCE_WALLPAPER=1 /home/kavin/.cargo/bin/matugen image "$wallpaper"
hyprctl reload
exec zsh

