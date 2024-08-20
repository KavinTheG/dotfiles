#!/bin/bash

# Path to the pywal colorscheme file
color_file="$HOME/.cache/wal/colors.json"

# Extract the color you want from the colors.json file
# Adjust the jq filter to select the correct color. Example for the color "color1":
color=$(jq -r '.color1' "$color_file")

# Iterate over all PNG files in the current directory
for file in *.png; do

    if [[ "$file" != *_colour.png ]]; then
        # Construct the output filename
        output="${file%.png}_white.png"

        # Apply the ImageMagick command using the extracted color
        magick "$file" -fill white -colorize 100% "$output"
    fi
done
