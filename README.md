**Yaru-Colors is a theme project to bringt different colors to Ubuntu's awesome Yaru theme.**

Yaru-Colors themes conataing following:
- GTK 2 / 3 theme
- Gnome-Shell theme
- Yaru icons
- Ubuntu-Dock theme (indicators)

Following changes are made by me:
- .css files for GTK3 and Gnome-Shell are edited. I changed all orange and purple tinted colors
- GTK2 images and Gnome-Shell graphics which were orange tinted are changed
- For the icon pack I just recolored the folder icons in 'places' and 'status'
- The dock got recolored app running indicators, which are changed by script, not by file

I tried to make the installation as easy as possible.
Therefore I created an installation script called install.sh. 

The installer will do a backup if something needs to be overwritten (only Ubuntu 18.10+).
It will guide you through everything and you can choose what you want to install.

Installation with script:
- Run the installer with `./install.sh`
  -- for replacing /usr/share/gnome-shell/theme/Yaru for better compatiblity, run this script as root
- Follow the installer
- Done

Removal with script:
- Rund the uninstaller with `./uninstall.sh`
  -- if you installed the shell theme to /usr/share/gnome-shell/theme/Yaru, run this script as root
- Follow the script
- Done

Manual install:
- Copy your desired theme into your desired theme directory (example `/usr/share/themes` or `~/.local/share/themes`)
- Copy you desired icon pack into your desired theme directory (example `/usr/share/icons` or `~/.icons`)
- For better compatiblity you can optionally copy the files from a theme's gnome-shell directory to /usr/share/gnome-shell/theme/Yaru and overwrite everything AFTER you backed up the files
- Enable your themes with gsettings commands or with gnome-tweak-tool
- To change the dock indicator color (Ubuntu's Dash-To-Dock only), find the hex code for your desired color in the list below and enter following two commands (replace HEXCODE with your color code including #):
`gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-running-dots-color 'HEXCODE' 2> /dev/null`
`gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-running-dots-border-color 'HEXCODE' 2> /dev/null`
(or do it with the script, it'll do it for you...)


Have fun with it!
For any suggestions send me a message here or on Reddit /u/jannomag




Hex-Color codes of all base colors
- First color is the Ubuntu-Orange, second the Ubuntu-Purple
`
Yaru-ORIGINAL:	#E95420 - #762572
Yaru-Aqua:	#41c6c8 - #326868
Yaru-Blue:	#208fe9 - #255074
Yaru-Brown:	#995640 - #462e1b
Yaru-Deepblue:  #25469d - #1a318b
Yaru-Green:	#3eb34f - #123d18
Yaru-Grey:	#9c9c9c - #4d4d4d
Yaru-MATE:	#78ab50 - #4f6326
Yaru-Pink:	#e920a3 - #742558
Yaru-Purple:	#a064d8 - #4c1f7a
Yaru-Red:	#e92020 - #742525
Yaru-Yellow:	#e9ba20 - #746225
`
All other colors in the themes are generated while compiling the css from Yaru's source.

