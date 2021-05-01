#!/bin/bash

#Uninstall script for Yaru-Colors Theme by Jannomag

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
echo -e "                                                  ";
echo -e "${RCol}"

echo -e "${BWhi}##########----------      NOTE      ----------##########"
echo -e "# THIS THEME IS JUST A FORK OF THE ORIGINAL YARU THEME #"
echo -e "# I MODIFIED THE COLORS AND SOME IMAGES / SVG GRAPHICS #"
echo -e "# THE ORIGINAL CREDITS FOR THIS GREAT WORK GO TO THE   #"
echo -e "# UBUNTU DEVELOPER TEAM!                               #"
echo -e "# ---------------------------------------------------- #"
echo -e "# FEEL FREE TO MODIFY MY FORK                          #"
echo -e "# ---------------------------------------------------- #"
echo -e "# MY E-MAIL FOR SUGGESTIONS:       jannomag@gmx.de     #"
echo -e "# ---------------------------------------------------- #"
echo -e "# THIS THEMES WERE RELEASED BY ME IN APRIL 2019        #"
echo -e "# ON gnome-looks.org                                   #"
echo -e "##########----------      NOTE      ----------##########"
echo -e "${BRed}########################################################"
echo -e "#                                                      #"
echo -e "#                     UNINSTALLER                      #"
echo -e "#                     for 20.04.x                      #"
echo -e "########################################################${RCol}"
sleep 1
#Check if root
homedir=$( getent passwd "$USER" | cut -d: -f6 )

#Determine user name for later
RUID=$(who | awk 'FNR == 1 {print $1}')
RUSER_UID=$(id -u ${RUID})

#Intro
echo -e ""
echo -e "${Yel}This script will guide you through the removal of this theme.${RCol}"
if [[ "$EUID" -ne 0 ]]; then
	isroot="false"
	defthemepath="$homedir/.local/share/themes"
	deficonpath="$homedir/.icons"
	echo -e "${BGre}You ran this script as normal user.${RCol}"
	echo -e " "
	sleep 0.5
else
	isroot="true"
	homedir=$( getent passwd "$SUDO_USER" | cut -d: -f6 )
	linkthemepath="/usr/share/themes"
	linkiconpath="/usr/share/icons"
	defthemepath="$homedir/.local/share/themes"
	deficonpath="$homedir/.icons"
	echo -e "${BGre}You ran this script as root.${RCol}"
fi


echo -e "${BWhi}Where did you install the theme [$defthemepath]: ${RCol}" && read -e themepath
themepath="${themepath:-$defthemepath}"
echo -e "${Yel}Yaru-Path is set to $themepath${RCol}"
themepathset="true"

echo -e "${BWhi}Where did you install the icons [$deficonpath]: ${RCol}" && read -e iconpath
iconpath="${iconpath:-$deficonpath}"
echo -e "${Yel}Yaru-Path is set to $iconpath${RCol}"
iconpathset="true"

sleep 0.5

### NOTE ###
### OBSOLETE WITH 20.04 DUE TO AN COMPATIBILITY ISSUE
### MAYBE USEFUL LATER, MAYBE NOT
: << 'GNOMESHELL'
echo -e "${BWhi}Did you install the gnome-shell theme to /usr/share/gnome-shell/theme/Yaru?${RCol}"
select shellreplace in yes no
do
	case $shellreplace in
		yes)
		if [[ $isroot = "true" ]] && [[ -d "/usr/share/gnome-shell/theme/Yaru-BACKUP" ]]; then
			echo -e "${Yel}Backup found, marking it for restore${RCol}"
			setremshell="true"
		elif [[ $isroot = "true" ]] && [[ ! -d "/usr/share/gnome-shell/theme/Yaru-BACKUP" ]]; then
			echo -e "${Red}Backup NOT found, please check files!${RCol}"
			echo -e "${Yel}Nothing will be changed there.${RCol}"
			setremshell="false"
		elif [[ $isroot = "false" ]] && [[ -d "/usr/share/gnome-shell/theme/Yaru-BACKUP" ]]; then
			echo -e "${Red}Backup was found, please run this script as root\nif you want to restore default Yaru's gnome-shell${RCol}"
			setremshell="false"
		elif [[ $isroot = "false" ]] && [[ ! -d "/usr/share/gnome-shell/theme/Yaru-BACKUP" ]]; then
			echo -e "${Red}No backup found, did you really install it?\nCheck your files!${RCol}"
			setremshell="false"
		fi
		break
		;;
		no)
		echo -e "${Yel}Okay, ignoring this directory${RCol}"
		setremshell="false"
		break
		;;
		*)
		echo -e "${BYel}Please type 1 or 2...${RCol}"
		;;
	esac
done
GNOMESHELL

echo -e "${BWhi}Do you want to change the Dock indicators back to Orange (if changed)?${RCol}"
select setdockrestore in yes no
do
	case $setdockrestore in
		yes)
		echo -e "${Yel}Okay, settings saved.${RCol}"
		break
		;;
		no)
		echo -e "${Yel}Okay, won't touch the dock.${RCol}"
		break
		;;
		*)
		echo -e "${BYel}Please type 1 or 2...${RCol}"
		;;
	esac
done



echo -e "${BWhi}Okay, I'll do following:${RCol}"
sleep 0.5

if [[ $themepathset = "true" ]]; then
	echo -e "${BGre}REMOVE theme(s) in '$themepath'...${RCol}"
	remthemes="true"
elif [[ $themepathset = "false" ]]; then
	echo -e "${BRed}Something went wrong, no theme path was set!${RCol}"
	remthemes="false"
fi
sleep 0.5
if [[ $iconpathset = "true" ]]; then
	echo -e "${BGre}REMOVE icons in '$iconpath'...${RCol}"
	remicons="true"
elif [[ $iconpathset = "false" ]]; then
	echo -e "${BRed}Something went wrong, no icon path was set!${RCol}"
	remicons="false"
fi
sleep 0.5
: << 'GNOMESHELL'
if [[ $setremshell = "true" ]]; then
	echo -e "${BGre}REMOVE shell theme and RESTORE the backup...${RCol}"
	remshell="true"
elif [[ $setremshell = "false" ]]; then
	echo -e "${Gre}Do nothing with the shell theme in '/usr/...'${RCol}"
	remshell="false"
fi
sleep 0.5
GNOMESHELL

if [[ $isroot = "true" ]] && [[ $themepathset = "true" ]]; then
	echo -e "${BGre}REMOVE linked files in /usr/share/themes...${RCol}"
	find /usr/share/themes/ -type l -delete
fi

if [[ $isroot = "true" ]] && [[ $iconpathset = "true" ]]; then
	echo -e "${BGre}REMOVE linked files in /usr/share/icons...${RCol}"
	find /usr/share/icons/ -type l -delete
fi

if [[ $setdockrestore = "yes" ]]; then
	echo -e "${BGre}RESTORE dock indicator color...${RCol}"
	dockrestore="true"
elif [[ $setdockrestore = "no" ]]; then
	echo -e "${Gre}Leaving the dock as it is${RCol}"
	dockrestore="false"
fi
sleep 0.5
echo -e " "

while true; do
    echo -e "${BWhi}Is this correct? [yes / no]${RCol}" && read -r confirm
    case $confirm in
        [yes]* )
		uninstall="true"
		break
		;;
        [no]* )
		uninstall="false"
		echo -e "${BYel}Okay, exiting now...${RCol}"
		sleep 1
		exit
		;;
        * ) echo "Please answer yes or no.";;
    esac
done





if [[ $uninstall = "true" ]] && [[ $remthemes = "true" ]]; then
	echo -e "${BYel}Removing theme(s) in '$themepath'...${RCol}"
### REMOVE BEGINS HERE
### REMOVE GTK THEMES
	rm -rf $iconpath/Yaru-Amber*
	rm -rf $iconpath/Yaru-Aubergine*
	rm -rf $iconpath/Yaru-Aqua*
	rm -rf $iconpath/Yaru-Blue*
	rm -rf $iconpath/Yaru-Brown*
	rm -rf $iconpath/Yaru-Deepblue*
	rm -rf $iconpath/Yaru-Green*
	rm -rf $iconpath/Yaru-Grey*
	rm -rf $iconpath/Yaru-Lavender*
	rm -rf $iconpath/Yaru-MATE*
	rm -rf $iconpath/Yaru-Orange*
	rm -rf $iconpath/Yaru-Pink*
	rm -rf $iconpath/Yaru-Purple*
	rm -rf $iconpath/Yaru-Red*
	rm -rf $iconpath/Yaru-Teal*
	rm -rf $iconpath/Yaru-Yellow*
	sleep 1
	echo -e "${BYel}Done.${RCol}"
	echo -e " "
fi

if [[ $uninstall = "true" ]] && [[ $remicons = "true" ]]; then
	echo -e "${BYel}Removing icons in '$iconpath'...${RCol}"
### REMOVE ICONS
	rm -rf $iconpath/Yaru-Amber*
	rm -rf $iconpath/Yaru-Aubergine*
	rm -rf $iconpath/Yaru-Aqua*
	rm -rf $iconpath/Yaru-Blue*
	rm -rf $iconpath/Yaru-Brown*
	rm -rf $iconpath/Yaru-Deepblue*
	rm -rf $iconpath/Yaru-Green*
	rm -rf $iconpath/Yaru-Grey*
	rm -rf $iconpath/Yaru-Lavender*
	rm -rf $iconpath/Yaru-MATE*
	rm -rf $iconpath/Yaru-Orange*
	rm -rf $iconpath/Yaru-Pink*
	rm -rf $iconpath/Yaru-Purple*
	rm -rf $iconpath/Yaru-Red*
	rm -rf $iconpath/Yaru-Teal*
	rm -rf $iconpath/Yaru-Yellow*
	sleep 1
	echo -e "${BYel}Done.${RCol}"
	echo -e " "
fi

if [[ $uninstall = "true" ]] && [[ $remshell = "true" ]]; then
	echo -e "${BYel}Removing shell theme from '/usr/share/gnome-shell/theme/Yaru'...${RCol}"
	rm -rf /usr/share/gnome-shell/theme/Yaru
	sleep 0.5
	echo -e "${BYel}Done.${RCol}"
	echo -e " "
	sleep 0.3
	echo -e "${BYel}Restoring backup...${RCol}"
	mv /usr/share/gnome-shell/theme/Yaru-BACKUP /usr/share/gnome-shell/theme/Yaru
	sleep 0.5
	echo -e "${BYel}Done.${RCol}"
	echo -e " "
	sleep 0.3
fi

if [[ $uninstall = "true" ]] && [[ $dockrestore = "true" ]]; then
	echo -e "${BYel}Restoring dock indicators to stock Orange...${RCol}"
	sleep 0.5
	if [[ $isroot = "true" ]]; then
		sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-running-dots-color '#E95420' 2> /dev/null
		sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-running-dots-border-color '#E95420' 2> /dev/null
	elif [[ $isroot = "false" ]]; then
		gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-running-dots-color '#E95420' 2> /dev/null
		gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-running-dots-border-color '#E95420' 2> /dev/null
	fi
	sleep 0.5
	echo -e "${BYel}Done.${RCol}"
fi

echo -e "${BGre}Everything done, do you want to restore default Yaru theme and icons?${RCol}"
select restoreyaru in yes no
do
	case $restoreyaru in
		yes)
		echo -e "${BYel}Restoring Yaru GTK theme...${RCol}"
		if [[ $isroot = "true" ]]; then
			sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.desktop.interface gtk-theme 'Yaru' 2> /dev/null
		elif [[ $isroot = "false" ]]; then
			gsettings set org.gnome.desktop.interface gtk-theme 'Yaru' 2> /dev/null
		fi
		sleep 0.5
		echo -e "${BYel}Done.${RCol}"
		echo -e " "
		sleep 0.3
		echo -e "${BYel}Restoring Yaru GTK icons...${RCol}"
		if [[ $isroot = "true" ]]; then
			sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.desktop.interface icon-theme 'Yaru' 2> /dev/null
		elif [[ $isroot = "false" ]]; then
			gsettings set org.gnome.desktop.interface icon-theme 'Yaru' 2> /dev/null
		fi
		sleep 0.5
		echo -e "${BYel}Done.${RCol}"
		echo -e " "
		sleep 0.3
		break
		;;
		no)
		echo -e "${Yel}Okay...${RCol}"
		break
		;;
		*)
		echo -e "${BYel}Please type 1 or 2...${RCol}"
		;;

	esac
done
echo $isroot
echo -e "${BGre}Everything finished! Bye!${RCol}"
sleep 1
exit
