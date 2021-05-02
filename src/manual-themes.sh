#!/bin/bash

# Script to copy every theme including icons and wallpaper to new directories
# then pack it into seperate archives

# creating array for every color
#array=( Amber Aqua Aubergine Blue Brown Cinnamon Deepblue Green Grey Lavender MATE Orange Pink Purple Red Teal Yellow )
COLORS="colors.txt"
version=$1
# setting variable for every color
for color in `cat $COLORS`
do
	mkdir -p ../Manual/Yaru-$color/Theme	# creating theme directory
	mkdir -p ../Manual/Yaru-$color/Icons	# creating icons directory
	theme="../Manual/Yaru-$color/Theme"	# setting path variable for themes
	icons="../Manual/Yaru-$color/Icons"	# setting path variable for icons
	root="../Manual/Yaru-$color"		# setting root variable

	cp -R ../Themes/Yaru-$color* $theme	# copy theme
	cp -R ../Icons/Yaru-$color* $icons	# copy icons
	cp -R ../Wallpapers/Yaru-$color* $root	# copy wallpaper
	cp -R ../Wallpapers/Gorilla_Yaru-$color* $root
	cp ./dock-indicators.sh $root
	cp -R ./manual-readme.md $root/README.md
	cd $root
	tar cfJ ../Yaru-$color-v$version.tar.xz *	# pack each folder in seperate archives
	cd ../
	rm -rf $root
done

tar cfJ ../Complete_Yaru-Colors-v$version.tar.xz ../Themes ../Wallpapers ../Icons ../install.sh ../LICENSE.md ../README.md ../uninstall.sh ../src/dock-indicators.src
