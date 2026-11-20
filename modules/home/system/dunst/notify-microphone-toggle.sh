#!/bin/bash

line=$(wpctl status | grep -A 1 "Sources:" | grep "\*")

if echo "$line" | grep -q "MUTED"; then
  dunstify -a "Microphone" -r 1002 -u low "🎙️ Muted"
else
  dunstify -a "Microphone" -r 1002 -u low "🎙️ Unmuted"
fi
