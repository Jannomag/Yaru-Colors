![Logo](src/Yaru-Colors-Logo.svg)

**Yaru-Colors is a theme project to bring different colors to Ubuntu's awesome Yaru theme.**  
**Version 21.04**

[Original Yaru's git](https://github.com/ubuntu/yaru)  

[![Get it from the Snap Store](https://snapcraft.io/static/images/badges/en/snap-store-black.svg)](https://snapcraft.io/yaru-colors)

*Update 21.04*    
*- Update every theme to 21.04!*    
*- Updated icons to 21.04*    
*- Added two new colors as per community request: Aubergine and Lavender are now a part of the colorful family! Suggestions are ALWAYS welcome!*
ling*    
*- NOTE: Shell of Gnome 40 isn't supported yet because Yaru hasn't added support for it, yet. As soon as Yaru devs release Gnome-Shell support for Gnome 40, I'll do my best to update Yaru-Colors as well.
*RELEASED*    

*Update 20.10.1:*    
*- Updated every theme to 20.10!*    
*- Added new Wallpapers made by @fer-moreira (They're awesome, thanks a lot!)*    
*- Icons and Cursors are unchanged*    

*Update 20.04.6:*
*- Added Cinnamon as color based on Ubuntu Cinnamon Remix' orange (slightly change to Yaru-Orange)*    
*- Added snap! Thanks for @Muqtxdir for helping creating this!*    

*Update 20.04.5: Rewritten install.sh script to make it way shorter than before and a bit more user friendly. Also added Teal and Amber themes*

*Update 20.04.4: Broken symlinks were now removed, yay! Updated compiling script for this, as well.*

*Update 20.04.3: Some other fixes - tried to remove broken symlinks. Didn't work somehow.*

*Update 20.04.2: Just some fixes*

*Update 20.04.1: Updated everything with Yaru's source for Ubuntu 20.04, including new icons, new orange theme and new purple color.*


*Update 2.0: Yaru developers updated the original theme, so I did. It cointains now the new light version from 19.10.*
*Maybe I'm able to create "Yaru-Classic" theme with the old darker header bars, but for now it was enough work to create 2.0*

*Screenshots included for every theme*

Yaru-Colors themes are containing following:
- GTK 2 / 3 theme
- Gnome-Shell theme
- Recolored icons (more information below)
- Recolored cursors
- Ubuntu-Dock theme (indicators)
- Unity support (brought with Yaru 20.04)
- Wallpapers (see below)
Please note: I've added Yarus source files for gtk2/3, gnome-shell, unity, icons and cursors to my git, to be able to work with them. I'll update them as soon as I'm working on a next version of Yaru-Colors.

**Following changes are made by me:**
- .css files for GTK3 and Gnome-Shell are edited. I changed all orange and purple tinted colors
- The Unity files are edited (20.04 only)
- GTK2 images and Gnome-Shell graphics which were orange tinted are changed
- For the icon pack I just recolored the folder icons and some others, the icon packs are set to inherit to Yaru (see below)
- The cursors are recolored
- The dock got recolored app running indicators, which are changed by script, not by file

Icons: To safe space, I decided to ditch the whole Suru theme for just the edited files. The icon packs will inherit to Yarus icons in first place. To get this to work, you need to install Yarus icons ([instructions on Yaru's git](https://github.com/ubuntu/yaru)).
To change the inherit icons, you can change the index.theme file in the icons directory of each theme.    


I tried to make the installation as easy as possible.
Therefore I created an installation script called install.sh.

The installer will do a backup if something needs to be overwritten (only Ubuntu 18.10+).
It will guide you through everything and allows you to choose what you want to install.

**Installation with script:**
1. Run the installer with `./install.sh`
2. Follow the installer
3. Set your themes with gnome-tweak-tool (if not done with the script)
4. For gnome-shell you need the [User Themes Extension](https://extensions.gnome.org/extension/19/user-themes/) for Gnome-Shell
5. To change the dock indicators, simply run the dock-indicators.sh in `src`
6. Done

*Installation notes:*
*Due to an old bug in user-themes, the glib-2 schemas for this extensions aren't available systemwide. This causes and error, when trying to change the shell theme with gsettings command, because the schema for this is missing. I've added the fix from https://gist.github.com/atiensivu/fcc3183e9a6fd74ec1a283e3b9ad05f0 to the installer. It needs root privileges but the script will ask for this.*   

**GDM3 support:**    
The installer will ask for gdm3 enabling on Ubuntu with installed Yaru, only.
Please note: I didn't tried it on other distros, yet (testers welcome!).    
I don't know how gnome-shell / gdm3 works on other distros and if it's using the same files.    
This tutorial will work on Ubuntu, but may also on other distros, if the files are the same.    
Please let me know, if there are any problems with it. Modifying gdm3 / gnome-shell isn't that easy to handle, espacially if distros like Ubuntu do their own stuff.    

Manual gdm3 installation (tested on Ubuntu 20.10 only, yet. Please give me a note if something's wrong!):    
- Check if following file exists and create a backup:
`/usr/share/gnome-shell/gnome-shell-theme.gresource`
- if done copy the .gresource file of your theme to the gnome-shell directory by entering following command:    
`sudo cp THEME_DIR/Yaru-COLOR/gnome-shell/yaru-COLOR-shell-theme.gresource /usr/share/gnome-shell/gnome-shell-theme.gresource`
- update the alternatives by using the command:    
`sudo update-alternatives --config gdm3-theme.gresouce` - this will ask you to choose a file, choose the one from above.    
or the direct command: `sudo update-alternatives --set gdm3-theme.gresource /usr/share/gnome-shell/gnome-shell-theme.gresource`    
- Reboot or restart shell by using <kbd>Alt</kbd>+<kbd>F2</kbd>, enter <kbd>r</kbd> and hit <kbd>Enter</kbd>    

**Removal with script:**
1. Run the uninstaller with `./uninstall.sh`
2. Follow the script
3. Done

**Manual install:**
1. Copy your desired theme into your desired theme directory (example `~/.themes`)
2. Copy you desired icon pack into your desired theme directory (example `/usr/share/icons` or `~/.icons`)
4. Enable your themes with gsettings commands or with gnome-tweak-tool
5. To change the dock indicator color (Ubuntu's Dash-To-Dock only), find the hex code for your desired color in the list below and enter following two commands (replace HEXCODE with your color code including #):   
`gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-running-dots-color '#HEXCODE' 2> /dev/null`   
`gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-running-dots-border-color '#HEXCODE' 2> /dev/null`   
(or do it with the script, it'll do it for you...)

**Snap install**    
**special thanks to Muqtxdir**
1. Install snap package with `snap install yaru-colors` (TBR)
2. Add the themes to the snap theme list by following 3 commands:    
`for i in $(snap connections | grep gtk-common-themes:gtk-3-themes | awk '{print $2}'); do sudo snap connect $i yaru-colors:gtk-3-themes; done`    
`for i in $(snap connections | grep gtk-common-themes:gtk-2-themes | awk '{print $2}'); do sudo snap connect $i yaru-colors:gtk-2-themes; done`    
`for i in $(snap connections | grep gtk-common-themes:icon-themes | awk '{print $2}'); do sudo snap connect $i yaru-colors:icon-themes; done`    
3. Reboot or re-login

**Other distros than Ubuntu**    
**Or when you notice any issues with the icon packs**    
*Thanks to tur1ngb0x for this hint*    
1. Install dependencies
- - Debian/Ubuntu: `sudo apt install humanity-icon-theme yaru-theme-icon hicolor-icon-theme`    
- - Arch/Manjaro: `yay -S humanity-icon-theme yaru-icon-theme hicolor-icon-theme`    
2. Apply any Yaru-Color icon pack.
3. Restart GNOME Shell / Cinnamon Shell.
4. Panel icons will now show applied Yaru-Color icon pack.

**Compiling own themes**
I tried my best to create a tutorial on how to use my theme-script.sh to compile own themes. I hope it's understandable and usable.
If not, please tell me!
But: Due the lack of time I'm not able to help you at any time. So, pease, excuse me if I can't anwer instantly.

***Have fun with it!   
For any suggestions send me a message here or on Reddit /u/jannomag***

**Wallpaper information**
All wallpapers are made by me from scratch.
I made a wallpaper for each color and one with Ubuntu's stock colors.
I also added a bonus photo wallpaper, also made by me.


**Hex-Color codes of all base colors**   
First color is the Ubuntu-Orange, second the Ubuntu-Purple

| Theme | ORANGE | PURPLE |
| :--- | :---: | :---: |
| Yaru-ORIGINAL | ![#E95420](https://via.placeholder.com/15/E95420/000000?text=+) `#E95420` | ![#762572](https://via.placeholder.com/15/762572/000000?text=+) `#762572` |
| Yaru-Amber | ![#eea834](https://via.placeholder.com/15/eea834/000000?text=+) `#eea834` | ![#8c5e11](https://via.placeholder.com/15/8c5e11/000000?text=+) `#8c5e11` |
| Yaru-Aqua | ![#41c6c8](https://via.placeholder.com/15/41c6c8/000000?text=+) `#41c6c8` | ![#326868](https://via.placeholder.com/15/326868/000000?text=+) `#326868` |
| Yaru-Aubergine | ![#77216F](https://via.placeholder.com/15/77216F/000000?text=+) `#77216F` | ![#5e2750](https://via.placeholder.com/15/5e2750/000000?text=+) `#5e2750` |
| Yaru-Blue | ![#208fe9](https://via.placeholder.com/15/208fe9/000000?text=+) `#208fe9` | ![#255074](https://via.placeholder.com/15/255074/000000?text=+) `#255074` |
| Yaru-Brown | ![#995640](https://via.placeholder.com/15/995640/000000?text=+) `#995640` | ![#5e2c12](https://via.placeholder.com/15/5e2c12/000000?text=+) `#5e2c12` |
| Yaru-Cinnamon | ![#dd682a](https://via.placeholder.com/15/dd682a/000000?text=+) `#dd682a` | ![#462e1b](https://via.placeholder.com/15/462e1b/000000?text=+) `#462e1b` |
| Yaru-Deepblue | ![#25469d](https://via.placeholder.com/15/25469d/000000?text=+) `#25469d` | ![#1a318b](https://via.placeholder.com/15/1a318b/000000?text=+) `#1a318b` |
| Yaru-Green | ![#3eb34f](https://via.placeholder.com/15/3eb34f/000000?text=+) `#3eb34f` | ![#123d18](https://via.placeholder.com/15/123d18/000000?text=+) `#123d18` |
| Yaru-Grey | ![#9c9c9c](https://via.placeholder.com/15/9c9c9c/000000?text=+) `#9c9c9c` | ![#4d4d4d](https://via.placeholder.com/15/4d4d4d/000000?text=+) `#4d4d4d` |
| Yaru-Lavender | ![#6a39cb](https://via.placeholder.com/15/6a39cb/000000?text=+) `#6a39cb` | ![#3c1d79](https://via.placeholder.com/15/3c1d79/000000?text=+) `#3c1d79` |
| Yaru-MATE | ![#78ab50](https://via.placeholder.com/15/78ab50/000000?text=+) `#78ab50` | ![#4f6326](https://via.placeholder.com/15/4f6326/000000?text=+) `#4f6326` |
| Yaru-Orange | ![#e95420](https://via.placeholder.com/15/e95420/000000?text=+) `#e95420` | ![#a6401c](https://via.placeholder.com/15/a6401c/000000?text=+) `#a6401c` |
| Yaru-Pink | ![#e920a3](https://via.placeholder.com/15/e920a3/000000?text=+) `#e920a3` | ![#742558](https://via.placeholder.com/15/742558/000000?text=+) `#742558` |
| Yaru-Purple | ![#924d8b](https://via.placeholder.com/15/924d8b/000000?text=+) `#924d8b` | ![#5e2750](https://via.placeholder.com/15/5e2750/000000?text=+) `#5e2750` |
| Yaru-Red | ![#e92020](https://via.placeholder.com/15/e92020/000000?text=+) `#e92020` | ![#742525](https://via.placeholder.com/15/742525/000000?text=+) `#742525` |
| Yaru-Teal | ![#16a085](https://via.placeholder.com/15/16a085/000000?text=+) `#16a085` | ![#094a3d](https://via.placeholder.com/15/094a3d/000000?text=+) `#094a3d` |
| Yaru-Yellow | ![#e9ba20](https://via.placeholder.com/15/e9ba20/000000?text=+) `#e9ba20` | ![](https://via.placeholder.com/15/746225/000000?text=+) `#746225` |


All other colors in the themes are generated while compiling the css from Yaru's source.

**KNOWN BUGS**    
*Some buttons are wrong displayed in Gnome-Shell 40*
In Gnome 40 shell are some "glitches" or wrong looking buttons. This is just because Yaru doesn't support the shell of Gnome 40 officially, yet. As soon as they release the support, I'll update Yaru-Colors as well.

*Transparent window borders*   
Snap applications like Ubuntu Software become transparent.
This isn't really a Yaru-Colors issue. Snap has its own theme directory and I'm not able to add Yaru-Colors to this.
Currently, I don't have any way to create a Yaru-Colors Snap.
There are two solutions:
1) Set Yaru as theme using GTK Inspector - this is just temporary.
2) Completely remove Snap and install Ubuntu Software and other applications via the repositories.
For this there are many tutorials on the WWW.    
***FIX: Install yaru-colors snap package and read above!***

*Missing icons in gnome / failing to apply Yaru-Colors*  
On some distros the icon pack fails to apply (Arch in this case).
Fix by @tur1ngb0x (see issue #55):
1. Install humanity-icon-theme (dependency)
   * Debian/Ubuntu (should be installed by default): `sudo apt install humanity-icon-theme`
   * Arch/Manjaro: `sudo yay -S humanity-icon-theme`
2. Open GNOME Tweak Tool, apply any Yaru-Color icon pack.
3. Restart GNOME Shell.
4. GNOME panel icons will now show applied Yaru icon pack.

*Red checkboxes (mostly nautilus)*    
Install the whole color, not just dark or light.    
So your theme directory has to contain (for example) the directories:    
Yaru-Blue, Yaru-Blue-dark, Yaru-Blue-light.    
Reason: to save space and work the needed asset files are in the default directory only and symlinked from light/dark to default.
