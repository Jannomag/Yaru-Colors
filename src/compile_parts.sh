#!/bin/bash

#script to compile just one theme part but for every color at once
#it just executes theme-script.sh with the color values from the array and the command given.

# This script will NOT output anything theme-script.sh will do!

array=( Amber Aqua Aubergine Blue Brown Cinnamon Deepblue Green Grey Lavender MATE Orange Pink Purple Red Teal Yellow )
readpart=$1
while [ ! -z "$1" ]; do
  case "$1" in
    --all|-a)
      shift
      ;;
    --gtk3|-3)
      shift
      ;;
    --gtk2|-2)
      shift
      ;;
    --shell|-s)
      shift
      ;;
    --unity|-u)
      shift
      ;;
    --icons|-i)
      shift
      ;;
    --cursors|-c)
      shift
      ;;
    --noicons|-n)
      shift
      ;;
    *)
      break ;;
    esac
done


for color in "${array[@]}"
do
  echo -e "Compiling: Yaru-$color"
  echo -e "\033[2K"
  ./theme-script.sh $color $readpart >/dev/null
done

echo -e "Done"
