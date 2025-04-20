#!/bin/bash

# Check if Waybar is running
if pgrep -x "waybar" > /dev/null; then
    echo "Waybar is running. Restarting it..."
    # Kill the Waybar process
    pkill -x "waybar"
    # Wait for the process to terminate
    sleep 0.1
else
    echo "Waybar is not running. Starting it..."
fi

# Start Waybar
waybar &
echo "Waybar has been restarted."



