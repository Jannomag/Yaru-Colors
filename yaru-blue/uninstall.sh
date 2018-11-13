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

echo -e "${RCol}"
echo -e ""
echo -e "${Yel}This script will remove the Yaru-Blue theme and recover the backups.${RCol}"
echo -e ""

#check if Yaru-Blue and Yaru-Blue-dark are present in /usr/share/themes
if [ -d "/usr/share/themes/Yaru-Blue" ] || [ -d "/usr/share/themes/Yaru-Blue-dark" ]
  then
    echo -e "${BYel}Do you want to remove the GTK theme?${RCol}"
    select rmgtk in yes no
	do
	  case $rmgtk in 
	    yes)
                echo -e "${Yel}Removing Yaru-Blue and Yaru-Blue-dark directories...${RCol}"
		rm -rf /usr/share/themes/Yaru-Blue
		rm -rf /usr/share/themes/Yaru-Blue-dark
		sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-Blue' 2> /dev/null
		sleep 1
		break
		;;
	    no)
		echo -e "${Yel}That's okay. GTK theme directories stay untouched.${RCol}"
		break
		;;
	     *)
		echo -e "Please repeat, 1 or 2!"
		;;  
	  esac
	done
  else
    echo -e "${BRed}Are you sure you installed Yaru-Blue?\nIf you installed it not in '/usr/share/themes', remove them manually, please!" | fold -s
    echo -e "Exiting now${RCol}"
    sleep 1
    exit 1
fi

#If they don't exist anymore...
if [ ! -d "/usr/share/themes/Yaru-Blue" ] && [ ! -d "/usr/share/themes/Yaru-Blue-dark" ] 
  then
    echo -e "${BGre}GTK theme removed!${RCol}"
    sleep 1
  else 
    echo -e "${BRed}Something went wrong!\nGTK theme's still there\nCheck '/usr/share/themes'!"
    echo -e "Exiting now${RCol}"
fi

echo -e "${BYel}Did you also install the gnome-shell theme in '/usr/share/gnome-shell/theme'?"
select shell in yes no
  do
    case $shell in 
      yes)
         #check if the Gnome-Shell theme is installed in /usr/share/gnome-shell
	 if [ -d "/usr/share/gnome-shell/theme/Yaru-BACKUP" ] && [ -d "/usr/share/gnome-shell/theme/Yaru" ]
	   then
	     rm -rf /usr/share/gnome-shell/theme/Yaru
    	     mv /usr/share/gnome-shell/theme/Yaru-BACKUP /usr/share/gnome-shell/theme/Yaru
             echo -e "${BGre}Yaru-Blue shell theme removed and backup restored!${RCol}"
         else
           echo -e "${BRed}Something went wrong! Backup directory and/or Yaru directory in '/usr/share/gnome-shell/theme' aren't present! Check the directory, did you install it there?\nExiting now!${RCol}"   
         sleep 1
         exit 1
         fi
         break
         ;;
      no)
        echo -e "${BYel}Okay, shell theme stays untouched${RCol}"
	break
        ;;
      *)
	echo -e "Please repeat, 1 or 2!"
	;;  
    esac
  done        

echo -e "${BYel}Do you want to reset the dock indicator color?${RCol}"
select resdock in yes no
  do
    case $resdock in
	yes)
	   #Run the commands to theme the dock indicators, for this the user name is relevant
	   sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-running-dots-color '#e95420' 2> /dev/null
	   sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-running-dots-border-color '#e95420' 2> /dev/null
	   echo -e "${Yel}Done with this.${RCol}"
	   break
           ;;
        no)
           echo -e "${Yel}Dock theme stays untouched${RCol}"
           break
           ;;
        *)
	  echo -e "Please repeat, 1 or 2!"
	  ;; 
    esac
  done

#check if icons are installed
if [ -d "/usr/share/icons/Yaru-Blue" ]
then
echo -e "${BYel}Do you want to remove the icons?${RCol}"
select rmicons in yes no
  do
    case $rmicons in
	yes)
	   #Run the commands to theme the dock indicators, for this the user name is relevant
	   sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.desktop.interface icon-theme 'Yaru' 2> /dev/null
	   rm -rf /usr/share/icons/Yaru-Blue
	   echo -e "${Yel}Done with this.${RCol}"
	   break
           ;;
        no)
           echo -e "${Yel}Icons stay untouched${RCol}"
           break
           ;;
        *)
	  echo -e "Please repeat, 1 or 2!"
	  ;; 
    esac
  done
fi

echo -e "${BYel}Okay, then you're done. Have a nice day!${RCol}"
sleep 1
exit 1
