#!/bin/bash

DEVICE="34:82:C5:C8:07:46"

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

