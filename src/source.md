The source is Ubuntu's Yaru, licensed under the terms of the GNU Gernal Public License, version 3.
Source link: https://github.com/ubuntu/yaru

To compile just run the theme-script.sh with your desired color.
Example: `./theme-script.sh Aqua`
If you want to compile a complete theme without asking then execute the script with the 'all' argument after the color.
Example: `./theme-script.sh Blue all`
Please note that the color is case sensitive. You can also run the script the the `Custom` argument to enter your own base colors for Yaru's orange and purple parts.

The script will compile everything including gtk-3.(2)0, gtk-2.0 and gnome-shell theme.
This script will also execute a python script to render some icons.
I decided to modify the orange tinted icons for places and folders, only. So the icons directory will just contain the folders.svg.
The script is modified by me to just render icons in the fullcolor/places directory. They rendered icons will be placed in a temp directory and my theme-script will place them in a new directory named "Icons-COLOR" in "src/Themes".






