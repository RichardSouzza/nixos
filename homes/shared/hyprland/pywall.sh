#!/bin/bash

if [ -e "${HOME}/.cache/wal/colors" ]; then
  wal -R --cols16
  echo "Cached colors exist. Using existing colors."

else
  # read ~/.config/hypr/hyprpaper.conf
  # get value of wallpaper=eDP-1, ~/imgs/wallpapers/green_cube.png
  wallpaper =
  wal -i ${wallpaper} --cols16
  # optionaly watch config change

  echo "Successfully set a new wallpaper and generated colors from it."
fi
