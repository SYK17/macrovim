#!/bin/bash

# Get the current appearance
appearance=$(defaults read -g AppleInterfaceStyle 2>/dev/null)

if [ "$appearance" = "Dark" ]; then
    echo "dark"
else
    echo "light"
fi
