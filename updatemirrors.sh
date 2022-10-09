#!/usr/bin/env bash

# ***************************************
# * Author: 4r6h/Rahat		        *
# * github: https://www.github.com/4r6h *
# ***************************************

shopt -s extglob

   Off='\033[0m'	     # Text Reset

   # Regular Colors
   Black='\033[0;30m'        # Black
   Red='\033[0;31m'          # Red
   Green='\033[0;32m'        # Green
   Yellow='\033[0;33m'       # Yellow
   Blue='\033[0;34m'         # Blue
   Purple='\033[0;35m'       # Purple
   Cyan='\033[0;36m'         # Cyan
   White='\033[0;37m'        # White

   # Bold
   BBlack='\033[1;30m'       # Black
   BRed='\033[1;31m'         # Red
   BGreen='\033[1;32m'       # Green
   BYellow='\033[1;33m'      # Yellow
   BBlue='\033[1;34m'        # Blue
   BPurple='\033[1;35m'      # Purple
   BCyan='\033[1;36m'        # Cyan
   BWhite='\033[1;37m'       # White



# Defining Bangladesh Mirror.

	Bangladesh='Server = http://mirror.xeonbd.com/archlinux/$repo/os/$arch' 

# Path to Pacman Mirrorlist.

	mirrorlist='/etc/pacman.d/mirrorlist' 


updatemirrors() {

# Rates Mirrors For Best Speed.

	sudo reflector --latest 200 --protocol http,https --sort rate --save $mirrorlist 

# Deletes the Bangladesh Mirror.

	sudo sed -i '/xeonbd/d' $mirrorlist 

# Add Bangladesh mirror at the top in first position.

	sudo sed -i.4r6h "1,/^Server/ {/^Server/i\
	$Bangladesh
	}" $mirrorlist
}


on_parallel() {

# Add parallel downloading

while true 
do
	echo -e "${BGreen}\n How many parallel downloadings do you want?\n select between 5 to 12 or press enter for default.\n"

		read -r -p " Insert a number: [0m" INPUT
		
				case "$INPUT" in
					
					$ENTER)	
						sudo sed -i.4r6h "s/^ParallelDownloads.*/ParallelDownloads = 5/" /etc/pacman.conf

					echo -e "${BGreen}\n Upgrading Mirrors also enabled 5 parallel downloadings.\n"	
											
											break ;;
					[0-4])
						echo -e "${BRed}\n Don't use less than 5 downloadings! \n" ;;
					
					[5-9]|1[0-2])

						sudo sed -i.4r6h "s/^ParallelDownloads.*/ParallelDownloads = $INPUT/" /etc/pacman.conf

					echo -e "${BGreen}\n Upgrading Mirrors also enabled $INPUT parallel downloadings.\n"	

											break ;;
					( +([[:digit:]]) )

						echo -e "${BRed}\n Don't use more than 12 downloadings! \n" ;;

					*) 
						echo -e "${BRed}\n Error! You should give a whole number!\n" ;;
				esac
done

}

main() {

# Defining who can run the script.


if [[ -z $(which pacman) ]]; then
			
			echo -e "${BRed}\nThis script only works for ${BCyan}Arch Linux ${BRed}based systems.\n"
			exit 0;
else

		if [[ -z $(which reflector) ]]; then
			
			echo -e "${BRed}\nReflactor not installed in your system.\n"
			echo -e "${BGreen}Installing reflactor in your system.\n"
			sudo pacman -S --noconfirm --needed reflector
		fi
	
	while true 
	do

		echo -e "${BGreen}\n Do you want to add parallel downloadings?\n"
	
		read -r -p " Choose an option to continue: [Y/n] [0m" para
		
			case "$para" in
				[Yy]|[Yy][Ee][Ss]|$ENTER)
					
					on_parallel

					updatemirrors  
							break ;;

				[Nn]|[Nn][Oo])
				
					echo -e "${BGreen}\n Upgrading Mirrors without parallel downloadings.\n"	
				
					updatemirrors 
							break ;;
				*)
					echo -e "${BRed}\n $para is invalid input....\n${Off}"
			esac
	done
fi

}

main
