#!/bin/bash

brightness=$(brightnessctl get)
max_brightness=$(brightnessctl max)
percent=$(( 100 * brightness / max_brightness ))

dunstify -a "Brightness" -r 1002 -u low -h int:value:"$percent" "🌙 Brightness: $percent%"
