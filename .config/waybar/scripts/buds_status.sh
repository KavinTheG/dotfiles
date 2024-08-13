#!/usr/bin/bash

DEVICE="34:82:C5:C8:07:46"

# Check if the device is already connected
STATUS=$(bluetoothctl info $DEVICE | grep "Connected: yes")

if [ -n "$STATUS" ]; then
    # If connected, use a specific icon (e.g., connected headphones)
    echo ""
else
    # If disconnected, use another icon (e.g., disconnected headphones)
    echo ""
fi

