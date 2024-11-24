#!/bin/bash
# Get the current appearance using osascript instead
appearance=$(osascript -e 'tell application "System Events" to tell appearance preferences to return dark mode')

if [ "$appearance" = "true" ]; then
        echo "dark"
else
        echo "light"
fi
