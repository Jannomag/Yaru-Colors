#!/bin/bash
WORKDIR=$(pwd)

#Yaru-Color Color-Script
#This script should compile everything from source of Yaru by it's own
#Created by Jannomag
#Licensed under the terms of GNU GPLv3

color=$1
withoutask=$2

comp_shell="false"
comp_gtk2="false"
comp_gtk3="false"
comp_icons="false"

everything="false"
#colors: Aqua, Blue, Brown, Deepblue, Green, Grey, MATE, Pink, Purple, Red, Yellow

#define colors:
original_base='E95420'
original_purple='762572'
aqua_base='41c6c8'
aqua_purple='326868'
blue_base='208fe9'
blue_purple='255074'
brown_base='995640'
brown_purple='462e1b'
deepblue_base='25469d'
deepblue_purple='1a318b'
green_base='3eb34f'
green_purple='123d18'
grey_base='9c9c9c'
grey_purple='4d4d4d'
mate_base='78ab50'
mate_purple='4f6326'
pink_base='e920a3'
pink_purple='742558'
purple_base='a064d8'
purple_purple='4c1f7a'
red_base='e92020'
red_purple='742525'
yellow_base='e9ba20'
yellow_purple='746225'


#interpres command
if [ "$color" == "Aqua" ]; then
	base_col=$aqua_base
	purple_col=$aqua_purple

elif [ "$color" == "Blue" ]; then
	base_col=$blue_base
	purple_col=$blue_purple

elif [ "$color" == "Brown" ]; then
	base_col=$brown_base
	purple_col=$brown_purple

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

elif [ "$color" == "Red" ]; then
	base_col=$red_base
	purple_col=$red_purple

elif [ "$color" == "Yellow" ]; then
	base_col=$yellow_base
	purple_col=$yellow_purple
	
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


#Check if needed packages are installed, if not exit.
if [ $(dpkg-query -W -f='${Status}' inkscape 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  echo -e "INKSCAPE is NOT installed!"
  echo -e "EXITING NOW!"
  exit
fi

if [ $(dpkg-query -W -f='${Status}' optipng 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  echo -e "OPTIPNG is NOT installed!"
  echo -e "EXITING NOW!"
  exit
fi

if [ $(dpkg-query -W -f='${Status}' libcanberra-gtk3-module 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  echo -e "LIBCANBERRA-GTK3-MODULE is NOT installed!"
  echo -e "EXITING NOW!"
  exit
fi

if [ $(dpkg-query -W -f='${Status}' libcanberra-gtk-module 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  echo -e "LIBCANBERRA-GTK-MODULE is NOT installed!"
  echo -e "EXITING NOW!"
  exit
fi


if [ "$withoutask" == "all" ]; then
	echo "Compiling everything without asking!"
	everything="true"
	comp_shell="true"
	comp_gtk2="true"
	comp_gtk3="true"
fi

if [ "$base_col" == "" ] || [ "$purple_col" == "" ]; then
	echo "Unknown color entered. Colors are case sensitive:"
	echo "Aqua, Blue, Brown, Deepblue, Green, Grey, MATE, Pink, Purple, Red, Yellow, Custom"
	exit
fi

if [ $everything == "false" ]; then
	echo -e "Do you want to compile the gtk3 theme?"
	select yn in "Yes" "No"; do
		case $yn in
			Yes) 
			     comp_gtk3="true"
			     break;;
			No)  
			     comp_gtk3="false"
			     break;;
		esac
	done	
fi

while [ $comp_gtk3 == "true" ]
do
#set paths for defaul theme
gtk32_path=$WORKDIR/Themes/Yaru-$color/gtk-3.20
gtk30_path=$WORKDIR/Themes/Yaru-$color/gtk-3.0
gtk20_path=$WORKDIR/Themes/Yaru-$color/gtk-2.0
shell_path=$WORKDIR/Themes/Yaru-$color/gnome-shell

#set paths for dark theme
gtk32d_path=$WORKDIR/Themes/Yaru-$color-dark/gtk-3.20
gtk30d_path=$WORKDIR/Themes/Yaru-$color-dark/gtk-3.0
gtk20d_path=$WORKDIR/Themes/Yaru-$color-dark/gtk-2.0

#set paths for light theme
gtk32l_path=$WORKDIR/Themes/Yaru-$color-light/gtk-3.20
gtk30l_path=$WORKDIR/Themes/Yaru-$color-light/gtk-3.0
gtk20l_path=$WORKDIR/Themes/Yaru-$color-light/gtk-2.0

#creating directories
mkdir -p $gtk32_path
mkdir -p $gtk30_path
mkdir -p $gtk20_path
mkdir -p $shell_path
mkdir -p $gtk32d_path
mkdir -p $gtk30d_path
mkdir -p $gtk20d_path
mkdir -p $gtk32l_path
mkdir -p $gtk30l_path
mkdir -p $gtk20l_path

#set source paths
source32_path=$WORKDIR/default/gtk-3.20
source30_path=$WORKDIR/default/gtk-3.0

#creating backups for the original files if something fails
echo -e "Backing up original _ubuntu-colors.scss and _colors.scss ..."
cp $source32_path/_ubuntu-colors.scss $source32_path/BAK_ubuntu-colors.scss
cp $source32_path/_colors.scss $source32_path/BAK_colors.scss

#check if the backups are there, if not exit
if [ ! -f "$source32_path/BAK_ubuntu-colors.scss" ] && [ ! -f "$source32_path/BAK_colors.scss" ]
then
	echo -e "BACKUP DIDN'T WORK, EXITING NOW!"
	exit
fi


#replace the color values in _ubuntu-colors.scss
echo -e "Find and replace the color values in _ubuntu-colors.scss ..."
sed -i -e "s/E95420/$base_col/g" $source32_path/_ubuntu-colors.scss
sed -i -e "s/300A24/$purple_col/g" $source32_path/_ubuntu-colors.scss

echo -e "Find and replace the color values in _colors.scss ..."
#replace the color values in _colors.scss
sed -i -e "s/E95420/$base_col/g" $source32_path/_colors.scss

echo -e " "
echo -e "Compiling gtk.scss of default, light and dark for GTK 3.20 ..."

#compiling files with sassc
#default
cd $source32_path
sassc -a ./gtk.scss ./gtk_generated.css
#dark
sassc -a ./gtk-dark.scss ./gtk_dark_generated.css
#light
sassc -a ./gtk-light.scss ./gtk_light_generated.css

ls -l $gtk32_path
ls -l $gtk32d_path

echo -e " "
echo -e "Compiling gtk.scss of default, light and dark for GTK 3.00 ..."

#compiling files with sassc
#default
cd $source30_path
sassc -a ./gtk.scss ./gtk_generated.css
#dark
sassc -a ./gtk-dark.scss ./gtk_dark_generated.css
#light
sassc -a ./gtk-light.scss ./gtk_light_generated.css

cd $WORKDIR 
#copy files to the theme directories
echo -e "copy assets directory..."
mv $source32_path/gtk_generated.css $gtk32_path/gtk.css
mv $source32_path/gtk_dark_generated.css $gtk32d_path/gtk.css
mv $source32_path/gtk_light_generated.css $gtk32l_path/gtk.css
cp -R $source32_path/assets $gtk32_path
cd $gtk32l_path
ln -rs ../../Yaru-$color/gtk-3.20/assets ./assets
cd $gtk32d_path
ln -rs ../../Yaru-$color/gtk-3.20/assets ./assets 
mv $source30_path/gtk_generated.css $gtk30_path/gtk.css
mv $source30_path/gtk_dark_generated.css $gtk30d_path/gtk.css
mv $source30_path/gtk_light_generated.css $gtk30l_path/gtk.css
cp -R $source30_path/assets $gtk30_path

dark32_link='@import url("../../Yaru-'"$color"'-dark/gtk-3.20/gtk.css");'
light32_link='@import url("../../Yaru-'"$color"'-light/gtk-3.20/gtk.css");'
dark30_link='@import url("../../Yaru-'"$color"'-dark/gtk-3.0/gtk.css");'
light30_link='@import url("../../Yaru-'"$color"'-light/gtk-3.0/gtk.css");'

echo $dark32_link >> $gtk32_path/gtk-dark.css
echo $light32_link >> $gtk32_path/gtk-light.css
echo $dark30_link >> $gtk30_path/gtk-dark.css
echo $light30_link >> $gtk30_path/gtk-light.css

#creating symlinks to the assets directories for each flavor
cd $gtk30l_path
ln -rs ../../Yaru-$color/gtk-3.0/assets ./assets 
cd $gtk30d_path
ln -rs ../../Yaru-$color/gtk-3.0/assets ./assets

#restore the backup
mv $source32_path/BAK_ubuntu-colors.scss $source32_path/_ubuntu-colors.scss
mv $source32_path/BAK_colors.scss $source32_path/_colors.scss

cd $WORKDIR

##################################
### Creating index.theme files ###
##################################


index_theme_path=$WORKDIR/Themes/Yaru-$color
intex_light_path=$WORKDIR/Themes/Yaru-$color-light
index_dark_path=~$WORKDIR/Themes/Yaru-$color-dark

index_defaultfile=$index_theme_path/index.theme
index_lightfile=$index_light_path/index_light.theme
index_darkfile=$index_dark_path/index_dark.theme

index_default_source=$WORKDIR/index.theme
index_light_source=$WORKDIR/index_light.theme
index_dark_source=$WORKDIR/index_dark.theme

cp $index_default_source $index_default_source.BAK
cp $index_light_source $index_light_source.BAK
cp $index_dark_source $index_dark_source.BAK

sed -i -e "s/COLOR/$color/g" $index_default_source
sed -i -e "s/COLOR/$color/g" $index_light_source
sed -i -e "s/COLOR/$color/g" $index_dark_source

mv $index_default_source $WORKDIR/Themes/Yaru-$color
mv $index_light_source $WORKDIR/Themes/Yaru-$color-light
mv $index_dark_source $WORKDIR/Themes/Yaru-$color-dark

mv $index_default_source.BAK $index_default_source
mv $index_light_source.BAK $index_light_source
mv $index_dark_source.BAK $index_dark_source


echo -e "Done!"
comp_gtk3="false"

done


echo -e ""


if [ $everything == "false" ]; then
	echo -e "Do you want to compile the gnome-shell theme?"
	select yn in "Yes" "No"; do
		case $yn in
			Yes) 
			     comp_shell="true"
			     break;;
			No)  
			     comp_shell="false"
			     break;;
		esac
	done
fi

while [ $comp_shell == "true" ]
do

echo -e "Compiling shell theme..."


#############################
### COMPILING SHELL THEME ###
#############################

#Setting paths for the theme
theme_path=$WORKDIR/Themes/Yaru-$color
theme_light_path=$WORKDIR/Themes/Yaru-$color-light
theme_dark_path=$WORKDIR/Themes/Yaru-$color-dark
shell_path=$theme_path/gnome-shell
shell_light_path=$theme_light_path/gnome-shell
shell_dark_path=$theme_dark_path/gnome-shell

#creating directory
mkdir -p $shell_path
mkdir -p $shell_light_path
mkdir -p $shell_dark_path


#setting source paths
source_path=$WORKDIR/shell
sass_path=$WORKDIR/shell/gnome-shell-sass

#creating backup of original file
echo -e "backing up original _ubuntu-colors.scss ..."
cp $sass_path/_ubuntu-colors.scss $sass_path/BAK_ubuntu-colors.scss


#if backup failed, exit
if [ ! -f "$sass_path/BAK_ubuntu-colors.scss" ]
then
	echo -e "BACKUP FAILED, EXITING NOW!"
	exit
fi


#replacing colors
echo -e "Find and replace original colors in _ubuntu-colors.scss ..."
sed -i -e "s/E95420/$base_col/g" $sass_path/_ubuntu-colors.scss
sed -i -e "s/300A24/$purple_col/g" $sass_path/_ubuntu-colors.scss

echo -e " "
echo -e "Compiling gnome-shell theme ..."

#compile
sassc $source_path/light/gnome-shell.scss $source_path/light/gnome-shell-generated.css
sassc $source_path/dark/gnome-shell.scss $source_path/dark/gnome-shell-generated.css
sassc $source_path/gnome-shell-high-contrast.scss $source_path/gnome-shell-high-contrast-generated.css

#Changing the stock colors in the svg files
#Following files containing the stock orange:
#checkbox-focused.svg
#checkbox-focused-dark.svg
#checkbox-off-focused.svg
#checkbox-off-focused-dark.svg

#setting svg variables
cd $source_path
svg1="checkbox-focused.svg"
svg2="checkbox-focused-dark.svg"
svg3="checkbox-off-focused.svg"
svg4="checkbox-off-focused-dark.svg"

#backing up original svgs
mkdir svg_backup
cp $svg1 svg_backup/
cp $svg2 svg_backup/
cp $svg3 svg_backup/
cp $svg4 svg_backup/

echo -e "modify svg files ..."
#replacing the colors
sed -i -e "s/e95420/$base_col/g" $svg1
sed -i -e "s/e95420/$base_col/g" $svg2
sed -i -e "s/e95420/$base_col/g" $svg3
sed -i -e "s/e95420/$base_col/g" $svg4



echo -e " "
#copy everything
echo -e "copy files to the theme directory ..."
cp $source_path/light/gnome-shell-generated.css $shell_path/gnome-shell.css
mv $source_path/light/gnome-shell-generated.css $shell_light_path/gnome-shell.css
mv $source_path/dark/gnome-shell-generated.css $shell_dark_path/gnome-shell.css
mv $source_path/gnome-shell-high-contrast-generated.css $shell_light_path/gnome-shell-high-contrast.css

#cp -R $source_path/*.css $shell_light_path
cp -R $source_path/*.svg $shell_light_path
cp -R $source_path/*.svg $shell_dark_path

#restoring svg backups
mv svg_backup/*.svg .
rm -rf svg_backup

#restoring _ubuntu-colors.scss
mv $sass_path/BAK_ubuntu-colors.scss $sass_path/_ubuntu-colors.scss

cd ~

echo -e "Done!"

comp_shell="false"
done

if [ $everything == "false" ]; then
	echo -e "Do you want to compile the gtk2 theme (this may take a while)?"
	select yn in "Yes" "No"; do
		case $yn in
			Yes) 
			     comp_gtk2="true"
			     break
		 	     ;;
			No) 
        	             comp_gtk2="false"
        	             break;;
		esac
	done
fi

while [ $comp_gtk2 == "true" ]
do

############################
### COMPILING GTK2 THEME ###
############################

if ! [ -x "$(command -v inkscape)" ]; then
  echo 'Error: INKSCAPE is not installed. Exiting now!' >&2
  exit 1
fi

if ! [ -x "$(command -v optipng)" ]; then
  echo 'Error: OPTIPNG is not installed. Exiting now!' >&2
  exit 1
fi


#setting path for default theme
gtk20_path=$WORKDIR/Themes/Yaru-$color/gtk-2.0
#setting path for light theme
gtk20l_path=$WORKDIR/Themes/Yaru-$color-light/gtk-2.0
#setting path for dark theme
gtk20d_path=$WORKDIR/Themes/Yaru-$color-dark/gtk-2.0

#creating directories
mkdir -p $gtk20_path
mkdir -p $gtk20l_path
mkdir -p $gtk20d_path

#set source paths
source20_path=$WORKDIR/default/gtk-2.0
source20l_path=$WORKDIR/light/gtk-2.0
source20d_path=$WORKDIR/dark/gtk-2.0

#creating backups of original files
echo -e "Sichere Original-Dateien ..."
cp $source20_path/gtkrc $source20_path/BAK_gtkrc
cp $source20_path/assets.svg $source20_path/BAK_assets.svg
cp -R $source20_path/assets $source20_path/BAK_assets

cp $source20l_path/gtkrc $source20l_path/BAK_gtkrc
cp $source20l_path/assets.svg $source20l_path/BAK_assets.svg
cp -R $source20l_path/assets $source20l_path/BAK_assets

cp $source20d_path/gtkrc $source20d_path/BAK_gtkrc
cp $source20d_path/assets.svg $source20d_path/BAK_assets.svg
cp -R $source20d_path/assets $source20d_path/BAK_assets

#cheking if backup worked, if not, exit.
if [ ! -f "$source20_path/BAK_gtkrc" ] || [ ! -f "$source20l_path/BAK_gtkrc" ] || [ ! -f "$source20d_path/BAK_gtkrc" ]
then
	echo -e "BACKUP FAILED, EXITING NOW!"
	exit
fi

#replacing the colors in gtkrc file
echo -e "Seach and replace the original colors in all three gtkrc files ..."
sed -i -e "s/e55730/$base_col/g" $source20_path/gtkrc
sed -i -e "s/e55730/$base_col/g" $source20l_path/gtkrc
sed -i -e "s/e55730/$base_col/g" $source20d_path/gtkrc
sed -i -e "s/E95420/$base_col/g" $source20_path/gtkrc
sed -i -e "s/E95420/$base_col/g" $source20l_path/gtkrc
sed -i -e "s/E95420/$base_col/g" $source20d_path/gtkrc

echo -e "Seach and replace the original colors in all three assets.svg files ..."

sed -i -e "s/e55730/$base_col/g" $source20_path/assets.svg
sed -i -e "s/c34113/$base_col/g" $source20_path/assets.svg
sed -i -e "s/e55730/$base_col/g" $source20l_path/assets.svg
sed -i -e "s/c34113/$base_col/g" $source20l_path/assets.svg
sed -i -e "s/e55730/$base_col/g" $source20d_path/assets.svg
sed -i -e "s/c34113/$base_col/g" $source20d_path/assets.svg
sed -i -e "s/E95420/$base_col/g" $source20_path/assets.svg
sed -i -e "s/c34113/$base_col/g" $source20_path/assets.svg
sed -i -e "s/E95420/$base_col/g" $source20l_path/assets.svg
sed -i -e "s/c34113/$base_col/g" $source20l_path/assets.svg
sed -i -e "s/E95420/$base_col/g" $source20d_path/assets.svg
sed -i -e "s/c34113/$base_col/g" $source20d_path/assets.svg

echo -e "Seach and replace the original colors in all three assets_-xternal.svg files ..."

sed -i -e "s/e55730/$base_col/g" $source20_path/assets-external.svg
sed -i -e "s/e55730/$base_col/g" $source20l_path/assets-external.svg
sed -i -e "s/e55730/$base_col/g" $source20d_path/assets-external.svg
sed -i -e "s/E95420/$base_col/g" $source20_path/assets-external.svg
sed -i -e "s/E95420/$base_col/g" $source20l_path/assets-external.svg
sed -i -e "s/E95420/$base_col/g" $source20d_path/assets-external.svg

#c34113

echo -e " "
echo -e "Rendering assets (this may take a bit) ..."

cd $source20_path
#########################
### RENDER SVG ASSETS ###

INKSCAPE="/usr/bin/inkscape"
OPTIPNG="/usr/bin/optipng"

SRC_FILE="assets.svg"
ASSETS_DIR="assets"
INDEX="assets.txt"
SRC_FILE_EXTERNAL="assets-external.svg"
INDEX_EXTERNAL="assets-external.txt"

rm assets/*.png
for i in `cat $INDEX`
do 
if [ -f $ASSETS_DIR/$i.png ]; then
    echo $ASSETS_DIR/$i.png exists.
else
    echo
    echo Rendering $ASSETS_DIR/$i.png
    $INKSCAPE --export-id=$i \
              --export-id-only \
              --export-background-opacity=0 \
              --export-png=$ASSETS_DIR/$i.png $SRC_FILE >/dev/null \
	      && $OPTIPNG -o7 --quiet $ASSETS_DIR/$i.png 
fi
done

for i in `cat $INDEX_EXTERNAL`
do 
if [ -f $ASSETS_DIR/$i.png ]; then
    echo $ASSETS_DIR/$i.png exists.
else
    echo
    echo Rendering $ASSETS_DIR/$i.png
    $INKSCAPE --export-id=$i \
              --export-id-only \
              --export-background-opacity=0 \
              --export-png=$ASSETS_DIR/$i.png $SRC_FILE_EXTERNAL >/dev/null \
	      && $OPTIPNG -o7 --quiet $ASSETS_DIR/$i.png 
fi
done

cd $source20l_path
#########################
### RENDER SVG ASSETS ###

INKSCAPE="/usr/bin/inkscape"
OPTIPNG="/usr/bin/optipng"

SRC_FILE="assets.svg"
ASSETS_DIR="assets"
INDEX="assets.txt"
SRC_FILE_EXTERNAL="assets-external.svg"
INDEX_EXTERNAL="assets-external.txt"

rm assets/*.png
for i in `cat $INDEX`
do 
if [ -f $ASSETS_DIR/$i.png ]; then
    echo $ASSETS_DIR/$i.png exists.
else
    echo
    echo Rendering $ASSETS_DIR/$i.png
    $INKSCAPE --export-id=$i \
              --export-id-only \
              --export-background-opacity=0 \
              --export-png=$ASSETS_DIR/$i.png $SRC_FILE >/dev/null \
	      && $OPTIPNG -o7 --quiet $ASSETS_DIR/$i.png 
fi
done

for i in `cat $INDEX_EXTERNAL`
do 
if [ -f $ASSETS_DIR/$i.png ]; then
    echo $ASSETS_DIR/$i.png exists.
else
    echo
    echo Rendering $ASSETS_DIR/$i.png
    $INKSCAPE --export-id=$i \
              --export-id-only \
              --export-background-opacity=0 \
              --export-png=$ASSETS_DIR/$i.png $SRC_FILE_EXTERNAL >/dev/null \
	      && $OPTIPNG -o7 --quiet $ASSETS_DIR/$i.png 
fi
done


cd $source20d_path
#########################
### RENDER SVG ASSETS ###

INKSCAPE="/usr/bin/inkscape"
OPTIPNG="/usr/bin/optipng"

SRC_FILE="assets.svg"
ASSETS_DIR="assets"
INDEX="assets.txt"
SRC_FILE_EXTERNAL="assets-external.svg"
INDEX_EXTERNAL="assets-external.txt"

rm assets/*.png
for i in `cat $INDEX`
do 
if [ -f $ASSETS_DIR/$i.png ]; then
    echo $ASSETS_DIR/$i.png exists.
else
    echo
    echo Rendering $ASSETS_DIR/$i.png
    $INKSCAPE --export-id=$i \
              --export-id-only \
              --export-background-opacity=0 \
              --export-png=$ASSETS_DIR/$i.png $SRC_FILE >/dev/null \
	      && $OPTIPNG -o7 --quiet $ASSETS_DIR/$i.png 
fi
done

for i in `cat $INDEX_EXTERNAL`
do 
if [ -f $ASSETS_DIR/$i.png ]; then
    echo $ASSETS_DIR/$i.png exists.
else
    echo
    echo Rendering $ASSETS_DIR/$i.png
    $INKSCAPE --export-id=$i \
              --export-id-only \
              --export-background-opacity=0 \
              --export-png=$ASSETS_DIR/$i.png $SRC_FILE_EXTERNAL >/dev/null \
	      && $OPTIPNG -o7 --quiet $ASSETS_DIR/$i.png 
fi
done

echo -e " "
echo -e "Copy theme..."

#Copy everything
cp -R $source20_path/assets $gtk20_path
cp $source20_path/*.rc $gtk20_path
cp -R $source20l_path/assets $gtk20l_path
cp $source20l_path/*.rc $gtk20l_path
cp -R $source20d_path/assets $gtk20d_path
cp $source20d_path/*.rc $gtk20d_path
cp $source20_path/gtkrc $gtk20_path
cp $source20l_path/gtkrc $gtk20l_path
cp $source20d_path/gtkrc $gtk20d_path

rm -rf $source20_path/gtkrc
mv $source20_path/BAK_gtkrc $source20_path/gtkrc
rm -rf $source20_path/assets.svg
mv $source20_path/BAK_assets.svg $source20_path/assets.svg
rm -rf $source20_path/assets
mv $source20_path/BAK_assets $source20_path/assets

rm -rf $source20l_path/gtkrc
mv $source20l_path/BAK_gtkrc $source20l_path/gtkrc
rm -rf $source20l_path/assets.svg
mv $source20l_path/BAK_assets.svg $source20l_path/assets.svg
rm -rf $source20l_path/assets
mv $source20l_path/BAK_assets $source20l_path/assets

rm -rf $source20d_path/gtkrc
mv $source20d_path/BAK_gtkrc $source20d_path/gtkrc
rm -rf $source20d_path/assets.svg
mv $source20d_path/BAK_assets.svg $source20d_path/assets.svg
rm -rf $source20d_path/assets
mv $source20d_path/BAK_assets $source20d_path/assets

cd $WORKDIR

echo -e "Done"

comp_gtk2="false"
done

### ICON COMPILING -- TESTING ###
: ' ICON TESTING COMMENT BEGIN >>>>>>>
echo -e "Do you want to compile the icons theme (this may take a while)?"
select yn in "Yes" "No"; do
	case $yn in
		Yes) 
		     comp_icons="true"
		     break
	 	     ;;
		No) 
                     comp_icons="false"
                     break;;
	esac
done

while [ $comp_icons == "true" ]
do

cd $WORKDIR/icons
echo -e "Replacing the stock colors of the folder-icons svgs ..."
cp ./fullcolor/places/folders.svg ./fullcolor/places/folders.svg.bak
if [ ! -f ./fullcolor/places/folders.svg.bak ]; then
	echo -e "Tried to backup folders.svg in ./fullcolor/places, FAILED. Exiting now!"
	exit
else
	sed -i -e "s/e95420/$base_col/g" $WORKDIR/icons/fullcolor/places/folders.svg
fi

cd fullcolor
echo -e "Starting render script, this may take a bit ..."
python render-bitmaps.py
echo -e "Done!"
echo -e "Placing the rendered icons under src/Themes/Icons-$color"
cd $WORKDIR
mv $WORKDIR/icons/temp $WORKDIR/Themes/Icons-$color
rm -rf $WORKDIR/icons/fullcolor/places/folder.svg && mv $WORKDIR/icons/fullcolor/places/folder.svg.bak $WORKDIR/icons/fullcolor/places/folder.svg
comp_icons="false"
done

<<<<<< END OF ICON COMMENT'

echo -e "Everything's done now, your files are stored in the Themes directory!"
