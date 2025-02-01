#!/bin/bash
# Get the current appearance using osascript
appearance=$(osascript -e 'tell application "System Events" to tell appearance preferences to return dark mode' | tr -d '[:space:]')
# Check if appearance is "true" (dark mode)
if [ "$appearance" = "true" ]; then
    echo "dark"
else
    echo "light"
fi
