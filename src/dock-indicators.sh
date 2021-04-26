#!/bin/bash

# Yaru-Colors
# script to change the dock indicators (dash-to-dock)
# created by Jannomag
#

RUID=$(who | awk 'FNR == 1 {print $1}')
RUSER_UID=$(id -u ${RUID})

color=$1

#define colors:
original_base='E95420'
original_purple='762572'
original_aubergine='924D8B'
amber_base='eea834' #POP-OS based amber
amber_purple='8c5e11'
aqua_base='41c6c8'
aqua_purple='326868'
aubergine_base='77216F'
aubergine_purple='5e2750'
blue_base='208fe9'
blue_purple='255074'
brown_base='995640'
brown_purple='462e1b'
cinnamon_base='dd682a' #Ubuntu Cinnamon Remix based orange
cinnamon_purple='5e2c12'
deepblue_base='25469d'
deepblue_purple='1a318b'
green_base='3eb34f'
green_purple='123d18'
grey_base='9c9c9c'
grey_purple='4d4d4d'
lavender_base='6a39cb'
lavender_purple='3c1d79'
mate_base='78ab50' #MATE based green
mate_purple='4f6326'
orange_base='e95420'
orange_purple='a6401c'
pink_base='e920a3'
pink_purple='742558'
purple_base='924d8b' #NEW Ubuntu 20.04 Aubergine color, old was a064d8
purple_purple='5e2750'
red_base='e92020'
red_purple='742525'
teal_base='16a085' #Manjaro based teal
teal_purple='094a3d'
yellow_base='e9ba20'
yellow_purple='746225'

#interpres command
if [ "$color" == "Amber" ]; then
	base_col=$amber_base
	purple_col=$amber_purple

elif [ "$color" == "Aqua" ]; then
	base_col=$aqua_base
	purple_col=$aqua_purple

elif [ "$color" == "Blue" ]; then
	base_col=$blue_base
	purple_col=$blue_purple

elif [ "$color" == "Brown" ]; then
	base_col=$brown_base
	purple_col=$brown_purple

elif [ "$color" == "Cinnamon" ]; then
	base_col=$cinnamon_base
	purple_col=$cinnamon_purple

elif [ "$color" == "Deepblue" ]; then
	base_col=$deepblue_base
	purple_col=$deepblue_purple

elif [ "$color" == "Green" ]; then
	base_col=$green_base
	purple_col=$green_purple

elif [ "$color" == "Grey" ]; then
	base_col=$grey_base
	purple_col=$grey_purple

elif [ "$color" == "MATE" ]; then
	base_col=$mate_base
	purple_col=$mate_purple

elif [ "$color" == "Pink" ]; then
	base_col=$pink_base
	purple_col=$pink_purple

elif [ "$color" == "Purple" ]; then
	base_col=$purple_base
	purple_col=$purple_purple

elif [ "$color" == "Teal" ]; then
	base_col=$Teal_base
	purple_col=$Teal_purple

elif [ "$color" == "Red" ]; then
	base_col=$red_base
	purple_col=$red_purple

elif [ "$color" == "Yellow" ]; then
	base_col=$yellow_base
	purple_col=$yellow_purple

elif [ "$color" == "Stock" ]; then
	base_col=$original_base
	purple_col=$original_purple
elif [ "$color" == "Orange" ]; then
	base_col=$original_base
	purple_col=$original_purple

elif [ "$color" == "Custom" ]; then
	echo "Enter base color (without # like E95420): "
	read base_col
	echo "Enter purple color (without # like 762572): "
	read purple_col
	echo "Custom colors $base_col and $purple_col are set!"
	echo "Enter color / theme name for 'Yaru-NAME': "
	read color

fi
	echo "Color $color set!"

if [ "$base_col" == "" ] || [ "$purple_col" == "" ]; then
	echo "Unknown color entered. Colors are case sensitive:"
	echo "Amber, Aqua, Blue, Brown, Deepblue, Green, Grey, MATE, Pink, Purple, Teal, Red, Yellow, Custom, Stock (Orange)"
	exit
fi

echo -e "Do you want to change the dock indicators to $color?"
select yn in "Yes" "No"; do
	case $yn in
		Yes)
			sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-running-dots-color "#$base_col" 2> /dev/null
	   		sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-running-dots-border-color "#$base_col" 2> /dev/null
			echo -e "Done!"
			echo -e "You can get back to stock orange with the "Stock" argument when executing this script!"
			break
			exit
			;;
		No)
			echo -e "Ok...exiting now!"
			exit
			;;
	esac
done
