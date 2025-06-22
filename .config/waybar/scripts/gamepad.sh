#!/bin/bash

DEVICE="7C:66:EF:48:89:0B"

# Check if the device is already connected
STATUS=$(bluetoothctl info $DEVICE | grep "Connected: yes")

if [ -n "$STATUS" ]; then
    # If the device is connected, disconnect it
    echo "Device is connected, disconnecting..."
    bluetoothctl disconnect $DEVICE
else
    # If the device is not connected, connect it
    echo "Device is not connected, connecting..."
    bluetoothctl connect $DEVICE
    
    sleep 5
    /home/kavin/.config/waybar/scripts/buds_evtest.sh
fi

