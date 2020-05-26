![Logo](Yaru-Colors-Logo-Transparent.png)

**Yaru-Colors is a theme project to bring different colors to Ubuntu's awesome Yaru theme.**
**Version 20.04.1**

[Original Yaru's git](https://github.com/ubuntu/yaru)

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
3. Set your themes with gnome-tweak-tool
4. For gnome-shell you need the [User Themes Extension](https://extensions.gnome.org/extension/19/user-themes/) for Gnome-Shell
5. To change the dock indicators, simply run the dock-indicators.sh in `src`
6. Done

**Removal with script:**
1. Rund the uninstaller with `./uninstall.sh`
2. Follow the script
3. Done

**Manual install:**
1. Copy your desired theme into your desired theme directory (example `~/.local/share/themes`)
2. Copy you desired icon pack into your desired theme directory (example `/usr/share/icons` or `~/.icons`)
4. Enable your themes with gsettings commands or with gnome-tweak-tool
5. To change the dock indicator color (Ubuntu's Dash-To-Dock only), find the hex code for your desired color in the list below and enter following two commands (replace HEXCODE with your color code including #):   
`gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-running-dots-color 'HEXCODE' 2> /dev/null`   
`gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-running-dots-border-color 'HEXCODE' 2> /dev/null`   
(or do it with the script, it'll do it for you...)




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
| Yaru-Aqua | ![#41c6c8](https://via.placeholder.com/15/41c6c8/000000?text=+) `#41c6c8` | ![#326868](https://via.placeholder.com/15/326868/000000?text=+) `#326868` |
| Yaru-Blue | ![#208fe9](https://via.placeholder.com/15/208fe9/000000?text=+) `#208fe9` | ![#255074](https://via.placeholder.com/15/255074/000000?text=+) `#255074` |
| Yaru-Brown | ![#995640](https://via.placeholder.com/15/995640/000000?text=+) `#995640` | ![#462e1b](https://via.placeholder.com/15/462e1b/000000?text=+) `#462e1b` |
| Yaru-Deepblue | ![#25469d](https://via.placeholder.com/15/25469d/000000?text=+) `#25469d` | ![#1a318b](https://via.placeholder.com/15/1a318b/000000?text=+) `#1a318b` |
| Yaru-Green | ![#3eb34f](https://via.placeholder.com/15/3eb34f/000000?text=+) `#3eb34f` | ![#123d18](https://via.placeholder.com/15/123d18/000000?text=+) `#123d18` |
| Yaru-Grey | ![#9c9c9c](https://via.placeholder.com/15/9c9c9c/000000?text=+) `#9c9c9c` | ![#4d4d4d](https://via.placeholder.com/15/4d4d4d/000000?text=+) `#4d4d4d` |
| Yaru-MATE | ![#78ab50](https://via.placeholder.com/15/78ab50/000000?text=+) `#78ab50` | ![#4f6326](https://via.placeholder.com/15/4f6326/000000?text=+) `#4f6326` |
| Yaru-Orange | ![#e95420](https://via.placeholder.com/15/e95420/000000?text=+) `#e95420` | ![#a6401c](https://via.placeholder.com/15/a6401c/000000?text=+) `#a6401c` |
| Yaru-Pink | ![#e920a3](https://via.placeholder.com/15/e920a3/000000?text=+) `#e920a3` | ![#742558](https://via.placeholder.com/15/742558/000000?text=+) `#742558` |
| Yaru-Purple | ![#924d8b](https://via.placeholder.com/15/924d8b/000000?text=+) `#924d8b` | ![#5e2750](https://via.placeholder.com/15/5e2750/000000?text=+) `#5e2750` |
| Yaru-Red | ![#e92020](https://via.placeholder.com/15/e92020/000000?text=+) `#e92020` | ![#742525](https://via.placeholder.com/15/742525/000000?text=+) `#742525` |
| Yaru-Yellow | ![#e9ba20](https://via.placeholder.com/15/e9ba20/000000?text=+) `#e9ba20` | ![](https://via.placeholder.com/15/746225/000000?text=+) `#746225` |


All other colors in the themes are generated while compiling the css from Yaru's source.
