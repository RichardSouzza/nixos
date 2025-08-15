#!/bin/bash

line=$(wpctl status | grep -A 1 "Sinks:" | grep "\*")

if echo "$line" | grep -q "MUTED"; then
  dunstify -a "Volume" -r 1001 -u low "🔈 Muted"
else
  dunstify -a "Volume" -r 1001 -u low "🔊 Unmuted"
fi
