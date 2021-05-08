#!/bin/bash
#set -x
#Install script for Yaru-Blue Theme by Jannomag
clear # clear the termainl
RCol='\e[0m'    # Text Reset

#options for creating snap package
snap=false
snapicons_install=false
snapthemes_install=false
path=$2
while [ ! -z "$1" ]; do
  case "$1" in
    --snapicons|-si)
      icon_dir="$path"
      snapicons_install=true
      break
      ;;
    --snapthemes|-st)
      theme_dir="$path"
      snapthemes_install=true
      break
      ;;
  esac
done

# Regular           Bold                Underline           High Intensity      BoldHigh Intens     Background          High Intensity Backgrounds
Bla='\e[0;30m';     BBla='\e[1;30m';    UBla='\e[4;30m';    IBla='\e[0;90m';    BIBla='\e[1;90m';   On_Bla='\e[40m';    On_IBla='\e[0;100m';
Red='\e[0;31m';     BRed='\e[1;31m';    URed='\e[4;31m';    IRed='\e[0;91m';    BIRed='\e[1;91m';   On_Red='\e[41m';    On_IRed='\e[0;101m';
Gre='\e[0;32m';     BGre='\e[1;32m';    UGre='\e[4;32m';    IGre='\e[0;92m';    BIGre='\e[1;92m';   On_Gre='\e[42m';    On_IGre='\e[0;102m';
Yel='\e[0;33m';     BYel='\e[1;33m';    UYel='\e[4;33m';    IYel='\e[0;93m';    BIYel='\e[1;93m';   On_Yel='\e[43m';    On_IYel='\e[0;103m';
Blu='\e[0;34m';     BBlu='\e[1;34m';    UBlu='\e[4;34m';    IBlu='\e[0;94m';    BIBlu='\e[1;94m';   On_Blu='\e[44m';    On_IBlu='\e[0;104m';
Pur='\e[0;35m';     BPur='\e[1;35m';    UPur='\e[4;35m';    IPur='\e[0;95m';    BIPur='\e[1;95m';   On_Pur='\e[45m';    On_IPur='\e[0;105m';
Cya='\e[0;36m';     BCya='\e[1;36m';    UCya='\e[4;36m';    ICya='\e[0;96m';    BICya='\e[1;96m';   On_Cya='\e[46m';    On_ICya='\e[0;106m';
Whi='\e[0;37m';     BWhi='\e[1;37m';    UWhi='\e[4;37m';    IWhi='\e[0;97m';    BIWhi='\e[1;97m';   On_Whi='\e[47m';    On_IWhi='\e[0;107m';

###############
## Snap area ##
###############
# if snap argument was set ignore the rest of the script, just do the important stuff
if [ "$snapicons_install" == "true" ]; then
  icon_source="./Icons/"
  cp -R $icon_source/* $icon_dir
  exit
fi
if [ "$snapthemes_install" == "true" ]; then
  themes_source="./Themes"
  cp -R $themes_source/* $theme_dir
  exit
fi


  echo -e "${BWhi}        db    db  .d8b.  d8888b. db    db                 ";
  echo -e "        \`8b  d8' d8' \`8b 88  \`8D 88    88                 ";
  echo -e "         \`8bd8'  88ooo88 88oobY' 88    88                 ";
  echo -e "           88    88~~~88 88\`8b   88    88                 ";
  echo -e "           88    88   88 88 \`88. 88b  d88                 ";
  echo -e "           YP    YP   YP 88   YD ~Y8888P'                 ";

  echo -e "${BBlu} .o88b. ${BYel} .d88b.  ${BPur}88       ${BCya}.d88b.  ${BGre}d8888b. ${BRed}.d8888. ";
  echo -e "${BBlu}d8P  Y8 ${BYel}.8P  Y8. ${BPur}88     ${BCya} .8P  Y8.${BGre} 88  \`8D ${BRed}88'  YP ";
  echo -e "${BBlu}8P      ${BYel}88    88 ${BPur}88     ${BCya} 88    88${BGre} 88oobY' ${BRed}\`8bo.   ";
  echo -e "${BBlu}8b      ${BYel}88    88 ${BPur}88     ${BCya} 88    88${BGre} 88\`8b     ${BRed}\`Y8b. ";
  echo -e "${BBlu}Y8b  d8 ${BYel}\`8b  d8'${BPur} 88booo.${BCya} \`8b  d8'${BGre} 88 \`88. ${BRed}db   8D ";
  echo -e "${BBlu} \`Y88P'${BYel}  \`Y88P'${BPur}  Y88888P${BCya}  \`Y88P'${BGre}  88   YD ${BRed}\`8888Y' ";
  echo -e "                                                  ";
  VERSION=$(grep -F 'Version' ./README.md | egrep -o "([0-9]{1,}\.)+[0-9]{1,}") # Extracting version from readme.me so I just have to change it there.
  echo -e "Version $VERSION                                             ";
  echo -e "${RCol}"



#Intro

  echo -e "${RCol}"
  echo -e "${BBlu}WELCOME FRIEND!${RCol}"
  echo -e "${BBlu}This script will guide you through the installation of this theme.${RCol}"
  echo -e ""
  echo -e "${BYel}Press any key to start the installer or CTRL-C to quit at any time...${RCol}"
  read -n 1 # wait for user input "any key"
  clear # clear terminmal again
  echo -e "${BWhi}##########----------      NOTE      ----------##########"
  echo -e "# THIS THEME IS JUST A FORK OF THE ORIGINAL YARU THEME #"
  echo -e "# I MODIFIED THE COLORS AND SOME IMAGES / SVG GRAPHICS #"
  echo -e "# THE ORIGINAL CREDITS FOR THIS GREAT WORK GO TO THE   #"
  echo -e "# UBUNTU DEVELOPER TEAM!                               #"
  echo -e "# ---------------------------------------------------- #"
  echo -e "# FEEL FREE TO MODIFY MY FORK                          #"
  echo -e "# ---------------------------------------------------- #"
  echo -e "# MY E-MAIL FOR SUGGESTIONS:       jannomag@gmail.com  #"
  echo -e "# ---------------------------------------------------- #"
  echo -e "# THIS THEMES WERE RELEASED BY ME IN APRIL 2019        #"
  echo -e "# ON gnome-looks.org                                   #"
  echo -e "##########----------      NOTE      ----------##########"
  echo -e ""


#getting home directory
homedir=$( getent passwd "$USER" | cut -d: -f6 )
username=$( getent passwd "$USER" | cut -d: -f1 )

#Check if root
if [[ "$EUID" -ne 0 ]]; then
  isroot="false"
	theme_install_dir="$homedir/.local/share/themes"
	icon_install_dir="$homedir/.local/share/icons"
	echo -e "${BGre}You ran this script as normal user, default install path is set to\n'$theme_install_dir' and '$icon_install_dir'\nwhich can also be changed later!${RCol}"
	sleep 0.5
else
  isroot="true"
	homedir=$( getent passwd "$SUDO_USER" | cut -d: -f6 )
	theme_install_dir="/usr/share/themes"
	icon_install_dir="/usr/share/icons"
	echo -e "${BRed}You ran this script as root, default install path is set to\n'$theme_install_dir' and '$icon_install_dir' which can also be changed later!${RCol}"
fi

#Determine user name for later
RUID=$(who | awk 'FNR == 1 {print $1}')
RUSER_UID=$(id -u ${RUID})





####################
#                  #
# Function section #
#                  #
####################

#### Function for package color selection
package_color_menu () {
  select package_color in "${@}"; do
    if [ 1 -le "$REPLY" ] && [ "$REPLY" -le $(($#)) ]; then
      echo -e "${Yel}Okay, '$package_color' is set!${RCol}"
      break;
    else
      echo -e "${Yel}Incorrect input, please enter a number from the list!${RCol}"
    fi
  done
}

#### Function for icon color selection
icon_color_menu () {
  select icon_color in "${@}"; do
    if [ 1 -le "$REPLY" ] && [ "$REPLY" -le $(($#)) ]; then
      echo -e "${Yel}Okay, '$icon_color' is set for the icons!${RCol}"
      break;
    else
      echo -e "${Yel}Incorrect input, please enter a number from the list!${RCol}"
    fi
  done
}

### Those functions will create selection menus with all the colors from the array "colors". I can use them as often as I want, I just need to remap the output variables. I've created two menus to have a better overview.

###################
#                 #
# PICKING SECTION #
#                 #
###################
#
# In this section the script will ask what it should install
#

# setting variables for the first while loop.
  picking=true
  install=false
  enable=false
  package_install=false
  color=none


# The color array - THIS revolutionized my old script...I can add colors as much as I want, if they're present as themes...nice
colors=(Amber Aqua Aubergine Blue Brown Cinnamon Deepblue Green Grey Lavender MATE Pink Purple Orange Red Teal Yellow)



echo -e ""
echo -e "${Yel}Let me ask you some questions...${RCol}"

while [ "$picking" == "true" ] && [ "$install" == "false" ] # Starting the while loop for the installation process
do
  echo -e "${BYel}Do you want to install the complete package?${RCol}"
  echo -e "${Yel}This contains all themes, icons and cursors for every color.${RCol}"
  select ask_install_type in yes no # asking if the whole package should be installed, set the variable "package_install" with the answer.
  do
    case $ask_install_type in
      yes)
        package_install=true
        break
        ;;
      no)
        package_install=false
        break
        ;;
      *)
        echo -e "${Yel}Please choose 1 or 2.${RCol}"
        ;;
    esac
  done

  if [ "$package_install" == "false" ]; then # If the user DON'T want to install everything...
    echo -e "${BYel}Okay, which color do you want to install?${RCol}" # Ask the user which color should be installed...
    package_color_menu "${colors[@]}" # calling my function
    main_color_set=true
    install_theme=true

    echo -e "${BYel}Do you want to install an icon pack, if yes, maybe a different color?${RCol}"
    select ask_install_icons in yes different no  # Ask the user if an icon pack should be installed and set the variables with the users answer
    do
      case $ask_install_icons in
        yes)
          install_icons=true
          icon_color=$package_color
          change_icon_color=false
          break ;;
        different)
          install_icons=true
          change_icon_color=true
          break ;;
        no)
          install_icons=false
          break ;;
        *)
          echo -e "${Yel}Wrong input, please enter a number from the list above...${RCol}"
          ;;
        esac
    done

    if [ "$install_icons" == "true" ] && [ "$change_icon_color" == "true" ]; then # If the user want's to install an icon pack...
      echo -e "${BYel}Which color do you want to install for your icons?${RCol}"
      icon_color_menu "${colors[@]}" # call the color menu function
    fi
  fi ## Closing the "package or not package" IF

# Creating a summary of things to do
    echo -e ""
    echo -e "${BYel}Okay, that should be enough for now...${RCol}"
    echo -e "${Yel}I'll do following for you:${RCol}"

    if [ "$package_install" == "true" ]; then # If the whole packages should be installed...
      echo -e "${BGre} - Install the complete package${RCol}"
      echo -e "${Gre}   Which includes the themes, icons and cursors of every color.${RCol}"
    fi

    if [ "$package_install" == "false" ]; then # If just a single theme should be installed...
      echo -e "${BGre} - Install Yaru-$package_color theme.${RCol}"
      if [ "$install_icons" == "true" ] && [ "$change_icon_color" == "true" ]; then # If a different icon pack than the selected color should be installed...
        echo -e "${BGre} - Install Yaru-$icon_color icons.${RCol}"
      elif [ "$install_icons" == "true" ] && [ "$change_icon_color" == "false" ]; then # If the icon pack should've the same color as the theme...
        echo -e "${BGre} - Install Yaru-$icon_color icons.${RCol}"
      else
        echo -e "${BGre} - DON'T install any icons.${RCol}" # Or don't install any icons...
      fi
    fi

    echo -e "${BYel}Is this correct?${RCol}"

    select ask_list_correct in yes no # Asking the user if this summary is correct, set the variables with the answer
    do
      case $ask_list_correct in
        yes)
          echo -e "${Yel}Great! I'll do it!${RCol}"
          start_install=true
          break ;;
        no)
          echo -e "${Yel}Okay...Let's start over...${RCol}"
          echo -e ""
          echo -e ""
          echo -e ""
          start_install=false
          startover=true
          break ;;
        *)
          echo -e "${BYel}Incorrect answer!${RCol}"
          ;;
        esac
      done

  if [ "$start_install" == "true" ]; then # If the answer was "yes", the following variables will be set to break the current loop and start the next while loop.
    picking=false
    install=true
    install_done=false
  fi

done


######################
#                    #
# INSTALLING SECTION #
#                    #
######################
#
# In this section the files will be installed
#

while [ "$picking" == "false" ] && [ "$install" == "true" ] && [ "$install_done" == "false" ]; do # so the while loop begins...

  # setting path variables for normal users
  themes_source="./Themes/"
  icon_source="./Icons/"
  theme_dir_def="$homedir/.local/share/themes/"
  icon_dir_def="$homedir/.local/share/icons/"

  # and also for the snobs with root privileges
  if [ "$isroot" == "true" ]; then
    echo -e "${BRed}Root privileges detected!${RCol}"
    echo -e "${Yel}This isn't a problem, I just wanted you to tell this...${RCol}"
    theme_dir_def="/usr/share/themes"
    icon_dir_def="/usr/share/icons"
  fi

  echo -e ""
  echo -e "${BYel}Where do you want to install the themes?${RCol}"
  echo -e ""
  echo -e "${BYel}Please enter your theme path [$theme_dir_def]: ${RCol}" && read -e theme_dir # asking for the path, if nothing is entered by the user 'theme_dir_def' will be used - new variable: 'theme_dir'
  theme_dir="${theme_dir:-$theme_dir_def}"
  if [[ ! -d "$theme_dir" ]]; then # and if this directory doesn't exists, create it.
		echo -e "${Yel}$theme_dir doesn't exist, creating now${RCol}"
		mkdir -p $theme_dir
	fi
  echo -e "${BYel}Please enter your icon path [$icon_dir_def]: ${RCol}" && read -e icon_dir # asking for the path, if nothing is entered by the user 'icon_dir_def' will be used - new variable: 'icon_dir'
  icon_dir="${icon_dir:-$icon_dir_def}"
  if [[ ! -d "$icon_dir" ]]; then # and if this directory doesn't exists, create it.
    echo -e "${Yel}$icon_dir doesn't exist, creating now${RCol}"
    mkdir -p $icon_dir
  fi

  # as the echo says, copy the files
  echo -e "${BYel}Copying files...${RCol}"
  if [ "$package_install" == "true" ]; then # just copy everything from both directories if the whole package was installed
    cp -R $themes_source/* $theme_dir
    cp -R $icon_source/* $icon_dir
    if [ "$icon_dir" == "$homedir/.local/share/icons/" ]; then # if .local/share/icons was set as directory, link the icon directories to .icons as well to prevent bugs I notied in Ubuntu 20.10 (cursors not working)
      mkdir -p $homedir/.icons
      ln -sf $icon_dir/Yaru-* $homedir/.icons
    fi
  fi
  if [ "$package_install" == "false" ]; then # and if the user just wanted one color, just copy this specific one using 'package_color' and 'icon_color' - you remember? The functions above
    cp -R $themes_source/Yaru-$package_color* $theme_dir/
    cp -R $icon_source/Yaru-$icon_color $icon_dir/
    if [ "$icon_dir" == "$homedir/.local/share/icons/" ]; then # if .local/share/icons was set as directory, link the icon directories to .icons as well to prevent bugs I notied in Ubuntu 20.10 (cursors not working)
      mkdir -p $homedir/.icons
      ln -sf $icon_dir/Yaru-* $homedir/.icons
    fi
  fi
  echo -e "${BYel}Done!${RCol}"
  echo -e ""

  echo -e "${BYel}Do you want to enable themes, icons and other stuff?${RCol}"
  select ask_enable in yes no # asking if the user wants to enable themes, icons and shit. If yes, set variables for the next while loop, if not, set them so the next while loop won't start.
  do
    case $ask_enable in
      yes)
          enable=true
          install_done=true
          install=false
          picking=false
          break ;;
      no)
          echo -e "${Gre}Okay, that's fine. We're done!${RCol}"
          install_done=true
          install=false
          picking=false
          enable=false
          exit
          break ;;
      *)
          echo -e "${Red}Wrong input!${RCol}"
          ;;
        esac
      done

done

####################
#                  #
# Enabling section #
#                  #
####################
#
# In this section, the script will ask the user if he/she/it wants to enable parts of Yaru-Colors.
# This happens in a while loop just like the other parts before...
#
while [ "$install" == false ] && [ "$picking" == "false" ] && [ "$enable" == "true" ]; do
  echo -e ""

  ### Theme questions
  if [ "$package_install" == "true" ]; then
    echo -e "${BYel}Do you want to enable a theme, if yes, which variant?${RCol}" # Ask for "a" theme if the complete package was installed
  else
    echo -e "${BYel}Do you want to enable the theme if yes, which variant?${RCol}" # Ask for "the" theme if just one was installed
  fi
  # Asking for yes / no just as usual to set the enable_theme variable
  select ask_enable_theme in light normal dark no
  do
    case $ask_enable_theme in
      light)
        enable_theme=true
        theme_variant=-light # this will be added so variants are now a thing here with this script...such wow!
        break ;;
      normal)
        enable_theme=true
        theme_variant=
        break ;;
      dark)
        enable_theme=true
        theme_variant=-dark
        break ;;
      no)
        enable_theme=false
        break ;;
      *)
        echo -e "${Red}Wrong input!${RCol}"
        ;;
    esac
  done

  if [ "$enable_theme" == "true" ] && [ "$package_install" == "true" ]; then # Ask for color if a theme should be enabled and the whole package was installed
    echo -e "${BYel}Okay, which color should it be?${RCol}"
    package_color_menu "${colors[@]}" # Just using the function from the top of this script to make it short
    enable_theme_color=$package_color # Remap the variable for reusing the original variable later
    theme_color_set=true # Setting a new variable to check if color was chosen or not
  fi
  ### Theme done

  ### Shell questions
  echo -e ""
  if [ ! -d $homedir/.local/share/gnome-shell/extensions/user-theme* ]; then # checking if the user-themes extension of gnome-shell is enabled, it's needed to be able to set a different gnome-shell theme (why, though?)
    echo -e "${Red}I just wanted to ask you if I should enable a gnome-shell theme...\nBut the user-themes extension is not installed.\nPlease install it to be able to set a gnome-shell theme.${RCol}" #...and if not, just tell this to the user
    echo -e "${Red}You can get this by using 'apt install gnome-shell-extensions'\nor here: https://extensions.gnome.org/extension/19/user-themes/"
  else
    echo -e "${Gre}Detected user-themes extension!${RCol}"
    if [ "$package_install" == "true" ]; then
      echo -e "${BYel}Do you want to enable a shell theme if yes, which variant?${RCol}" # Ask for "a" shell theme if the complete package was installed
    else
      echo -e "${BYel}Do you want to enable the shell theme if yes, which variant?${RCol}" # Ask for "the" shell theme if just one was installed
    fi
    # Just the same as before...
    select ask_enable_shell in light dark no
    do
      case $ask_enable_shell in
        light)
          enable_shell=true
          shell_variant=-light
          break ;;
        dark)
          enable_shell=true
          shell_variant=-dark
          break ;;
        no)
          enable_shell=false
          break ;;
        *)
          echo -e "${Red}Wrong input!${RCol}"
          ;;
      esac
    done
    if [ "$enable_shell" == "true" ] && [ "$package_install" == "true" ]; then # Ask for color if a shell theme should be enabled and the whole package was installed
      echo -e "${BYel}Which shell color do you want to enable?${RCol}"
      package_color_menu "${colors[@]}" # Just using the function from the top of this script to make it short
      enable_shell_color=$package_color # Remap the variable for reusing the original variable later
      shell_color_set=true # Setting a new variable to check if color was chosen or not
    fi
  fi
  # ask for enabling the gdm3 compatibility - this will work on Ubuntu only, because every distro may use it's own gnome-shell theme resources.
  # For non Ubuntu-Distros: Please install it manually, check the readme!
  if [ "$enable_shell" == "true" ] && [ -d "/usr/share/gnome-shell/theme/Yaru" ]; then
    echo -e "${BYel}Do you want to enable the GDM3 theme (root required!)?${RCol}"
    select ask_enable_gdm3 in yes no
    do
      case $ask_enable_gdm3 in
        yes)
          enable_gdm3=true
          break ;;
        no)
          enable_gdm3=false
          break ;;
        *)
          echo -e "${Red}Wrong input!${RCol}"
          ;;
      esac
    done
  fi

  ### Shell done

  ### Icons questions
  echo -e ""
  if [ "$package_install" == "true" ]; then
    echo -e "${BYel}Do you want to enable an icon pack?${RCol}" # Ask for "an" icon pack if the complete package was installed
  else
    echo -e "${BYel}Do you want to enable the icon pack?${RCol}" # Ask for "the" icon if just one was installed
  fi
  # aaand again...
  select ask_enable_icons in yes no
  do
    case $ask_enable_icons in
      yes)
        enable_icons=true
        break ;;
      no)
        enable_icons=false
        break ;;
      *)
        echo -e "${Red}Wrong input!${RCol}"
        ;;
    esac
  done
  if [ "$enable_icons" == "true" ] && [ "$package_install" == "true" ]; then # Ask for color if an icon pack should be enabled and the whole package was installed
    echo -e "${BYel}Which icon color do you want to enable?${RCol}"
    icon_color_menu "${colors[@]}" # Just using the function from the top of this script to make it short
    enable_icon_color=$icon_color # Remap the variable for reusing the original variable later
    icon_color_set=true # Setting a new variable to check if color was chosen or not
  fi
  ### Icons done

  ### Cursor questions
  echo -e ""
  if [ "$package_install" == "true" ]; then
    echo -e "${BYel}Do you want to enable a cursor theme?${RCol}" # Ask for "a" cursor theme if the complete package was installed
  else
    echo -e "${BYel}Do you want to enable the cursor theme?${RCol}" # Ask for "the" cursor theme if just one was installed
  fi
  # Again, the same procedure as before
  select ask_enable_cursor in yes no
  do
    case $ask_enable_cursor in
      yes)
        enable_cursor=true
        break ;;
      no)
        enable_cursor=false
        break ;;
      *)
        echo -e "${Red}Wrong input!${RCol}"
        ;;
    esac
  done
  if [ "$enable_cursor" == "true" ]  && [ "$package_install" == "true" ]; then # Ask for color if a cursor theme should be enabled and the whole package was installed
    echo -e "${BYel}Which cursor theme do you want to enable?${RCol}"
    icon_color_menu "${colors[@]}" # Just using the function from the top of this script to make it short
    enable_cursor_color=$icon_color # Remap the variable for reusing the original variable later
    cursor_color_set=true # Setting a new variable to check if color was chosen or not
  fi
  ### Cursor done

  ### Dock questions
  echo -e ""
  if [ -d /usr/share/gnome-shell/extensions/ubuntu-dock@ubuntu.com ]; then # check if ubuntu dock is installed
    if [ "$package_install" == "true" ]; then
      echo -e "${BYel}Do you want to set a dock indicator color?${RCol}" # Ask for "a" cursor theme if the complete package was installed
    else
      echo -e "${BYel}Do you want to set the dock indicator?${RCol}" # Ask for "the" cursor theme if just one was installed
    fi
    # last but not least...the same procedure as before
    select ask_enable_dock in yes no
    do
      case $ask_enable_dock in
        yes)
          enable_dock=true
          break ;;
        no)
          enable_dock=false
          break ;;
        *)
          echo -e "${Red}Wrong input!${RCol}"
          ;;
      esac
    done
    if [ "$enable_dock" == "true" ]  && [ "$package_install" == "true" ]; then # Ask for color if a cursor theme should be enabled and the whole package was installed
      echo -e "${BYel}Which color do you want for the dock indicators?${RCol}"
      icon_color_menu "${colors[@]}" # Just using the function from the top of this script to make it short
      enable_dock_color=$icon_color # Remap the variable for reusing the original variable later
      dock_color_set=true # Setting a new variable to check if color was chosen or not
    elif [ "$package_install" == "false" ]; then
      enable_dock_color=$package_color
    fi
  fi
  ### Dock done

  ### Summary of what this script will do, just for visualization
  echo -e "${Yel}Okay, I'll do following for you:\n${RCol}"
  # Theme part:
  if [ "$theme_color_set" == "true" ]; then # If package was installed and user selected a color...
    echo -e "${BGre} - ENABLE Yaru-$enable_theme_color$theme_variant (user selected) GTK theme${RCol}"
  elif [ "$enable_theme" == "true" ]; then # If package was not installed theres just one color defined with $package_color ...
    echo -e "${BGre} - ENABLE Yaru-$package_color$theme_variant GTK theme${RCol}"
  elif [ "$enable_theme" == "false" ]; then # If the user don't want to enable a theme
    echo -e "${BRed} - NOT changing GTK theme${RCol}"
  fi

  # Shell part:
  if [ "$shell_color_set" == "true" ]; then # If package was installed and user selected a color...
    echo -e "${BGre} - ENABLE Yaru-$enable_shell_color$shell_variant (user selected) SHELL theme${RCol}"
  elif [ "$enable_shell" == "true" ]; then # If package was not installed theres just one color defined with $package_color ...
    echo -e "${BGre} - ENABLE Yaru-$package_color$shell_variant SHELL theme${RCol}"
  elif [ "$enable_shell" == "false" ]; then # If the user don't want to enable a shell theme
    echo -e "${BRed} - NOT changing SHELL theme${RCol}"
  fi
  if [ "$enable_gdm3" == "true" ]; then
    if [ "$shell_color_set" == "true" ]; then
      echo -e "${BGre} - ENABLE Yaru-$enable_shell_color (user selected) GDM3 compatibility${RCol}"
    elif [ "$enable_shell" == "true" ]; then
      echo -e "${BGre} - ENABLE Yaru-$package_color GDM3 compatibility${RCol}"
    fi
  fi

  # Icon part:
  if [ "$icon_color_set" == "true" ]; then # If package was installed and user selected a color...
    echo -e "${BGre} - ENABLE Yaru-$enable_icon_color (user selected) icon pack${RCol}"
  elif [ "$enable_icons" == "true" ]; then # If package was not installed theres just one color defined with $package_color ...
    echo -e "${BGre} - ENABLE Yaru-$package_color icon pack${RCol}"
  elif [ "$enable_icons" == "false" ]; then # If the user don't want to enable an icon pack
    echo -e "${BRed} - NOT changing icons${RCol}"
  fi

  # Cursor part:
  if [ "$cursor_color_set" == "true" ]; then # If package was installed and user selected a color...
    echo -e "${BGre} - ENABLE Yaru-$enable_cursor_color (user selected) cursor theme${RCol}"
  elif [ "$enable_cursor" == "true" ]; then # If package was not installed theres just one color defined with $package_color ...
    echo -e "${BGre} - ENABLE Yaru-$package_color cursor theme${RCol}"
  elif [ "$enable_cursor" == "false" ]; then # If the user don't want to enable a theme
    echo -e "${BRed} - NOT changing cursors${RCol}"
  fi

  # Dock part:
  if [ "$dock_color_set" == "true" ]; then # If package was installed and user selected a color...
    echo -e "${BGre} - ENABLE Yaru-$enable_dock_color (user selected) for the dock indicators${RCol}"
  elif [ "$enable_dock" == "true" ]; then # If package was not installed theres just one color defined with $package_color ...
    echo -e "${BGre} - ENABLE Yaru-$package_color for the dock indicators${RCol}"
  elif [ "$enable_dock" == "false" ]; then # If the user don't want to enable a theme
    echo -e "${BRed} - NOT changing dock indicators${RCol}"
  fi

  echo -e ""
  echo -e "${BYel}Is this summary correct?${RCol}"
  select ask_summary in yes no
  do
    case $ask_summary in
      yes)
        execute_tasks=true
        break ;;
      no)
        execute_tasks=false
        break ;;
      *)
        echo -e "${Red}Wrong input!${RCol}"
        ;;
    esac
  done

  if [ "$execute_tasks" == "true" ]; then
    enable=false
    execute=true
  fi
done

### Execute the things the user wants...
# Again in a while loop
while [ "$execute" == "true" ]; do
  # It's the same as above, but with the actual commands
  # Theme part:
  if [ "$theme_color_set" == "true" ]; then # If package was installed and user selected a color...
    sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.desktop.interface gtk-theme "Yaru-$enable_theme_color$theme_variant" 2> /dev/null
  elif [ "$enable_theme" == "true" ]; then # If package was not installed theres just one color defined with $package_color ...
    sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.desktop.interface gtk-theme "Yaru-$package_color$theme_variant" 2> /dev/null
  fi

  # Shell part:
  if [ "$shell_color_set" == "true" ]; then # If package was installed and user selected a color...
  # This is a bit complicated due an old bug in user-themes extensions where there's no schema set in the shell-theme settings. I'll added the fix to this script to make it as easy as possible.
  sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.shell.extensions.user-theme name "Yaru-$enable_shell_color$shell_variant"
    if [ ! "$?" -eq "0" ]; then # so, if the above command to change the shell theme doesn't work, ask if the script should fix this.
      echo -e "${BRed}ERROR, this is caused by an old bug in the extension.\nDon't worry! I can fix it, but I need root privileges.${RCol}"
      echo -e "${BRed}Is this okay for you? Take a look in the readme learn more.${RCol}"
      select shell_error_fix in yes no
      do
        case $shell_error_fix in
          yes)
            echo -e "${Yel}Okay, I'll fix this.${RCol}"
            echo -e "${Yel}Please enter your passwort if asked.${RCol}"
            # I've got this fix from here: https://gist.github.com/atiensivu/fcc3183e9a6fd74ec1a283e3b9ad05f0 - it puts the missing file from ~ to the glib-2.0 directory and re-compiles the glib schemas
            sudo cp $HOME/.local/share/gnome-shell/extensions/user-theme@gnome-shell-extensions.gcampax.github.com/schemas/org.gnome.shell.extensions.user-theme.gschema.xml /usr/share/glib-2.0/schemas && sudo glib-compile-schemas /usr/share/glib-2.0/schemas
            break ;;
          no)
            echo -e "${Yel}Okay, skipping shell theme. Please read the readme for this!${RCol}"
            enable_shell=false
            break ;;
          *)
            echo -e "${Red}Wrong input!${RCol}"
            ;;
        esac
      done
    fi
    if [ "$enable_gdm3" == "true" ]; then
      sudo cp /usr/share/gnome-shell/theme/Yaru/gnome-shell-theme.gresource /usr/share/gnome-shell/theme/Yaru/gnome-shell-theme.gresource.bakup_yarucolors
      sudo cp $theme_dir/Yaru-$enable_shell_color/gnome-shell/*.gresource /usr/share/gnome-shell/theme/Yaru/gnome-shell-theme.gresource
      sudo update-alternatives --set gdm3-theme.gresource /usr/share/gnome-shell/theme/Yaru/gnome-shell-theme.gresource
    fi
  elif [ "$enable_shell" == "true" ]; then # If package was not installed theres just one color defined with $package_color ...
  # And the same as above, including the fix.
  sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.shell.extensions.user-theme name "Yaru-$package_color$shell_variant"
    if [ ! "$?" -eq "0" ]; then # so, if the above command to change the shell theme doesn't work, ask if the script should fix this.
      echo -e "${BRed}ERROR, this is caused by an old bug. Don't worry!\nI can fix it, but I need root privileges.${RCol}"
      echo -e "${BRed}Is this okay for you?${RCol}"
      select shell_error_fix in yes no
      do
        case $shell_error_fix in
          yes)
            echo -e "${Yel}Okay, I'll fix this, please read the readme to see what I've done.${RCol}"
            echo -e "${Yel}Please enter your passwort...${RCol}"
            # I've got this fix from here: https://gist.github.com/atiensivu/fcc3183e9a6fd74ec1a283e3b9ad05f0 - it puts the missing file from ~ to the glib-2.0 directory and re-compiles the glib schemas
            sudo cp $HOME/.local/share/gnome-shell/extensions/user-theme@gnome-shell-extensions.gcampax.github.com/schemas/org.gnome.shell.extensions.user-theme.gschema.xml /usr/share/glib-2.0/schemas && sudo glib-compile-schemas /usr/share/glib-2.0/schemas
            break ;;
          no)
            echo -e "${Yel}Okay, skipping shell theme. Please read the readme for this!${RCol}"
            enable_shell=false
            break ;;
          *)
            echo -e "${Red}Wrong input!${RCol}"
            ;;
        esac
      done
    fi
    if [ "$enable_gdm3" == "true" ]; then
      sudo cp /usr/share/gnome-shell/theme/Yaru/gnome-shell-theme.gresource /usr/share/gnome-shell/theme/Yaru/gnome-shell-theme.gresource.bakup_yarucolors
      sudo cp $theme_dir/Yaru-$package_color/gnome-shell/*.gresource /usr/share/gnome-shell/theme/Yaru/gnome-shell-theme.gresource
      sudo update-alternatives --set gdm3-theme.gresource /usr/share/gnome-shell/theme/Yaru/gnome-shell-theme.gresource
    fi
  fi

  # Icon part:
  if [ "$icon_color_set" == "true" ]; then # If package was installed and user selected a color...
    sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.desktop.interface icon-theme "Yaru-$enable_icon_color" 2> /dev/null
  elif [ "$enable_icons" == "true" ]; then # If package was not installed theres just one color defined with $package_color ...
    sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.desktop.interface icon-theme "Yaru-$package_color" 2> /dev/null
  fi

  # Cursor part:
  if [ "$cursor_color_set" == "true" ]; then # If package was installed and user selected a color...
    sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.desktop.interface cursor-theme "Yaru-$enable_cursor_color" 2> /dev/null
  elif [ "$enable_cursor" == "true" ]; then # If package was not installed theres just one color defined with $package_color ...
    sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.desktop.interface cursor-theme "Yaru-$package_color" 2> /dev/null
  fi

  # dock part:
  # setting color codes variables:
  if [ "$enable_dock_color" == "Amber" ]; then
    dock_color='#eea834'
  elif [ "$enable_dock_color" == "Aqua" ]; then
    dock_color='#41c6c8'
  elif [ "$enable_dock_color" == "Blue" ]; then
    dock_color='#208fe9'
  elif [ "$enable_dock_color" == "Brown" ]; then
    dock_color='#995640'
  elif [ "$enable_dock_color" == "Deepblue" ]; then
    dock_color='#25469d'
  elif [ "$enable_dock_color" == "Green" ]; then
    dock_color='#3eb34f'
  elif [ "$enable_dock_color" == "Grey" ]; then
    dock_color='#9c9c9c'
  elif [ "$enable_dock_color" == "MATE" ]; then
    dock_color='#78ab50'
  elif [ "$enable_dock_color" == "Orange" ]; then
    dock_color='#e95420'
  elif [ "$enable_dock_color" == "Pink" ]; then
    dock_color='#e920a3'
  elif [ "$enable_dock_color" == "Amber" ]; then
    dock_color='#924d8b'
  elif [ "$enable_dock_color" == "Red" ]; then
    dock_color='#e92020'
  elif [ "$enable_dock_color" == "Teal" ]; then
    dock_color='#16a085'
  elif [ "$enable_dock_color" == "Yellow" ]; then
    dock_color='#e9ba20'
  fi

  if [ "$cursor_color_set" == "true" ]; then # If package was installed and user selected a color...
    sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-running-dots-color "$dock_color" 2> /dev/null
    sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-running-dots-border-color "$dock_color" 2> /dev/null
  elif [ "$enable_cursor" == "true" ]; then # If package was not installed theres just one color defined with $package_color ...
    sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-running-dots-color "$dock_color" 2> /dev/null
    sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-running-dots-border-color "$dock_color" 2> /dev/null
  fi

  echo -e "${BYel}Everything should be done!${RCol}"
  echo -e "${Yel}If something is missing, use gnome-tweak tool!${RCol}"
  echo -e "${Yel}That's it! BYE and THANK YOU!${RCol}"
  execute=false

done


##### Okay, enough for today. What's done?
# - Picking colors and package / single method
# - Copying files
# - Enabling themes, icons and cursors
# - Setting dock colors
# - ADDING COMMENTS!!!!! IMPORTANT !!!1111
# What's not done?
#
