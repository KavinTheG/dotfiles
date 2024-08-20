#!/bin/bash

# Path to the pywal colors file
color_file="$HOME/.cache/wal/colors"

# Extract the 15th line (second-to-last)
colour=$(sed -n '15p' "$color_file")

icon_directory="$HOME/.config/wlogout/icons"

# Check if the color extraction was successful
if [ -z "$colour" ]; then
    exit 1
fi

echo "Selected color: $colour"

# Iterate over all PNG files in the current directory
for file in "$icon_directory"/*.png; do

    # Skip files with _colour.png ending

    if [[ "$file" != *_colour.png  ]]; then

        # Construct the output filename
        output="${file%.png}_colour.png"

        # Apply the ImageMagick command using the extracted color
        magick "$file" -fill "$colour" -colorize 100% "$output"
    fi
done

wlogout -b 4 &
