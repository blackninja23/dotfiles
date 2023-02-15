#!/usr/bin/bash
img=(`find ~/.wallpaper/ -name '*' -exec file {} \; | grep -o -P '^.+: \w+ image' | cut -d':' -f1`)
while true
do
   feh --bg-scale "${img[$RANDOM % ${#img[@]} ]}"
   pkill compton && compton -b --config ~/.config/compton/compton.conf
sleep 100m
done
