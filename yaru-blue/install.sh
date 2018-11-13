#!/bin/bash

#Install script for Yaru-Blue Theme by Jannomag

RCol='\e[0m'    # Text Reset

# Regular           Bold                Underline           High Intensity      BoldHigh Intens     Background          High Intensity Backgrounds
Bla='\e[0;30m';     BBla='\e[1;30m';    UBla='\e[4;30m';    IBla='\e[0;90m';    BIBla='\e[1;90m';   On_Bla='\e[40m';    On_IBla='\e[0;100m';
Red='\e[0;31m';     BRed='\e[1;31m';    URed='\e[4;31m';    IRed='\e[0;91m';    BIRed='\e[1;91m';   On_Red='\e[41m';    On_IRed='\e[0;101m';
Gre='\e[0;32m';     BGre='\e[1;32m';    UGre='\e[4;32m';    IGre='\e[0;92m';    BIGre='\e[1;92m';   On_Gre='\e[42m';    On_IGre='\e[0;102m';
Yel='\e[0;33m';     BYel='\e[1;33m';    UYel='\e[4;33m';    IYel='\e[0;93m';    BIYel='\e[1;93m';   On_Yel='\e[43m';    On_IYel='\e[0;103m';
Blu='\e[0;34m';     BBlu='\e[1;34m';    UBlu='\e[4;34m';    IBlu='\e[0;94m';    BIBlu='\e[1;94m';   On_Blu='\e[44m';    On_IBlu='\e[0;104m';
Pur='\e[0;35m';     BPur='\e[1;35m';    UPur='\e[4;35m';    IPur='\e[0;95m';    BIPur='\e[1;95m';   On_Pur='\e[45m';    On_IPur='\e[0;105m';
Cya='\e[0;36m';     BCya='\e[1;36m';    UCya='\e[4;36m';    ICya='\e[0;96m';    BICya='\e[1;96m';   On_Cya='\e[46m';    On_ICya='\e[0;106m';
Whi='\e[0;37m';     BWhi='\e[1;37m';    UWhi='\e[4;37m';    IWhi='\e[0;97m';    BIWhi='\e[1;97m';   On_Whi='\e[47m';    On_IWhi='\e[0;107m';

echo -e "${BCya}Y88b   d88P                           888888b.  888"                 
echo -e " Y88b d88P                            888  \"88b 888"                 
echo -e "  Y88o88P                             888  .88P 888"                 
echo -e "   Y888P  8888b. 888d888888  888      8888888K. 888888  888 .d88b."  
echo -e "    888      \"88b888P\"  888  888      888  \"Y88b888888  888d8P  Y8b" 
echo -e "    888  .d888888888    888  888888888888    888888888  88888888888" 
echo -e "    888  888  888888    Y88b 888      888   d88P888Y88b 888Y8b."     
echo -e "    888  \"Y888888888     \"Y88888      8888888P" 888 \"Y88888 \"Y8888"" 
echo -e "${RCol}"

echo -e "     ${Blu}##########----------      NOTE      ----------##########"
echo -e "     # THIS THEME IS JUST A FORK OF THE ORIGINAL YARU THEME #"
echo -e "     # I MODIFIED THE COLORS AND SOME IMAGES / SVG GRAPHICS #"
echo -e "     # THE ORIGINAL CREDITS FOR THIS GREAT WORK GO TO THE   #"
echo -e "     # UBUNTU DEVELOPER TEAM!                               #"
echo -e "     # ---------------------------------------------------- #"
echo -e "     # FEEL FREE TO MODIFY MY FORK                          #"
echo -e "     # ---------------------------------------------------- #"
echo -e "     # MY E-MAIL FOR SUGGESTIONS:       jannomag@gmx.de     #"
echo -e "     # ---------------------------------------------------- #"
echo -e "     # THIS THEME WAS RELEASED BY ME IN NOVEMBER 2018       #"
echo -e "     # ON gnome-looks.org                                   #"
echo -e "     ##########----------      NOTE      ----------##########"
sleep 1
#Check if root
if [ "$EUID" -ne 0 ]
  then echo -e "${BRed}Please run this as root!${RCol}"
  exit
fi
#Determine user name for later
RUID=$(who | awk 'FNR == 1 {print $1}')
RUSER_UID=$(id -u ${RUID})

#Intro
echo -e "${RCol}"
echo -e ""
echo -e "${Yel}This script will guide you through the installation of this theme.${RCol}"
echo -e ""
echo -e "${BWhi}Do you want to install the GTK Theme Yaru-Blue?${RCol}"
#Choose yes or no for GTK theme installation
select gtkinstall in yes no
do
  case $gtkinstall in
    yes)
        gtkpathdef="/usr/share/themes/"
        echo -e "${Yel}Please enter your theme path [$gtkpathdef]: ${RCol}" && read -e gtkpath
	gtkpath="${gtkpath:-$gtkpathdef}"
        echo -e "${Yel}Copying the theme to $gtkpath..."
	cp -R ./gtk/Yaru-Blue $gtkpath
	cp -R ./gtk/Yaru-Blue-dark $gtkpath
	echo -e "${BWhi}Done...${RCol}"
        break
        ;;
    no)
        echo -e "${Yel}Okay...but why did you download this?"
	echo -e "Maybe next time."
	sleep 1
	echo -e "Bye!${RCol}"
	sleep 1
        exit 1
        break
        ;; 
     *)
        echo -e "${BYel}Oi, no comprende. Please select by typing 1 or 2!${RCol}"
        ;;
  esac
done

#If needed directories are copied, go ahead, if not, exit.
if [ -d "$gtkpath/Yaru-Blue" ] && [ -d "$gtkpath/Yaru-Blue-dark" ]
  then
    echo -e "${BYel}GTK theme is placed."
  else
    echo -e "${BRed}Something went wrong! Check your directories."
    echo -e "Exiting now!${RCol}"
    sleep 1
    exit
fi

#Check if Ubuntu 18.10's Yaru gnome-shell theme is installed
#This is needed for changing the login screen background color (this purple gradient).
if [ -d "/usr/share/gnome-shell/theme/Yaru" ]
  then 
    echo -e ""
    sleep 1
    echo -e "${BGre}I see, Ubuntu Yaru Gnome-Shell is already installed in '/usr/share/gnome-shell/theme/Yaru'.\nFor better compatibility I recommend to install this theme as standard gnome-shell theme which replaces '/usr/share/gnome-shell/theme/Yaru'.\n No worries, this script will create a backup in '/usr/share/gnome-shell/theme/' called 'Yaru-BACKUP'${RCol}"| fold -s
    echo -e ""
    sleep 3
    echo -e "${BWhi}Do you want to do this now?${RCol}"
    select origshell in yes no;
    #choose if install the shell theme as stock or inside theme directory
    do
      case $origshell in
         yes)
             echo -e "${Yel}Creating backup...${RCol}"
             mv /usr/share/gnome-shell/theme/Yaru /usr/share/gnome-shell/theme/Yaru-BACKUP
             sleep 1
             echo -e "${Yel}Done.${RCol}"
             sleep 0.3
             if [ -d "/usr/share/gnome-shell/theme/Yaru-BACKUP" ]
               then
                 echo -e "${Yel}Copying Yaru-Blue files...${RCol}"
                 cp -R ./shell /usr/share/gnome-shell/theme/Yaru
                 sleep 1
	         echo -e "${Yel}Done.${RCol}"
		 
               else 
                 echo -e "${BRed}Something went wrong!"
                 echo -e "Check /usr/share/gnome-shell/theme"
                 echo -e "The Yaru-Backup directory doesn't exist!"
                 echo -e "Stopping here${RCol}"
                 exit
               fi
	       break
	       ;;
         no)
             echo -e "${Yel}Okay, Yaru-Blue shell theme will be installed into \n$gtkpath/Yaru-Blue${RCol}"
             cp -R ./shell $gtkpath/Yaru-Blue/gnome-shell
             sleep 1
             echo -e "${Yel}Done.${RCol}"
             break
             ;;
          *)
             echo -e "${BYel}Really? Again? Hmpf, type 1 or 2, nothing else!${RCol}"
             ;;
      esac
    done
  else
    echo -e "${Yel}Okay, Yaru-Blue shell theme will be installed into $gtkpath/Yaru-Blue${RCol}"
    cp -R ./shell $gtkpath/Yaru-Blue/gnome-shell
    sleep 1
    echo -e "${Yel}Done.${RCol}"     
fi


 

echo -e "${Yel}All things copied.${RCol}"
#Choose if enable the GTK theme
echo -e "${BWhi}Do you want to enable the GTK theme?${RCol}"
select setgtk in yes no
  do 
    case $setgtk in
      yes)
        echo -e "${BGre}Okay, countdown T-3 seconds"
        sleep 0.5
        echo -e "${BGre}3${RCol}"
        sleep 1
        echo -e "${BGre}2${RCol}"
        sleep 1
        echo -e "${BGre}1${RCol}"
        sleep 1
        echo -e "${BGre}IGNITION${RCol}"
	#Run the gsettings command and supress errors, for this the user name is relevant
	sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-Blue' 2> /dev/null
	echo -e "${BGre}AND LIFT OFF!${RCol}"
	sleep 1
        break
        ;;
      no)
        echo -e "${Yel}okaaayy...you can enable it within gnome-tweak tool or with following command:${RCol}"
        echo -e "${BWhi}'gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-Blue''${RCol}"
	break
        ;;
      *)
        echo -e "${BYel}Are you serious?${RCol}"
        ;;
    esac
  done

#choose if dock should also be themed
echo -e "${Yel}Do you also want to theme the Ubuntu dock? (indicators)${RCol}"
select dock in yes no
  do
    case $dock in
      yes)
        echo -e "${BGre}Okay, let's set the indicator color...${RCol}"
	sleep 1
	#Run the commands to theme the dock indicators, for this the user name is relevant
	sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-running-dots-color '#208fe9' 2> /dev/null
	sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-running-dots-border-color '#208fe9' 2> /dev/null
	sleep 0.5
	echo -e "${BGre}Look there, blue dots!${RCol}"
	break
	;;
      no)
	echo -e "${Yel}Okay, no problem!${RCol}"
	break
	;;
      *)
	echo -e "${BYel}Yeah...no....wrong...again...${RCol}"
	;;
    esac
done

#choose if icons should also be installed
echo -e "${Yel}Do you want to install the Yaru-Blue icons to '/usr/share/icons/'?${RCol}"
select icons in yes no
  do
    case $icons in
      yes)
         echo -e "${Yel}Okay, copying files...${RCol}"
	 cp -R ./icons/Yaru-Blue /usr/share/icons/
	 sleep 1
         if [ -d "/usr/share/icons/Yaru-Blue" ]
	   then
             echo -e "${Yel}Icons copied!${RCol}"
	   else
             echo -e "${Red}Icons not copied! I don't know why, check directories!${RCol}"
         fi
         break
         ;;
      no)
         echo -e "${Yel}Okay, icons won't be installed.${RCol}"
         break
         ;;
      *)
         echo -e "${BYel}C'mon...again!${RCol}"
	 ;;
    esac
  done

#check if icons are installed and ask if they should be enabled
if [ -d "/usr/share/icons/Yaru-Blue" ]
  then
    echo -e "${BYel}Do you want to enable them?${RCol}"
    select enicons in yes no
      do
         case $enicons in
           yes)
              echo -e "${BGre}Enabling icons...${RCol}"
	      sleep 0.5
	      sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.desktop.interface icon-theme 'Yaru-Blue' 2> /dev/null
	      sleep 0.5
	      echo -e "${BGre}Done!${RCol}"
              break
              ;;
           no)
              echo -e "${BGre}You can do it with gnome-tweak-tool as usual.${RCol}"
              break
              ;;
           *)
              echo -e "${BYel}................and again...${RCol}"
	      ;;
        esac
      done
fi
             

sleep 2
echo -e "${Yel} If you also want to enable the gnome-shell theme you need the extension 'User Themes'. \nWhen 'User Themes' is enabled, open gnome-tweak-tool and enable the shell theme.
\nIf you installed the shell theme in '/usr/share/gnome-shell/theme/Yaru' you need to (re)enable the 'Yaru' theme.
\nIf you installed it in '/usr/share/themes/Yaru-Blue' you need to enable the 'Yaru-Blue'
theme.${RCol}" | fold -s
sleep 2
echo -e "${BGre} You're done!${RCol}"
echo -e "${Yel}If you want to uninstall it, just run my uninstall.sh script as root!${RCol}"
sleep 0.5
echo -e "${BCya}Bye bye!${RCol}"

echo -e "${BCya}...and thanks for choosing my Yaru-Blue theme!${RCol}"
sleep 1
               
  
        
