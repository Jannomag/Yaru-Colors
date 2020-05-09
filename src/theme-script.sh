#!/bin/bash
WORKDIR=$(pwd)

#Yaru-Color Color-Script
#Now working with 20.04! (at least it should...)
#This script should compiles everything from the source of Ubuntu's Yaru by it's own
#Created by Jannomag
#Licensed under the terms of GNU GPLv3

###### CHAPTERS ######
# Search for chapters to find every section easily:
# CINDEX - The beginning of this script
# C1 - GTK 3.20
# C2 - GKT 3.0
# C3 - Creating Theme directory
# C4 - Creating index.theme file
# C5 - Gnome-Shell
# C6 - GTK 2.0
#	   |- C6-1 - GTK 2.0 assets for default
#    |- C6-2 - GTK 2.0 assets for light
#		 |- C6-3 - GTK 2.0 assets for dark
#		 |- C6-4 - copying and cleaning
# C7 - Icon compiling (commented out, just testing)


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
original_aubergine='924D8B'
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
purple_base='924d8b' #NEW Ubuntu 20.04 Aubergine color, old was a064d8
purple_purple='5e2750'
red_base='e92020'
red_purple='742525'
yellow_base='e9ba20'
yellow_purple='746225'


#SVG Colors
#stock:
svg1_aubergine='aa5b9c' #Bright purple color from checkboxes or radio
svg2_aubergine='975187' #Dark purple color from checkboxes or radio
svg3_aubergine='773f72' #Very dark purple from text arrows or sliders
#stock colors for shell's svg files:
svg_shell_normal='924d8b'
svg_shell_bright='bb74b3'
svg_shell_dark='7c436f'

#Yaru-Colors variants:
svg1_Aqua='7ccbcc'
svg2_Aqua='41c6c8'
svg3_Aqua='25a7a8'

svg1_Blue='4da4eb'
svg2_Blue='208fe9'
svg3_Blue='1571bd'

svg1_Brown='ad7a6a'
svg2_Brown='995640'
svg3_Brown='633627'

svg1_Deepblue='485e99'
svg2_Deepblue='25469d'
svg3_Deepblue='0c2870'

svg1_Green='65c973'
svg2_Green='3eb34f'
svg3_Green='2b8238'

svg1_Grey='b8b8b8'
svg2_Grey='9c9c9c'
svg3_Grey='666666'

svg1_MATE='99c973'
svg2_MATE='78ab50'
svg3_MATE='5c853d'

svg1_Pink='fa64c6'
svg2_Pink='e920a3'
svg3_Pink='b31b7e'

svg1_Purple='a1629a'
svg2_Purple='924d8b'
svg3_Purple='5e2750'

svg1_Red='fc4949'
svg2_Red='e92020'
svg3_Red='ad1d1d'

svg1_Yellow='f5d058'
svg2_Yellow='e9ba20'
svg3_Yellow='b59222'

svg1_color=svg1_${color}
svg2_color=svg2_${color}
svg3_color=svg3_${color}

#interpres command
if [ "$color" == "Aqua" ]; then
	base_col=$aqua_base
	purple_col=$aqua_purple
	svg1_color=$svg1_Aqua
	svg2_color=$svg2_Aqua
	svg3_color=$svg3_Aqua

elif [ "$color" == "Blue" ]; then
	base_col=$blue_base
	purple_col=$blue_purple
	svg1_color=$svg1_Blue
	svg2_color=$svg2_Blue
	svg3_color=$svg3_Blue

elif [ "$color" == "Brown" ]; then
	base_col=$brown_base
	purple_col=$brown_purple
	svg1_color=$svg1_Brown
	svg2_color=$svg2_Brown
	svg3_color=$svg3_Brown

elif [ "$color" == "Deepblue" ]; then
	base_col=$deepblue_base
	purple_col=$deepblue_purple
	svg1_color=$svg1_Deepblue
	svg2_color=$svg2_Deepblue
	svg3_color=$svg3_Deepblue

elif [ "$color" == "Green" ]; then
	base_col=$green_base
	purple_col=$green_purple
	svg1_color=$svg1_Green
	svg2_color=$svg2_Green
	svg3_color=$svg3_Green

elif [ "$color" == "Grey" ]; then
	base_col=$grey_base
	purple_col=$grey_purple
	svg1_color=$svg1_Grey
	svg2_color=$svg2_Grey
	svg3_color=$svg3_Grey

elif [ "$color" == "MATE" ]; then
	base_col=$mate_base
	purple_col=$mate_purple
	svg1_color=$svg1_MATE
	svg2_color=$svg2_MATE
	svg3_color=$svg3_MATE

elif [ "$color" == "Pink" ]; then
	base_col=$pink_base
	purple_col=$pink_purple
	svg1_color=$svg1_Pink
	svg2_color=$svg2_Pink
	svg3_color=$svg3_Pink

elif [ "$color" == "Purple" ]; then
	base_col=$purple_base
	purple_col=$purple_purple
	svg1_color=$svg1_Purple
	svg2_color=$svg2_Purple
	svg3_color=$svg3_Purple

elif [ "$color" == "Red" ]; then
	base_col=$red_base
	purple_col=$red_purple
	svg1_color=$svg1_Red
	svg2_color=$svg2_Red
	svg3_color=$svg3_Red

elif [ "$color" == "Yellow" ]; then
	base_col=$yellow_base
	purple_col=$yellow_purple
	svg1_color=$svg1_Yellow
	svg2_color=$svg2_Yellow
	svg3_color=$svg3_Yellow

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


############## CHAPTER ###############
## C1 - GTK3.20 section begins here ##
######################################

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

###################
### CSS Section ###
###################
#replace the color values in _ubuntu-colors.scss
echo -e "Find and replace the color values in _ubuntu-colors.scss ..."
sed -i -e "s/E95420/$base_col/g" $source32_path/_ubuntu-colors.scss
#Obsolete purple color for <20.04 - newer below
sed -i -e "s/762572/$purple_col/g" $source32_path/_ubuntu-colors.scss
#Addition for 20.04 - new purple color is $aubergine = #924D8B!
sed -i -e "s/924D8B/$base_col/g" $source32_path/_ubuntu-colors.scss

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

###################
### SVG section ###
###################
cp $source32_path/assets.svg $source32_path/BAK_assets.svg

#changing colors in assets.svg
sed -i -e "s/$svg1_aubergine/$svg1_color/gI" $source32_path/assets.svg
sed -i -e "s/$svg2_aubergine/$svg2_color/gI" $source32_path/assets.svg
sed -i -e "s/$svg3_aubergine/$svg3_color/gI" $source32_path/assets.svg

#########################
### RENDER SVG ASSETS ###

INKSCAPE="/usr/bin/inkscape"
OPTIPNG="/usr/bin/optipng"

SRC_FILE="assets.svg"
ASSETS_DIR="assets"
INDEX="assets.txt"


for i in `cat $INDEX`
do

    echo
    echo Rendering $ASSETS_DIR/$i.png
    $INKSCAPE --export-id=$i \
              --export-id-only \
              --export-background-opacity=0 \
              --export-png=$ASSETS_DIR/$i.png $SRC_FILE >/dev/null \
	      && $OPTIPNG -o7 --quiet $ASSETS_DIR/$i.png

		echo Rendering $ASSETS_DIR/$i@2.png
		$INKSCAPE --export-id=$i \
		                  --export-dpi=180 \
		                  --export-id-only \
		                  --export-png=$ASSETS_DIR/$i@2.png $SRC_FILE >/dev/null \
			  && $OPTIPNG -o7 --quiet $ASSETS_DIR/$i.png
done

### assets done ###
mv $source32_path/BAK_assets.svg $source32_path/assets.svg

cd

######### END OF CHAPTER 1 ###########

############## CHAPTER ###############
## C2 - GTK3.00 section begins here ##
######################################

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

cp $source30_path/assets.svg $source30_path/BAK_assets.svg
#changing colors in assets.svg
sed -i -e "s/$svg1_aubergine/$svg1_color/gI" $source30_path/assets.svg
sed -i -e "s/$svg2_aubergine/$svg2_color/gI" $source30_path/assets.svg
sed -i -e "s/$svg3_aubergine/$svg3_color/gI" $source30_path/assets.svg

#########################
### RENDER SVG ASSETS ###

INKSCAPE="/usr/bin/inkscape"
OPTIPNG="/usr/bin/optipng"

SRC_FILE="assets.svg"
ASSETS_DIR="assets"
INDEX="assets.txt"


for i in `cat $INDEX`
do

    echo
    echo Rendering $ASSETS_DIR/$i.png
    $INKSCAPE --export-id=$i \
              --export-id-only \
              --export-background-opacity=0 \
              --export-png=$ASSETS_DIR/$i.png $SRC_FILE >/dev/null \
	      && $OPTIPNG -o7 --quiet $ASSETS_DIR/$i.png

				echo Rendering $ASSETS_DIR/$i@2.png
		        $INKSCAPE --export-id=$i \
		                  --export-dpi=180 \
		                  --export-id-only \
		                  --export-png=$ASSETS_DIR/$i@2.png $SRC_FILE >/dev/null \
			  && $OPTIPNG -o7 --quiet $ASSETS_DIR/$i.png
done

### assets done ###
mv $source30_path/BAK_assets.svg $source30_path/assets.svg

######### END OF CHAPTER 2 ###########

############## CHAPTER ###############
##  C3 - Creating Theme directory   ##
######################################

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

#creating css files for dark and light theme, which can be used by apps on their own settings
#settings strings as variables...
dark32_link='@import url("../../Yaru-'"$color"'-dark/gtk-3.20/gtk.css");'
light32_link='@import url("../../Yaru-'"$color"'-light/gtk-3.20/gtk.css");'
dark30_link='@import url("../../Yaru-'"$color"'-dark/gtk-3.0/gtk.css");'
light30_link='@import url("../../Yaru-'"$color"'-light/gtk-3.0/gtk.css");'
#...and echo them into the files
echo $dark32_link >> $gtk32_path/gtk-dark.css
echo $light32_link >> $gtk32_path/gtk-light.css
echo $dark30_link >> $gtk30_path/gtk-dark.css
echo $light30_link >> $gtk30_path/gtk-light.css

#link create links to the files for each flavor
cd $gtk32d_path
ln -rs ../../Yaru-$color/gtk-3.20/gtk-dark.css ./gtk-dark.css
ln -rs ../../Yaru-$color/gtk-3.20/gtk-light.css ./gtk-light.css

cd $gtk32l_path
ln -rs ../../Yaru-$color/gtk-3.20/gtk-dark.css ./gtk-dark.css
ln -rs ../../Yaru-$color/gtk-3.20/gtk-light.css ./gtk-light.css

cd $gtk30d_path
ln -rs ../../Yaru-$color/gtk-3.0/gtk-dark.css ./gtk-dark.css
ln -rs ../../Yaru-$color/gtk-3.20/gtk-light.css ./gtk-light.css

cd $gtk30l_path
ln -rs ../../Yaru-$color/gtk-3.0/gtk-dark.css ./gtk-dark.css
ln -rs ../../Yaru-$color/gtk-3.0/gtk-light.css ./gtk-light.css

cd $WORKDIR



#creating symlinks to the assets directories for each flavor
cd $gtk30l_path
ln -rs ../../Yaru-$color/gtk-3.0/assets ./assets
cd $gtk30d_path
ln -rs ../../Yaru-$color/gtk-3.0/assets ./assets

#restore the backup
mv $source32_path/BAK_ubuntu-colors.scss $source32_path/_ubuntu-colors.scss
mv $source32_path/BAK_colors.scss $source32_path/_colors.scss

cd $WORKDIR

########## END OF CHAPTER 3 ###########

############## CHAPTER ################
### C4 - Creating index.theme files ###
#######################################


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

######## END OF CHAPTER 4 ########

############ CHAPTER #############
### C5 - COMPILING SHELL THEME ###
##################################

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
#Obsolete purple color for <20.04 - newer below
sed -i -e "s/300A24/$purple_col/g" $sass_path/_ubuntu-colors.scss
#Addition for 20.04 - new purple color is $aubergine = #924D8B!
sed -i -e "s/924D8B/$base_col/g" $sass_path/_ubuntu-colors.scss

echo -e " "
echo -e "Compiling gnome-shell theme ..."

cd $source_path
input_file=gnome-shell.scss.in
cp gnome-shell.scss.in BAK-gnome-shell.scss.in
output_file_light=gnome-shell-generated-light.css
output_file_dark=gnome-shell-generated-dark.css

sed -i -e "s/@ThemeVariant@/light/g" $input_file
sassc -a $input_file $output_file_light
sed -i -e "s/light/dark/g" $input_file
sassc -a $input_file $output_file_dark
sassc $source_path/gnome-shell-high-contrast.scss $source_path/gnome-shell-high-contrast-generated.css


#Changing the stock colors in the svg files
#Following files containing the stock orange:
#checkbox-focused.svg
#checkbox-focused-dark.svg
#checkbox-off-focused.svg
#checkbox-off-focused-dark.svg

#setting svg variables
cd $source_path
#backing up original svgs
mkdir svg_backup
cp *.svg svg_backup/


echo -e "modify svg files ..."
#replacing the colors
sed -i -e "s/$svg_shell_normal/$svg2_color/gI" *.svg
sed -i -e "s/$svg_shell_bright/$svg1_color/gI" *.svg
sed -i -e "s/$svg_shell_dark/$svg3_color/gI" *.svg

echo -e " "
#copy everything
echo -e "copy files to the theme directory ..."
mv $source_path/gnome-shell-generated-light.css $shell_path/gnome-shell.css
mv $source_path/gnome-shell-generated-dark.css $shell_dark_path/gnome-shell.css
mv $source_path/gnome-shell-high-contrast-generated.css $shell_light_path/gnome-shell-high-contrast.css

#cp -R $source_path/*.css $shell_light_path
cp -R $source_path/*.svg $shell_path
cp -R $source_path/*.svg $shell_dark_path

#restoring svg backups
mv svg_backup/*.svg .
rm -rf svg_backup

#restoring _ubuntu-colors.scss
mv $sass_path/BAK_ubuntu-colors.scss $sass_path/_ubuntu-colors.scss
mv BAK_gnome-shell.scss.in gnome_shell.scss.in
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

####### END OF CHAPTER 5 ########

############ CHAPTER ############
### C6 - COMPILING GTK2 THEME ###
#################################

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
echo -e "Backing up original files ..."
mkdir $source20_path/backup
cp $source20_path/gtkrc $source20_path/backup/gtkrc
cp $source20_path/assets.svg $source20_path/backup/assets.svg
cp $source20d_path/assets.svg $source20_path/backup/assets-external.svg
cp -R $source20_path/assets $source20_path/backup/assets

mkdir $source20l_path/backup
cp $source20l_path/gtkrc $source20l_path/backup/gtkrc
cp $source20l_path/assets.svg $source20l_path/backup/assets.svg
cp $source20d_path/assets.svg $source20l_path/backup/assets-external.svg
cp -R $source20l_path/assets $source20l_path/backup/assets

mkdir $source20d_path/backup
cp $source20d_path/gtkrc $source20d_path/backup/gtkrc
cp $source20d_path/assets.svg $source20d_path/backup/assets.svg
cp $source20d_path/assets.svg $source20d_path/backup/assets-external.svg
cp -R $source20d_path/assets $source20d_path/backup/assets

#cheking if backup worked, if not, exit.
if [ ! -d "$source20_path/backup" ] || [ ! -d "$source20l_path/backup" ] || [ ! -d "$source20d_path/backup" ]
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
## New with 20.04: New colors were added to source, I didn't create new ones for this. Here's a list:
## ORANGE TONES:
## very bright: f6b6a0, bright: fea691, normal: e55730, dark: c34113
## PURPLE TONES:
## normal: 975187, dark: 924d8b
## Different colors for dark (I'm still using my default colors):
## ORANGE TONES:
## very bright: b56d54, also very bright: bf6a5f, bright: bf6a57, normal: e55730, dark: c34113
## PURPLE TONES:
## normal: 7c436f, dark: 924d8b, very dark: 64385a
## And also some different colors in assets-external.svg:
## very dark purple: 64385a, dark blue: 14375d, brighter blue: 3e7aba
##
## ... this is why I gave up variables for this section...sorry

sed -i -e "s/e55730/$base_col/g" $source20_path/assets.svg
sed -i -e "s/c34113/$svg3_color/g" $source20_path/assets.svg
sed -i -e "s/fea691/$svg1_color/g" $source20_path/assets.svg
sed -i -e "s/f6b6a0/$svg1_color/g" $source20_path/assets.svg
sed -i -e "s/975187/$svg2_color/g" $source20_path/assets.svg
sed -i -e "s/924d8b/$svg3_color/g" $source20_path/assets.svg
sed -i -e "s/e55730/$base_col/g" $source20l_path/assets.svg
sed -i -e "s/c34113/$svg3_color/g" $source20l_path/assets.svg
sed -i -e "s/fea691/$svg1_color/g" $source20l_path/assets.svg
sed -i -e "s/f6b6a0/$svg1_color/g" $source20l_path/assets.svg
sed -i -e "s/975187/$svg2_color/g" $source20l_path/assets.svg
sed -i -e "s/924d8b/$svg3_color/g" $source20l_path/assets.svg
sed -i -e "s/e55730/$base_col/g" $source20d_path/assets.svg
sed -i -e "s/c34113/$svg3_color/g" $source20d_path/assets.svg
sed -i -e "s/bf6a57/$svg1_color/g" $source20d_path/assets.svg
sed -i -e "s/bf6a5f/$svg1_color/g" $source20d_path/assets.svg
sed -i -e "s/b56d54/$svg1_color/g" $source20d_path/assets.svg
sed -i -e "s/7c436f/$svg2_color/g" $source20d_path/assets.svg
sed -i -e "s/924d8b/$svg3_color/g" $source20d_path/assets.svg

echo -e "Seach and replace the original colors in all three assets_-xternal.svg files ..."
sed -i -e "s/$svg1_aubergine/$svg1_color/gI" $source20_path/assets-external.svg
sed -i -e "s/$svg2_aubergine/$svg2_color/gI" $source20_path/assets-external.svg
sed -i -e "s/$svg3_aubergine/$svg3_color/gI" $source20_path/assets-external.svg
sed -i -e "s/$svg1_aubergine/$svg1_color/gI" $source20l_path/assets-external.svg
sed -i -e "s/$svg2_aubergine/$svg2_color/gI" $source20l_path/assets-external.svg
sed -i -e "s/$svg3_aubergine/$svg3_color/gI" $source20l_path/assets-external.svg
sed -i -e "s/$svg1_aubergine/$svg1_color/gI" $source20d_path/assets-external.svg
sed -i -e "s/7c436f/$svg2_color/gI" $source20d_path/assets-external.svg
sed -i -e "s/64385a/$svg3_color/gI" $source20d_path/assets-external.svg
sed -i -e "s/3e7aba/$svg2_color/gI" $source20d_path/assets-external.svg
sed -i -e "s/14375d/$svg3_color/gI" $source20d_path/assets-external.svg


echo -e " "
echo -e "Rendering assets (this may take a bit) ..."


############ SUB-CHAPTER ##############
## C6-1 - GTK 2.0 assets for default ##
#######################################

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

rm -rf assets/*
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


########### SUB-CHAPTER #############
## C6-2 - GTK 2.0 assets for light ##
#####################################

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

rm -rf assets/*
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


########### SUB-CHAPTER ############
## C6-3 - GTK 2.0 assets for dark ##
####################################

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

rm -rf assets/*
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

############ SUB-CHAPTER ##############
## C6-4 - copying and cleaning ##
#######################################

#Copy everything
cp -R $source20_path/assets $gtk20_path
cp $source20_path/backup/assets/scrollbar-arrow*.png $gtk20_path/assets
cp $source20_path/*.rc $gtk20_path
cp -R $source20l_path/assets $gtk20l_path
cp $source20l_path/backup/assets/scrollbar-arrow*.png $gtk20l_path/assets
cp $source20l_path/*.rc $gtk20l_path
cp -R $source20d_path/assets $gtk20d_path
cp $source20d_path/backup/assets/scrollbar-arrow*.png $gtk20d_path/assets
cp $source20d_path/*.rc $gtk20d_path
cp $source20_path/gtkrc $gtk20_path
cp $source20l_path/gtkrc $gtk20l_path
cp $source20d_path/gtkrc $gtk20d_path
cp $source20d_path/assets.svg $source20d_path/backup/assets.svg



#Restore backup
rm -rf $source20_path/gtkrc
rm -rf $source20_path/assets.svg
rm -rf $source20_path/assets-external.svg
rm -rf $source20_path/assets
sleep 1
cp -R $source20_path/backup/* $source20_path/
sleep 1
rm -rf $source20_path/backup

rm -rf $source20l_path/gtkrc
rm -rf $source20l_path/assets.svg
rm -rf $source20l_path/assets-external.svg
rm -rf $source20l_path/assets
sleep 1
cp -R $source20l_path/backup/* $source20l_path/
sleep 1
rm -rf $source20l_path/backup

rm -rf $source20d_path/gtkrc
rm -rf $source20d_path/assets.svg
rm -rf $source20d_path/assets-external.svg
rm -rf $source20d_path/assets
sleep 1
cp -R $source20d_path/backup/* $source20d_path/
sleep 1
rm -rf $source20d_path/backup


cd $WORKDIR

echo -e "Done"

comp_gtk2="false"
done

### END OF CHAPTER 6 ###

######## CHAPTER ########
## C7 - Icon compiling ##
#########################

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
