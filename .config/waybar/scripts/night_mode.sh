#!/bin/bash

PID=$(pgrep wlsunset)

if [ -z "$PID" ]; then
    # Start wlsunset with your preferred settings
    setsid wlsunset -t 3000 -T 4500 
else
    # Kill wlsunset if it's running
    kill "$PID"
fi

