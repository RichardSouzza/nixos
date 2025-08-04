#!/bin/bash

volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2 * 100)}')

dunstify -a "Volume" -r 1001 -u low -h int:value:"$volume" "🔊 Volume"
