Yaru-Colors is a theme project to bringt different colors to Ubuntu's awesome Yaru theme.

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

So, a short tutorial:
- Download and extract or clone
- Run the installer with './install.sh'
  -- for replacing /usr/share/gnome-shell/theme/Yaru for better compatiblity, run this script as root
- Follow the installer
- Done

To remove the theme:
- via Terminal go to the desired theme directory with 'cd /PATH/TO/THEME/yaru-COLOR'
- Run the installer with './uninstall.sh'
- Follow the uninstaller
- Done
