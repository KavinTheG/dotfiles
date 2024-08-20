#!/bin/bash

# Path to your input device
DEVICE="/dev/input/event19"

# Function to handle the key events
handle_event() {
    local code="$1"
    local value="$2"

    if [[ -n "$value" && "$value" -eq 1 ]]; then  # Check if value is non-empty and equals 1 (key pressed)
        case "$code" in
            163)  # KEY_NEXTSONG
                playerctl next
                ;;
            200)  # KEY_PLAYCD
                playerctl play
                ;;
            201)  # KEY_PAUSECD
                playerctl pause
                ;;
        esac
    fi
}

# Start listening to the device events
sudo evtest "$DEVICE" | while read -r line; do
    if echo "$line" | grep -q "EV_KEY"; then
        code=$(echo "$line" | awk -F', code ' '{print $2}' | awk '{print $1}')
        value=$(echo "$line" | awk -F', value ' '{print $2}' | awk '{print $1}')
        
        # Print extracted values for debugging
        echo "Code: $code"
        echo "Value: $value"
        
        # Handle the event
        if [[ -n "$code" && -n "$value" ]]; then
            handle_event "$code" "$value"
        fi
    fi
done

