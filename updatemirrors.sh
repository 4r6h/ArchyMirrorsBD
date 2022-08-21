#!/usr/bin/env bash

# ***************************************
# * Author: 4r6h/Rahat		        *
# * github: https://www.github.com/4r6h *
# ***************************************

shopt -s extglob

# Defining Bangladesh Mirror.

	Bangladesh='Server = http://mirror.xeonbd.com/archlinux/$repo/os/$arch' 

# Path to Pacman Mirrorlist.

	mirrorlist='/etc/pacman.d/mirrorlist' 


updatemirrors() {

# Rates Mirrors For Best Speed.

	reflector --latest 200 --protocol http,https --sort rate --save $mirrorlist 

# Deletes the Bangladesh Mirror.

	sed -i '/xeonbd/d' $mirrorlist 

# Add Bangladesh mirror at the top in first position.

	sed -i.4r6h "1,/^Server/ {/^Server/i\
	$Bangladesh
	}" $mirrorlist
}


on_parallel() {

# Add parallel downloading

while true 
do
	echo -e "\n How many parallel downloadings do you want?\n select between 6 to 12 or press enter for default\n"

		read -r -p " Insert a number: " INPUT
		
				case "$INPUT" in
					
					$ENTER)	
						sed -i.4r6h "s/^ParallelDownloads.*/ParallelDownloads = 5/" /etc/pacman.conf
											
											break ;;
					[0-4])
						echo -e "\n Don't use less than 5 downloadings! \n" ;;
					
					[5-9]|1[0-2])

						sed -i.4r6h "s/^ParallelDownloads.*/ParallelDownloads = $INPUT/" /etc/pacman.conf

											break ;;
					( +([[:digit:]]) )

						echo -e "\n Don't use more than 12 downloadings! \n" ;;

					*) 
						echo -e "\n Error! You should give a whole number!\n" ;;
				esac
done

}

main() {

# Defining who can run the script.

if [ $(whoami) = "root" ]; then
	
		if [ ! -x /bin/reflactor ]; then

			pacman -S --noconfirm --needed reflector
		fi
	
	while true 
	do

		echo -e "\n Do you want to add parallel downloadings?\n"
	
		read -r -p " Type [Y/n] then press enter. default is (Y): " para
		
			case "$para" in
				[Yy]|[Yy][Ee][Ss]|$ENTER)
				
					on_parallel
					updatemirrors  
							break ;;

				[Nn]|[Nn][Oo])
				
					updatemirrors 
							break ;;
				*)
					echo -e "\n $para is invalid input.... \n"
			esac
	done
else
		echo -e	"\n
			!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
			------------PLEASE RUN AS ROOT------------
			!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
			\n"
fi

}

main
