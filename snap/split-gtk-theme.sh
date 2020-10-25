#!/bin/sh

set -eux

basedir="$1"
gtk2dir="$basedir/share/gtk2"
themesdir="$basedir/share/themes"

for theme in "$themesdir"/*; do
    if [ ! -d "$theme" ]; then
        continue
    fi
    themename="$(basename "$theme")"
    for subdir in "$theme"/gtk-2*; do
        if [ -d "$subdir" ]; then
            mkdir -p "$gtk2dir/$themename"
            mv "$subdir" "$gtk2dir/$themename/"
        fi
    done
done

