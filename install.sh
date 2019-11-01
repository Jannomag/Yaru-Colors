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
sleep 1
#getting home directory
homedir=$( getent passwd "$USER" | cut -d: -f6 )
#Check if root
if [[ "$EUID" -ne 0 ]]; then
	themeinstallpath="$homedir/.local/share/themes"
	iconinstallpath="$homedir/.icons"
        isroot="false"
	echo -e "${BGre}You ran this script as normal user, default install path is set to\n'$homedir/.local/share/' and '$homedir/.icons/'\nwhich can also be changed later!${RCol}"
	echo -e " "
	sleep 0.5
else
        isroot="true"
	themeinstallpath="/usr/share/themes"
	iconinstallpath="/usr/share/icons"
	echo -e "${BGre}You ran this script as root, default install path is set to\n'/usr/share/' which can also be changed later!${RCol}"
fi

#Determine user name for later
RUID=$(who | awk 'FNR == 1 {print $1}')
RUSER_UID=$(id -u ${RUID})

#Intro
echo -e "${RCol}"
echo -e ""
echo -e "${Yel}This script will guide you through the installation of this theme.${RCol}"
echo -e ""


###################
###################
#                 #
# INSTALL SECTION #
#                 #
###################
###################

###########################################################################################################
#Choose yes or no for complete theme pack installation

gtkpathdef="$themeinstallpath"
iconpathdef="$iconinstallpath"

echo -e "${BWhi}Do you want to install the the complete pack including icons?${RCol}"
select packinstall in yes no
do
  case $packinstall in
    yes)
	echo -e " "

        echo -e "${BYel}Please enter your theme path [$gtkpathdef]: ${RCol}" && read -e gtkpath
	gtkpath="${gtkpath:-$gtkpathdef}"
	if [[ ! -d "$gtkpath" ]]; then
		echo -e "${Yel}$gtkpath doesn't exist, creating now${RCol}"
		mkdir -p $gtkpath
	fi
	
        echo -e "${Yel}Copying the themes to $gtkpath...${RCol}"
	cp -R ./Themes/* $gtkpath
	ln -s $gtkpath/Yaru-Aqua/gtk-3.0/assets $gtkpath/Yaru-Aqua-dark/gtk-3.0/
	ln -s $gtkpath/Yaru-Aqua/gtk-3.20/assets $gtkpath/Yaru-Aqua-dark/gtk-3.20/

	ln -s $gtkpath/Yaru-Blue/gtk-3.0/assets $gtkpath/Yaru-Blue-dark/gtk-3.0/
	ln -s $gtkpath/Yaru-Blue/gtk-3.20/assets $gtkpath/Yaru-Blue-dark/gtk-3.20/

	ln -s $gtkpath/Yaru-Brown/gtk-3.0/assets $gtkpath/Yaru-Brown-dark/gtk-3.0/
	ln -s $gtkpath/Yaru-Brown/gtk-3.20/assets $gtkpath/Yaru-Brown-dark/gtk-3.20/

	ln -s $gtkpath/Yaru-Deepblue/gtk-3.0/assets $gtkpath/Yaru-Deepblue-dark/gtk-3.0/
	ln -s $gtkpath/Yaru-Deepblue/gtk-3.20/assets $gtkpath/Yaru-Deepblue-dark/gtk-3.20/

	ln -s $gtkpath/Yaru-Green/gtk-3.0/assets $gtkpath/Yaru-Green-dark/gtk-3.0/
	ln -s $gtkpath/Yaru-Green/gtk-3.20/assets $gtkpath/Yaru-Green-dark/gtk-3.20/

	ln -s $gtkpath/Yaru-Grey/gtk-3.0/assets $gtkpath/Yaru-Grey-dark/gtk-3.0/
	ln -s $gtkpath/Yaru-Grey/gtk-3.20/assets $gtkpath/Yaru-Grey-dark/gtk-3.20/

	ln -s $gtkpath/Yaru-MATE/gtk-3.0/assets $gtkpath/Yaru-MATE-dark/gtk-3.0/
	ln -s $gtkpath/Yaru-MATE/gtk-3.20/assets $gtkpath/Yaru-MATE-dark/gtk-3.20/

	ln -s $gtkpath/Yaru-Pink/gtk-3.0/assets $gtkpath/Yaru-Pink-dark/gtk-3.0/
	ln -s $gtkpath/Yaru-Pink/gtk-3.20/assets $gtkpath/Yaru-Pink-dark/gtk-3.20/

	ln -s $gtkpath/Yaru-Purple/gtk-3.0/assets $gtkpath/Yaru-Purple-dark/gtk-3.0/
	ln -s $gtkpath/Yaru-Purple/gtk-3.20/assets $gtkpath/Yaru-Purple-dark/gtk-3.20/

	ln -s $gtkpath/Yaru-Red/gtk-3.0/assets $gtkpath/Yaru-Red-dark/gtk-3.0/
	ln -s $gtkpath/Yaru-Red/gtk-3.20/assets $gtkpath/Yaru-Red-dark/gtk-3.20/

	ln -s $gtkpath/Yaru-Yellow/gtk-3.0/assets $gtkpath/Yaru-Yellow-dark/gtk-3.0/
	ln -s $gtkpath/Yaru-Yellow/gtk-3.20/assets $gtkpath/Yaru-Yellow-dark/gtk-3.20/
	echo -e "${Yel}Done.${RCol}"
        sleep 0.3
        echo -e " "
	echo -e "${BYel}Please enter your icon path [$iconpathdef]: ${RCol}" && read -e iconpath
	iconpath="${iconpath:-$iconpathdef}"
	if [[ ! -d "$iconpath" ]]; then
		echo -e "${Yel}$iconpath doesn't exist, creating now${RCol}"
		mkdir -p $iconpath
	fi
        echo -e "${Yel}Copying the icons to $iconpath...${RCol}"
	cp -R ./Icons/* $iconpath
	echo -e "${Yel}Done.${RCol}"
	sleep 0.3
	echo -e " "
        break
        ;;
    no)
	echo -e " "
        echo -e "${BWhi}Okay, which one should it be?${RCol}"
        break
        ;; 
     *)
        echo -e "${BYel}Oi, no comprende. Please select by typing 1 or 2!${RCol}"
        ;;
  esac
done

###########################################################################################################
#If selected no, choose which theme should be installed

if [[ $packinstall = "no" ]];
  then
	select themeinstall in Aqua Blue Brown Deepblue Green Grey MATE Pink Purple Red Yellow
	do
	  case $themeinstall in
	    Aqua) 
        	echo -e "${Yel}Please enter your theme path [$gtkpathdef]: ${RCol}" && read -e gtkpath
		gtkpath="${gtkpath:-$gtkpathdef}"
		echo -e "${Yel}Copying Yaru-$themeinstall to $gtkpath..."
		cp -R ./Themes/Yaru-$themeinstall* $gtkpath
		ln -s $gtkpath/Yaru-$themeinstall/gtk-3.0/assets $gtkpath/Yaru-$themeinstall-dark/gtk-3.0/
		ln -s $gtkpath/Yaru-$themeinstall/gtk-3.20/assets $gtkpath/Yaru-$themeinstall-dark/gtk-3.20/
		echo -e "${BWhi}Done...${RCol}"
        	break
        	;; 
	    Blue) 
        	echo -e "${Yel}Please enter your theme path [$gtkpathdef]: ${RCol}" && read -e gtkpath
		gtkpath="${gtkpath:-$gtkpathdef}"
		echo -e "${Yel}Copying Yaru-$themeinstall to $gtkpath..."
		cp -R ./Themes/Yaru-$themeinstall* $gtkpath
		ln -s $gtkpath/Yaru-$themeinstall/gtk-3.0/assets $gtkpath/Yaru-$themeinstall-dark/gtk-3.0/
		ln -s $gtkpath/Yaru-$themeinstall/gtk-3.20/assets $gtkpath/Yaru-$themeinstall-dark/gtk-3.20/
		echo -e "${BWhi}Done...${RCol}"
        	break
        	;;
 	    Brown) 
        	echo -e "${Yel}Please enter your theme path [$gtkpathdef]: ${RCol}" && read -e gtkpath
		gtkpath="${gtkpath:-$gtkpathdef}"
		echo -e "${Yel}Copying Yaru-$themeinstall to $gtkpath..."
		cp -R ./Themes/Yaru-$themeinstall* $gtkpath
		ln -s $gtkpath/Yaru-$themeinstall/gtk-3.0/assets $gtkpath/Yaru-$themeinstall-dark/gtk-3.0/
		ln -s $gtkpath/Yaru-$themeinstall/gtk-3.20/assets $gtkpath/Yaru-$themeinstall-dark/gtk-3.20/
		echo -e "${BWhi}Done...${RCol}"
        	break
        	;;
	    Deepblue) 
        	echo -e "${Yel}Please enter your theme path [$gtkpathdef]: ${RCol}" && read -e gtkpath
		gtkpath="${gtkpath:-$gtkpathdef}"
		echo -e "${Yel}Copying Yaru-$themeinstall to $gtkpath..."
		cp -R ./Themes/Yaru-$themeinstall* $gtkpath
		ln -s $gtkpath/Yaru-$themeinstall/gtk-3.0/assets $gtkpath/Yaru-$themeinstall-dark/gtk-3.0/
		ln -s $gtkpath/Yaru-$themeinstall/gtk-3.20/assets $gtkpath/Yaru-$themeinstall-dark/gtk-3.20/
		echo -e "${BWhi}Done...${RCol}"
        	break
        	;;
	    Green) 
        	echo -e "${Yel}Please enter your theme path [$gtkpathdef]: ${RCol}" && read -e gtkpath
		gtkpath="${gtkpath:-$gtkpathdef}"
		echo -e "${Yel}Copying Yaru-$themeinstall to $gtkpath..."
		cp -R ./Themes/Yaru-$themeinstall* $gtkpath
		ln -s $gtkpath/Yaru-$themeinstall/gtk-3.0/assets $gtkpath/Yaru-$themeinstall-dark/gtk-3.0/
		ln -s $gtkpath/Yaru-$themeinstall/gtk-3.20/assets $gtkpath/Yaru-$themeinstall-dark/gtk-3.20/
		echo -e "${BWhi}Done...${RCol}"
        	break
        	;;
	    Grey) 
        	echo -e "${Yel}Please enter your theme path [$gtkpathdef]: ${RCol}" && read -e gtkpath
		gtkpath="${gtkpath:-$gtkpathdef}"
		echo -e "${Yel}Copying Yaru-$themeinstall to $gtkpath..."
		cp -R ./Themes/Yaru-$themeinstall* $gtkpath
		ln -s $gtkpath/Yaru-$themeinstall/gtk-3.0/assets $gtkpath/Yaru-$themeinstall-dark/gtk-3.0/
		ln -s $gtkpath/Yaru-$themeinstall/gtk-3.20/assets $gtkpath/Yaru-$themeinstall-dark/gtk-3.20/
		echo -e "${BWhi}Done...${RCol}"
        	break
        	;;
	    MATE) 
        	echo -e "${Yel}Please enter your theme path [$gtkpathdef]: ${RCol}" && read -e gtkpath
		gtkpath="${gtkpath:-$gtkpathdef}"
		echo -e "${Yel}Copying Yaru-$themeinstall to $gtkpath..."
		cp -R ./Themes/Yaru-$themeinstall* $gtkpath
		ln -s $gtkpath/Yaru-$themeinstall/gtk-3.0/assets $gtkpath/Yaru-$themeinstall-dark/gtk-3.0/
		ln -s $gtkpath/Yaru-$themeinstall/gtk-3.20/assets $gtkpath/Yaru-$themeinstall-dark/gtk-3.20/
		echo -e "${BWhi}Done...${RCol}"
        	break
        	;;
	    Pink) 
        	echo -e "${Yel}Please enter your theme path [$gtkpathdef]: ${RCol}" && read -e gtkpath
		gtkpath="${gtkpath:-$gtkpathdef}"
		echo -e "${Yel}Copying Yaru-$themeinstall to $gtkpath..."
		cp -R ./Themes/Yaru-$themeinstall* $gtkpath
		ln -s $gtkpath/Yaru-$themeinstall/gtk-3.0/assets $gtkpath/Yaru-$themeinstall-dark/gtk-3.0/
		ln -s $gtkpath/Yaru-$themeinstall/gtk-3.20/assets $gtkpath/Yaru-$themeinstall-dark/gtk-3.20/
		echo -e "${BWhi}Done...${RCol}"
        	break
        	;;
	    Purple) 
        	echo -e "${Yel}Please enter your theme path [$gtkpathdef]: ${RCol}" && read -e gtkpath
		gtkpath="${gtkpath:-$gtkpathdef}"
		echo -e "${Yel}Copying Yaru-$themeinstall to $gtkpath..."
		cp -R ./Themes/Yaru-$themeinstall* $gtkpath
		ln -s $gtkpath/Yaru-$themeinstall/gtk-3.0/assets $gtkpath/Yaru-$themeinstall-dark/gtk-3.0/
		ln -s $gtkpath/Yaru-$themeinstall/gtk-3.20/assets $gtkpath/Yaru-$themeinstall-dark/gtk-3.20/
		echo -e "${BWhi}Done...${RCol}"
        	break
        	;;
	    Red) 
        	echo -e "${Yel}Please enter your theme path [$gtkpathdef]: ${RCol}" && read -e gtkpath
		gtkpath="${gtkpath:-$gtkpathdef}"
		echo -e "${Yel}Copying Yaru-$themeinstall to $gtkpath..."
		cp -R ./Themes/Yaru-$themeinstall* $gtkpath
		ln -s $gtkpath/Yaru-$themeinstall/gtk-3.0/assets $gtkpath/Yaru-$themeinstall-dark/gtk-3.0/
		ln -s $gtkpath/Yaru-$themeinstall/gtk-3.20/assets $gtkpath/Yaru-$themeinstall-dark/gtk-3.20/
		echo -e "${BWhi}Done...${RCol}"
        	break
        	;;
	    Yellow) 
        	echo -e "${Yel}Please enter your theme path [$gtkpathdef]: ${RCol}" && read -e gtkpath
		gtkpath="${gtkpath:-$gtkpathdef}"
		echo -e "${Yel}Copying Yaru-$themeinstall to $gtkpath..."
		cp -R ./Themes/Yaru-$themeinstall* $gtkpath
		ln -s $gtkpath/Yaru-$themeinstall/gtk-3.0/assets $gtkpath/Yaru-$themeinstall-dark/gtk-3.0/
		ln -s $gtkpath/Yaru-$themeinstall/gtk-3.20/assets $gtkpath/Yaru-$themeinstall-dark/gtk-3.20/
		echo -e "${BWhi}Done...${RCol}"
        	break
        	;;
	     *)
		echo -e "${BYel}Like the first time: type 1-11${RCol}"
		;;
	  esac
	done
fi
###########################################################################################################
#Then select if the icon pack for the selected theme should also be installed
if [[ $packinstall = "no" ]]; then
  echo -e "${BWhi}Do you want to install an icon pack?${RCol}"
  select installicon in yes no
  do
    case $installicon in
	yes)
	    doiconinstall="yes"
	    break
            ;;
	no)
	    doiconinstall="no"
            break
	    ;;
        *)
            echo -e "${BYel}Really? Again? 1 or 2...nothing else, please${RCol}"
	    ;;
     esac
  done
fi
###########################################################################################################
#If yes, copy the right icon pack

  if [[ $doiconinstall = "yes" ]]; then
    echo -e "${BWhi}Do you want to install the icons for Yaru-$themeinstall?${RCol}"
    select installiconfit in yes no
    do
      case $installiconfit in
      	yes)
	    echo -e "${Yel}Please enter your icon path [$iconpathdef]: ${RCol}" && read -e iconpath
	    iconpath="${iconpath:-$iconpathdef}"
            echo -e "${Yel}Copying Yaru-$themeinstall's icon pack to $iconpath...${RCol}"
	    cp -R ./Icons/Yaru-$themeinstall $iconpath
	    echo -e "${BWhi}Done...${RCol}"
	    selecticon="false"
	    break
            ;;
	no)
	    selecticon="true"
	    break
	    ;;
	*)
	    echo -e "${BYel}C'mon...1 or 2, it isn't that hard, isn't it?${RCol}"
    esac
  done
fi
###########################################################################################################
#If no, select which icon pack should be installed - or do 'nothing'

  if [[ $selecticon = "true" ]]; then
    echo -e "${BWhi}Which one do you want to install?"
    select selecticoninstall in Aqua Blue Brown Deepblue Green Grey MATE Pink Purple Red Yellow Nothing
    do
      case $selecticoninstall in
	Aqua)
	    echo -e "${Yel}Please enter your icon path [$iconpathdef]: ${RCol}" && read -e iconpath
	    iconpath="${iconpath:-$iconpathdef}"
	    echo -e "${Yel}Copying Yaru-$selecticoninstall icon pack to $iconpath"
	    echo -e "${BWhi}Done...${RCol}"
	    break
            ;;
	Blue)
	    echo -e "${Yel}Please enter your icon path [$iconpathdef]: ${RCol}" && read -e iconpath
	    iconpath="${iconpath:-$iconpathdef}"
	    echo -e "${Yel}Copying Yaru-$selecticoninstall icon pack to $iconpath"
	    echo -e "${BWhi}Done...${RCol}"
	    break
            ;;
	Brown)
	    echo -e "${Yel}Please enter your icon path [$iconpathdef]: ${RCol}" && read -e iconpath
	    iconpath="${iconpath:-$iconpathdef}"
	    echo -e "${Yel}Copying Yaru-$selecticoninstall icon pack to $iconpath"
	    echo -e "${BWhi}Done...${RCol}"
	    break
            ;;
	Deepblue)
	    echo -e "${Yel}Please enter your icon path [$iconpathdef]: ${RCol}" && read -e iconpath
	    iconpath="${iconpath:-$iconpathdef}"
	    echo -e "${Yel}Copying Yaru-$selecticoninstall icon pack to $iconpath"
	    echo -e "${BWhi}Done...${RCol}"
	    break
            ;;
	Green)
	    echo -e "${Yel}Please enter your icon path [$iconpathdef]: ${RCol}" && read -e iconpath
	    iconpath="${iconpath:-$iconpathdef}"
	    echo -e "${Yel}Copying Yaru-$selecticoninstall icon pack to $iconpath"
	    echo -e "${BWhi}Done...${RCol}"
	    break
            ;;
	Grey)
	    echo -e "${Yel}Please enter your icon path [$iconpathdef]: ${RCol}" && read -e iconpath
	    iconpath="${iconpath:-$iconpathdef}"
	    echo -e "${Yel}Copying Yaru-$selecticoninstall icon pack to $iconpath"
	    echo -e "${BWhi}Done...${RCol}"
	    break
            ;;
	MATE)
	    echo -e "${Yel}Please enter your icon path [$iconpathdef]: ${RCol}" && read -e iconpath
	    iconpath="${iconpath:-$iconpathdef}"
	    echo -e "${Yel}Copying Yaru-$selecticoninstall icon pack to $iconpath"
	    echo -e "${BWhi}Done...${RCol}"
	    break
            ;;
	Pink)
	    echo -e "${Yel}Please enter your icon path [$iconpathdef]: ${RCol}" && read -e iconpath
	    iconpath="${iconpath:-$iconpathdef}"
	    echo -e "${Yel}Copying Yaru-$selecticoninstall icon pack to $iconpath"
	    echo -e "${BWhi}Done...${RCol}"
	    break
            ;;
	Purple)
	    echo -e "${Yel}Please enter your icon path [$iconpathdef]: ${RCol}" && read -e iconpath
	    iconpath="${iconpath:-$iconpathdef}"
	    echo -e "${Yel}Copying Yaru-$selecticoninstall icon pack to $iconpath"
	    echo -e "${BWhi}Done...${RCol}"
	    break
            ;;
	Red)
	    echo -e "${Yel}Please enter your icon path [$iconpathdef]: ${RCol}" && read -e iconpath
	    iconpath="${iconpath:-$iconpathdef}"
	    echo -e "${Yel}Copying Yaru-$selecticoninstall icon pack to $iconpath"
	    echo -e "${BWhi}Done...${RCol}"
	    break
            ;;
	Yellow)
	    echo -e "${Yel}Please enter your icon path [$iconpathdef]: ${RCol}" && read -e iconpath
	    iconpath="${iconpath:-$iconpathdef}"
	    echo -e "${Yel}Copying Yaru-$selecticoninstall icon pack to $iconpath"
	    echo -e "${BWhi}Done...${RCol}"
	    break
            ;;
	Nothing)
	    echo -e "${Yel}Okay, no icon pack will be installed"
	    break
            ;;
	*)
	    echo -e "${BYel}Once again - please, please, please, type one of the listed numbers!"
	    ;;
    esac
  done
	     	

fi

##############################
#
# Install Yaru-Color shell theme as system standard
#
###########################################################################################################
#Check if Ubuntu >18.10's Yaru gnome-shell theme is installed AND this script as user.
if [[ -d "/usr/share/gnome-shell/theme/Yaru" && $isroot = "false" ]]; then
    echo -e ""
    sleep 1
    echo -e "${BGre}I see, Ubuntu Yaru Gnome-Shell is already installed in '/usr/share/gnome-shell/theme/Yaru'.\nFor better compatibility I recommend to install the selected theme as standard gnome-shell theme which replaces '/usr/share/gnome-shell/theme/Yaru'.\n For this, you need to re run this script as root.\nOr do it manually (see readme).${RCol}"| fold -s
    echo -e ""
    sleep 3
fi

if [[ -d "/usr/share/gnome-shell/theme/Yaru" && $isroot = "true" ]]; then 
###########################################################################################################
#Check if Ubuntu >18.10's Yaru gnome-shell theme is installed AND this script runs with root privileges
#This is needed for changing the login screen background color (this purple gradient).
    echo -e ""
    sleep 1
    echo -e "${BGre}I see, Ubuntu Yaru Gnome-Shell is already installed in '/usr/share/gnome-shell/theme/Yaru'.\nFor better compatibility I recommend to install the selected theme as standard gnome-shell theme which replaces '/usr/share/gnome-shell/theme/Yaru'.\n No worries, this script will create a backup in '/usr/share/gnome-shell/theme/' called 'Yaru-BACKUP'${RCol}"| fold -s
    echo -e ""
    sleep 3
    echo -e "${BWhi}Do you want to do this now?${RCol}"
    
###########################################################################################################
#If one theme is installed, and not the whole pack, install shell theme

    
    select origshell in yes no;
    do
      case $origshell in
         yes)
	    if [[ $packinstall == "yes" ]]; then
	       packshell="true"
	    elif [[ $packinstall = "no" ]]; then
	      echo -e "${Yel}Creating backup...${RCol}"
          	mv /usr/share/gnome-shell/theme/Yaru /usr/share/gnome-shell/theme/Yaru-BACKUP
        	sleep 1
        	echo -e "${Yel}Done.${RCol}"
        	sleep 0.3
	 	 if [ -d "/usr/share/gnome-shell/theme/Yaru-BACKUP" ]
          	  then echo -e "${Yel}Copying Yaru-$themeinstall files...${RCol}"
          	  cp -R ./Themes/Yaru-$themeinstall/gnome-shell /usr/share/gnome-shell/theme/Yaru
          	  sleep 1
          	  echo -e "${Yel}Done.${RCol}"
         	 else 
          	  echo -e "${BRed}Something went wrong!"
          	  echo -e "Check /usr/share/gnome-shell/theme"
        	  echo -e "The Yaru-Backup directory doesn't exist!"
        	  echo -e "Stopping here${RCol}"
	 	 fi
		fi
	       break
	       ;;
         no)
             echo -e "${Yel}Okay, nothing will be changed."
             break
             ;;
          *)
             echo -e "${BYel}Really? Again? Hmpf, type 1 or 2, nothing else!${RCol}"
             ;;
      esac
    done 
fi

###########################################################################################################
#If the whole pack was installed, select which shell theme should be installed
    if [[ $packshell = "true" ]]; then
    
     echo -e "${Yel}Creating backup...${RCol}"
     mv /usr/share/gnome-shell/theme/Yaru /usr/share/gnome-shell/theme/Yaru-BACKUP
     sleep 1
     ### Check if backup was created, if not, exit
	if [ -d "/usr/share/gnome-shell/theme/Yaru-BACKUP" ]; then
	  echo -e "${Yel}Done. Backup created under /usr/share/gnome-shell/theme/Yaru-BACKUP${RCol}"
	 else 
          echo -e "${BRed}Something went wrong!"
          echo -e "Check /usr/share/gnome-shell/theme"
          echo -e "The Yaru-Backup directory doesn't exist!"
          echo -e "Stopping here${RCol}"
          exit
        fi 

### Select theme
    echo -e "${BWhi}Please select which themed shell theme you want to install: ${RCol}"
    select origshellcolor in Aqua Blue Brown Deepblue Green Grey MATE Pink Purple Red Yellow
    do
      case $origshellcolor in
	Aqua) 
	    echo -e "${Yel}Copying files from Yaru-$origshellcolor/gnome-shell to /usr/share/gnome-shell/theme/Yaru${RCol}"
	    cp -R ./Themes/Yaru-$origshellcolor/gnome-shell /usr/share/gnome-shell/theme/Yaru
	    echo -e "${BWhi}Done...${RCol}"
            break
	    ;;
	Blue)
	    echo -e "${Yel}Copying files from Yaru-$origshellcolor/gnome-shell to /usr/share/gnome-shell/theme/Yaru${RCol}"
	    cp -R ./Themes/Yaru-$origshellcolor/gnome-shell /usr/share/gnome-shell/theme/Yaru
	    echo -e "${BWhi}Done...${RCol}"
            break
	    ;;
	Brown)
	    echo -e "${Yel}Copying files from Yaru-$origshellcolor/gnome-shell to /usr/share/gnome-shell/theme/Yaru${RCol}"
	    cp -R ./Themes/Yaru-$origshellcolor/gnome-shell /usr/share/gnome-shell/theme/Yaru
	    echo -e "${BWhi}Done...${RCol}"
            break
	    ;;
	Deepblue)
	    echo -e "${Yel}Copying files from Yaru-$origshellcolor/gnome-shell to /usr/share/gnome-shell/theme/Yaru${RCol}"
	    cp -R ./Themes/Yaru-$origshellcolor/gnome-shell /usr/share/gnome-shell/theme/Yaru
	    echo -e "${BWhi}Done...${RCol}"
            break
	    ;;
	Green)
	    echo -e "${Yel}Copying files from Yaru-$origshellcolor/gnome-shell to /usr/share/gnome-shell/theme/Yaru${RCol}"
	    cp -R ./Themes/Yaru-$origshellcolor/gnome-shell /usr/share/gnome-shell/theme/Yaru
	    echo -e "${BWhi}Done...${RCol}"
            break
	    ;;
	Grey)
	    echo -e "${Yel}Copying files from Yaru-$origshellcolor/gnome-shell to /usr/share/gnome-shell/theme/Yaru${RCol}"
	    cp -R ./Themes/Yaru-$origshellcolor/gnome-shell /usr/share/gnome-shell/theme/Yaru
	    echo -e "${BWhi}Done...${RCol}"
            break
	    ;;
	MATE)
	    echo -e "${Yel}Copying files from Yaru-$origshellcolor/gnome-shell to /usr/share/gnome-shell/theme/Yaru${RCol}"
	    cp -R ./Themes/Yaru-$origshellcolor/gnome-shell /usr/share/gnome-shell/theme/Yaru
	    echo -e "${BWhi}Done...${RCol}"
            break
	    ;;
	Pink)
	    echo -e "${Yel}Copying files from Yaru-$origshellcolor/gnome-shell to /usr/share/gnome-shell/theme/Yaru${RCol}"
	    cp -R ./Themes/Yaru-$origshellcolor/gnome-shell /usr/share/gnome-shell/theme/Yaru
	    echo -e "${BWhi}Done...${RCol}"
            break
	    ;;
	Purple)
	    echo -e "${Yel}Copying files from Yaru-$origshellcolor/gnome-shell to /usr/share/gnome-shell/theme/Yaru${RCol}"
	    cp -R ./Themes/Yaru-$origshellcolor/gnome-shell /usr/share/gnome-shell/theme/Yaru
	    echo -e "${BWhi}Done...${RCol}"
            break
	    ;;
	Red)
	    echo -e "${Yel}Copying files from Yaru-$origshellcolor/gnome-shell to /usr/share/gnome-shell/theme/Yaru${RCol}"
	    cp -R ./Themes/Yaru-$origshellcolor/gnome-shell /usr/share/gnome-shell/theme/Yaru
	    echo -e "${BWhi}Done...${RCol}"
            break
	    ;;
	Yellow)
	    echo -e "${Yel}Copying files from Yaru-$origshellcolor/gnome-shell to /usr/share/gnome-shell/theme/Yaru${RCol}"
	    cp -R ./Themes/Yaru-$origshellcolor/gnome-shell /usr/share/gnome-shell/theme/Yaru
	    echo -e "${BWhi}Done...${RCol}"
            break
	    ;;
	Nothing)
            echo -e "${Yel}Okay, nothing will be copied${RCol}"
            break
            ;;
	*)  echo -e "${BYel}I don't understand you....1-12, is this THAT hard?"
     esac
   done
fi
echo -e " "
echo -e "${Yel}All things copied.${RCol}"  
echo -e "${BYel}You can cancel this script with CTRL+C${RCol}"
echo -e "${BYel}Or follow the next steps to enable what you want${RCol}"
echo -e " "



##################
##################
#                #
# ENABLE SECTION #
#                #
##################
##################


###########################################################################################################
#Choose if enable the GTK theme

    if [[ $packinstall = "yes" ]]; then
    echo -e "${BWhi}Do you want to enable a GTK theme?${RCol}"
### Select theme
    select enablecolor in No Aqua Blue Brown Deepblue Green Grey MATE Pink Purple Red Yellow
    do
      case $enablecolor in
	Aqua) 
            echo -e "${BGre}Okay, countdown of T-3 seconds for Yaru-$themeinstall!${RCol}"
            sleep 0.5
            echo -e "${BGre}3${RCol}"
            sleep 1
            echo -e "${BGre}2${RCol}"
            sleep 1
            echo -e "${BGre}1${RCol}"
            sleep 1
            echo -e "${BGre}IGNITION${RCol}"
	    #Run the gsettings command and supress errors, for this the user name is relevant
	    sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-Aqua' 2> /dev/null
	    echo -e "${BGre}AND LIFT OFF!${RCol}"
	    sleep 1
            break
            ;;
	Blue) 
            echo -e "${BGre}Okay, countdown of T-3 seconds for Yaru-$themeinstall!${RCol}"
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
	Brown) 
            echo -e "${BGre}Okay, countdown of T-3 seconds for Yaru-$themeinstall!${RCol}"
            sleep 0.5
            echo -e "${BGre}3${RCol}"
            sleep 1
            echo -e "${BGre}2${RCol}"
            sleep 1
            echo -e "${BGre}1${RCol}"
            sleep 1
            echo -e "${BGre}IGNITION${RCol}"
	    #Run the gsettings command and supress errors, for this the user name is relevant
	    sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-Brown' 2> /dev/null
	    echo -e "${BGre}AND LIFT OFF!${RCol}"
	    sleep 1
            break
            ;;
	Deepblue) 
            echo -e "${BGre}Okay, countdown of T-3 seconds for Yaru-$themeinstall!${RCol}"
            sleep 0.5
            echo -e "${BGre}3${RCol}"
            sleep 1
            echo -e "${BGre}2${RCol}"
            sleep 1
            echo -e "${BGre}1${RCol}"
            sleep 1
            echo -e "${BGre}IGNITION${RCol}"
	    #Run the gsettings command and supress errors, for this the user name is relevant
	    sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-Deepblue' 2> /dev/null
	    echo -e "${BGre}AND LIFT OFF!${RCol}"
	    sleep 1
            break
            ;;
	Green) 
            echo -e "${BGre}Okay, countdown of T-3 seconds for Yaru-$themeinstall!${RCol}"
            sleep 0.5
            echo -e "${BGre}3${RCol}"
            sleep 1
            echo -e "${BGre}2${RCol}"
            sleep 1
            echo -e "${BGre}1${RCol}"
            sleep 1
            echo -e "${BGre}IGNITION${RCol}"
	    #Run the gsettings command and supress errors, for this the user name is relevant
	    sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-Green' 2> /dev/null
	    echo -e "${BGre}AND LIFT OFF!${RCol}"
	    sleep 1
            break
            ;;
	Grey) 
            echo -e "${BGre}Okay, countdown of T-3 seconds for Yaru-$themeinstall!${RCol}"
            sleep 0.5
            echo -e "${BGre}3${RCol}"
            sleep 1
            echo -e "${BGre}2${RCol}"
            sleep 1
            echo -e "${BGre}1${RCol}"
            sleep 1
            echo -e "${BGre}IGNITION${RCol}"
	    #Run the gsettings command and supress errors, for this the user name is relevant
	    sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-Grey' 2> /dev/null
	    echo -e "${BGre}AND LIFT OFF!${RCol}"
	    sleep 1
            break
            ;;
	MATE) 
            echo -e "${BGre}Okay, countdown of T-3 seconds for Yaru-$themeinstall!${RCol}"
            sleep 0.5
            echo -e "${BGre}3${RCol}"
            sleep 1
            echo -e "${BGre}2${RCol}"
            sleep 1
            echo -e "${BGre}1${RCol}"
            sleep 1
            echo -e "${BGre}IGNITION${RCol}"
	    #Run the gsettings command and supress errors, for this the user name is relevant
	    sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-MATE' 2> /dev/null
	    echo -e "${BGre}AND LIFT OFF!${RCol}"
	    sleep 1
            break
            ;;
	Pink) 
            echo -e "${BGre}Okay, countdown of T-3 seconds for Yaru-$themeinstall!${RCol}"
            sleep 0.5
            echo -e "${BGre}3${RCol}"
            sleep 1
            echo -e "${BGre}2${RCol}"
            sleep 1
            echo -e "${BGre}1${RCol}"
            sleep 1
            echo -e "${BGre}IGNITION${RCol}"
	    #Run the gsettings command and supress errors, for this the user name is relevant
	    sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-Pink' 2> /dev/null
	    echo -e "${BGre}AND LIFT OFF!${RCol}"
	    sleep 1
            break
            ;;
	Purple) 
            echo -e "${BGre}Okay, countdown of T-3 seconds for Yaru-$themeinstall!${RCol}"
            sleep 0.5
            echo -e "${BGre}3${RCol}"
            sleep 1
            echo -e "${BGre}2${RCol}"
            sleep 1
            echo -e "${BGre}1${RCol}"
            sleep 1
            echo -e "${BGre}IGNITION${RCol}"
	    #Run the gsettings command and supress errors, for this the user name is relevant
	    sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-Purple' 2> /dev/null
	    echo -e "${BGre}AND LIFT OFF!${RCol}"
	    sleep 1
            break
            ;;
	Red) 
            echo -e "${BGre}Okay, countdown of T-3 seconds for Yaru-$themeinstall!${RCol}"
            sleep 0.5
            echo -e "${BGre}3${RCol}"
            sleep 1
            echo -e "${BGre}2${RCol}"
            sleep 1
            echo -e "${BGre}1${RCol}"
            sleep 1
            echo -e "${BGre}IGNITION${RCol}"
	    #Run the gsettings command and supress errors, for this the user name is relevant
	    sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-Red' 2> /dev/null
	    echo -e "${BGre}AND LIFT OFF!${RCol}"
	    sleep 1
            break
            ;;
	Yellow) 
            echo -e "${BGre}Okay, countdown of T-3 seconds for Yaru-$themeinstall!${RCol}"
            sleep 0.5
            echo -e "${BGre}3${RCol}"
            sleep 1
            echo -e "${BGre}2${RCol}"
            sleep 1
            echo -e "${BGre}1${RCol}"
            sleep 1
            echo -e "${BGre}IGNITION${RCol}"
	    #Run the gsettings command and supress errors, for this the user name is relevant
	    sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-Yellow' 2> /dev/null
	    echo -e "${BGre}AND LIFT OFF!${RCol}"
	    sleep 1
            break
            ;;
	No)
            echo -e "${Yel}Fine, less work for me and less fun for you.${RCol}"
            break
            ;;
	*)  echo -e "${BYel}................again???${RCol}"
     esac
   done
fi

echo -e " "
if [[ $packinstall = "no" ]]; then
echo -e "${BWhi}Do you want to enable the GTK theme?${RCol}"
select setgtk in yes no
  do 
    case $setgtk in
      yes)
        echo -e "${BGre}Okay, countdown of T-3 seconds for Yaru-$themeinstall!"
        sleep 0.5
        echo -e "${BGre}3${RCol}"
        sleep 1
        echo -e "${BGre}2${RCol}"
        sleep 1
        echo -e "${BGre}1${RCol}"
        sleep 1
        echo -e "${BGre}IGNITION${RCol}"
	#Run the gsettings command and supress errors, for this the user name is relevant
	if [[ $themeinstall = "Aqua" ]]
		then sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-Aqua' 2> /dev/null
	elif [[ $themeinstall = "Blue" ]]
		then sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-Blue' 2> /dev/null
	elif [[ $themeinstall = "Brown" ]]
		then sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-Brown' 2> /dev/null
	elif [[ $themeinstall = "Deepblue" ]]
		then sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-Deepblue' 2> /dev/null
	elif [[ $themeinstall = "Green" ]]
		then sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-Green' 2> /dev/null
	elif [[ $themeinstall = "Grey" ]]
		then sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-Grey' 2> /dev/null
	elif [[ $themeinstall = "MATE" ]]
		then sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-MATE' 2> /dev/null
	elif [[ $themeinstall = "Pink" ]]
		then sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-Pink' 2> /dev/null
	elif [[ $themeinstall = "Purple" ]]
		then sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-Purple' 2> /dev/null
	elif [[ $themeinstall = "Red" ]]
		then sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-Red' 2> /dev/null
	elif [[ $themeinstall = "Yellow" ]]
		then sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-Yellow' 2> /dev/null
		
	fi
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

echo -e " "

elif [[ $packinstall = "yes" ]]; then
#choose if dock should also be themed
echo -e "${BWhi}Do you also want to theme the Ubuntu dock? (indicators)${RCol}"
echo -e "${BWhi}You can revert and change the colors with the script 'dockcolor.sh'${RCol}"

echo -e " "
### If yes, select color
  select dockchoosecolor in NOPE Aqua Blue Brown Deepblue Green Grey MATE Pink Purple Red Yellow 
  do
    case $dockchoosecolor in
      Aqua)
	   echo -e "${BGre}Okay, let's set the indicator color to Aqua...${RCol}"
	   sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-running-dots-color '#41c6c8' 2> /dev/null
	   sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-running-dots-border-color '#41c6c8' 2> /dev/null
	   sleep 0.5
	   echo -e "${BGre}Aww, look there, aqua colored dots!${RCol}"
	   break
	   ;;
      Blue)
	   echo -e "${BGre}Okay, let's set the indicator color to Blue...${RCol}"
	   sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-running-dots-color '#208fe9' 2> /dev/null
	   sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-running-dots-border-color '#208fe9' 2> /dev/null
	   sleep 0.5
	   echo -e "${BGre}Aww, look there, blue colored dots!${RCol}"
	   break
	   ;;
      Brown)
	   echo -e "${BGre}Okay, let's set the indicator color to Aqua...${RCol}"
	   sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-running-dots-color '#995640' 2> /dev/null
	   sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-running-dots-border-color '#995640' 2> /dev/null
	   sleep 0.5
	   echo -e "${BGre}Aww, look there, brown colored dots!${RCol}"
	   break
	   ;;
      Deepblue)
	   echo -e "${BGre}Okay, let's set the indicator color to Deepblue...${RCol}"
	   sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-running-dots-color '#25469d' 2> /dev/null
	   sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-running-dots-border-color '#25469d' 2> /dev/null
	   sleep 0.5
	   echo -e "${BGre}Aww, look there, deep blue colored dots!${RCol}"
	   break
	   ;;
      Green)
	   echo -e "${BGre}Okay, let's set the indicator color to Green...${RCol}"
	   sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-running-dots-color '#3eb34f' 2> /dev/null
	   sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-running-dots-border-color '#3eb34f' 2> /dev/null
	   sleep 0.5
	   echo -e "${BGre}Aww, look there, green colored dots!${RCol}"
	   break
	   ;;
      Grey)
	   echo -e "${BGre}Okay, let's set the indicator color to Grey...${RCol}"
	   sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-running-dots-color '#9c9c9c' 2> /dev/null
	   sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-running-dots-border-color '#3eb39c9c9c4f' 2> /dev/null
	   sleep 0.5
	   echo -e "${BGre}Aww, look there, grey dots!${RCol}"
	   break
	   ;;
      MATE)
	   echo -e "${BGre}Okay, let's set the indicator color to MATE...${RCol}"
	   sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-running-dots-color '#78ab50' 2> /dev/null
	   sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-running-dots-border-color '#78ab50' 2> /dev/null
	   sleep 0.5
	   echo -e "${BGre}Aww, look there, MATE styled dots!${RCol}"
	   break
	   ;;
      Pink)
	   echo -e "${BGre}Okay, let's set the indicator color to Pink...${RCol}"
	   sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-running-dots-color '#e920a3' 2> /dev/null
	   sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-running-dots-border-color '#e920a3' 2> /dev/null
	   sleep 0.5
	   echo -e "${BGre}Aww, look there, pink colored dots!${RCol}"
	   break
	   ;;
      Purple)
	   echo -e "${BGre}Okay, let's set the indicator color to Purple...${RCol}"
	   sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-running-dots-color '#a064d8' 2> /dev/null
	   sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-running-dots-border-color '#a064d8' 2> /dev/null
	   sleep 0.5
	   echo -e "${BGre}Aww, look there, purple colored dots!${RCol}"
	   break
	   ;;
      Red)
	   echo -e "${BGre}Okay, let's set the indicator color to Red...${RCol}"
	   sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-running-dots-color '#e92020' 2> /dev/null
	   sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-running-dots-border-color '#e92020' 2> /dev/null
	   sleep 0.5
	   echo -e "${BGre}Aww, look there, Red colored dots!${RCol}"
	   break
	   ;;
      Yellow)
	   echo -e "${BGre}Okay, let's set the indicator color to Yellow...${RCol}"
	   sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-running-dots-color '#e9ba20' 2> /dev/null
	   sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-running-dots-border-color '#e9ba20' 2> /dev/null
	   sleep 0.5
	   echo -e "${BGre}Aww, look there, Yellow colored dots!${RCol}"
	   break
	   ;;
	NOPE)
	   echo -e "${BGre}Okay, the indicators won't be touched${RCol}"
	   break
           ;;       
	*)
	   echo -e "${BYel}You know what? I should set EVERYTHING to black. Just for fun...please select 1-12!${RCol}"
	   break
	   ;;
    esac
  done
fi

echo -e " "
#check if icons are installed and ask if they should be enabled
if [[ $packinstall = "yes" ]]; then
echo -e "${BWhi}And last but not least, do you want to enable an icon pack?"${RCol}
  select iconcolor in None Aqua Blue Brown Deepblue Green Grey MATE Pink Purple Red Yellow 
    do
      case $iconcolor in
	None)
	    echo -e "${Yel}That's okay, if you want to miss something...${RCol}"
	    break
	    ;;
	Aqua)
	    echo -e "${Yel}Setting Yaru-Aqua icons...${RCol}"
	    sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.desktop.interface icon-theme 'Yaru-Aqua' 2> /dev/null
	    sleep 0.5
	    echo -e "${BGre}Done!${RCol}"
	    break
	    ;;
	Blue)
	    echo -e "${Yel}Setting Yaru-Blue icons...${RCol}"
	    sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.desktop.interface icon-theme 'Yaru-Blue' 2> /dev/null
	    sleep 0.5
	    echo -e "${BGre}Done!${RCol}"
	    break
	    ;;
	Brown)
	    echo -e "${Yel}Setting Yaru-Brown icons...${RCol}"
	    sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.desktop.interface icon-theme 'Yaru-Brown' 2> /dev/null
	    sleep 0.5
	    echo -e "${BGre}Done!${RCol}"
	    break
	    ;;
	Deepblue)
	    echo -e "${Yel}Setting Yaru-Deepblue icons...${RCol}"
	    sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.desktop.interface icon-theme 'Yaru-Deepblue' 2> /dev/null
	    sleep 0.5
	    echo -e "${BGre}Done!${RCol}"
	    break
	    ;;
	Green)
	    echo -e "${Yel}Setting Yaru-Green icons...${RCol}"
	    sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.desktop.interface icon-theme 'Yaru-Green' 2> /dev/null
	    sleep 0.5
	    echo -e "${BGre}Done!${RCol}"
	    break
	    ;;
	Grey)
	    echo -e "${Yel}Setting Yaru-Grey icons...${RCol}"
	    sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.desktop.interface icon-theme 'Yaru-Grey' 2> /dev/null
	    sleep 0.5
	    echo -e "${BGre}Done!${RCol}"
	    break
	    ;;
	MATE)
	    echo -e "${Yel}Setting Yaru-MATE icons...${RCol}"
	    sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.desktop.interface icon-theme 'Yaru-MATE' 2> /dev/null
	    sleep 0.5
	    echo -e "${BGre}Done!${RCol}"
	    break
	    ;;
	Pink)
	    echo -e "${Yel}Setting Yaru-Pink icons...${RCol}"
	    sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.desktop.interface icon-theme 'Yaru-Pink' 2> /dev/null
	    sleep 0.5
	    echo -e "${BGre}Done!${RCol}"
	    break
	    ;;
	Purple)
	    echo -e "${Yel}Setting Yaru-Purple icons...${RCol}"
	    sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.desktop.interface icon-theme 'Yaru-Purple' 2> /dev/null
	    sleep 0.5
	    echo -e "${BGre}Done!${RCol}"
	    break
	    ;;
	Red)
	    echo -e "${Yel}Setting Yaru-Red icons...${RCol}"
	    sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.desktop.interface icon-theme 'Yaru-Red' 2> /dev/null
	    sleep 0.5
	    echo -e "${BGre}Done!${RCol}"
	    break
	    ;;
	Yellow)
	    echo -e "${Yel}Setting Yaru-Yellow icons...${RCol}"
	    sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.desktop.interface icon-theme 'Yaru-Yellow' 2> /dev/null
	    sleep 0.5
	    echo -e "${BGre}Done!${RCol}"
	    break
	    ;;
        esac
     done
fi

echo -e " "
### if the whole pack wasn't installed....
if [[ $packinstall = "no" ]]; then
echo -e "${BWhi}And last but not least, do you want to enable the installed icon pack?"${RCol}
select seticon in yes no
  do 
    case $seticon in
      yes)
        echo -e "${BGre}Okay, setting Yaru-$themeinstall icons..."
        sleep 0.5
	#Run the gsettings command and supress errors, for this the user name is relevant
	if [[ $themeinstall = "Aqua" ]]; then
	  sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.desktop.interface icon-theme 'Yaru-Aqua' 2> /dev/null
	elif [[ $themeinstall = "Blue" ]]; then
	  sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.desktop.interface icon-theme 'Yaru-Blue' 2> /dev/null
	elif [[ $themeinstall = "Brown" ]]; then
	  sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.desktop.interface icon-theme 'Yaru-Brown' 2> /dev/null
	elif [[ $themeinstall = "Deepblue" ]]; then
	  sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.desktop.interface icon-theme 'Yaru-Deepblue' 2> /dev/null
	elif [[ $themeinstall = "Green" ]]; then
	  sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.desktop.interface icon-theme 'Yaru-Green' 2> /dev/null
	elif [[ $themeinstall = "Grey" ]]; then
	  sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.desktop.interface icon-theme 'Yaru-Grey' 2> /dev/null
	elif [[ $themeinstall = "MATE" ]]; then
	  sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.desktop.interface icon-theme 'Yaru-MATE' 2> /dev/null
	elif [[ $themeinstall = "Pink" ]]; then
	  sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.desktop.interface icon-theme 'Yaru-Pink' 2> /dev/null
	elif [[ $themeinstall = "Purple" ]]; then
	  sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.desktop.interface icon-theme 'Yaru-Purple' 2> /dev/null
	elif [[ $themeinstall = "Red" ]]; then
	  sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.desktop.interface icon-theme 'Yaru-Red' 2> /dev/null
	elif [[ $themeinstall = "Yellow" ]]; then
	  sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.desktop.interface icon-theme 'Yaru-Yellow' 2> /dev/null
	fi
	sleep 1
	echo -e "${BYel}Done.${RCol}"
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

             
echo -e " "
echo -e "${BGre} We're done!${RCol}"
echo -e " "
echo -e "${BGre}For setting the shell theme, enable the Gnome extension 'user-theme'\n and set a theme using gnome-tweak-tool${RCol}"
echo -e "${Yel}If you want to uninstall it, just run my uninstall.sh script as root!${RCol}"
sleep 0.5
echo -e "${Yel}To change the dock indicator, please run dockcolor.sh.${RCol}"
echo -e "${BCya}Bye bye!${RCol}"

echo -e "${BCya}...and thanks for choosing my Yaru-Colors pack!${RCol}" 
sleep 1
               
  
        
