#!/bin/sh

set -eux

basedir="$1"

# Don't include panel icons to reduce size as they aren't
# generally useful in the snap.
if [ -d "$basedir" ]; then
    find "$basedir" -name panel -exec rm -rf {} +
fi

for dir in "$basedir"/*/; do
    if [ -f "$dir/index.theme" ]; then
        gtk-update-icon-cache -q "$dir"
    fi
done
