#!/usr/bin/env bash

shopt -s extglob

#######################################################################################################################################################

# Defining who can run the script.

if [ $(whoami) = "root" ]; then
	
	if [ ! -x /bin/reflactor ]; then

		pacman -S --noconfirm --needed reflector
	fi
	
	while true 
		do
		echo 'How many parallel downloadings do you want?'
		echo 'select between 6 or 12'
		read -r -p "Insert a number :" INPUT
	if [ $INPUT -gt "12" ]; then
		echo "Don't use more than 12 downloadings"
	elif [ $INPUT -eq "0" ]; then
		echo "Don't use 0 downloadings"
	elif [ $INPUT -lt "5" ]; then
		echo "Don't use less than 5 downloadings"
	else
		case $INPUT in
			( +([[:digit:]]) )

# Defining Bangladesh Mirror.

	Bangladesh='Server = http://mirror.xeonbd.com/archlinux/$repo/os/$arch' 

# Path to Pacman Mirrorlist.

	mirrorlist='/etc/pacman.d/mirrorlist' 

# Rates Mirrors For Best Speed.

	reflector --latest 200 --protocol http,https --sort rate --save $mirrorlist 

# Deletes the Bangladesh Mirror.

	sed -i '/xeonbd/d' $mirrorlist 

# Add Bangladesh mirror at the top in first position.

	sed -i.4r6h "1,/^Server/ {/^Server/i\
	$Bangladesh
	}" $mirrorlist

# Add parallel downloading
	
	sed -i.4r6h "s/^ParallelDownloads.*/ParallelDownloads = $INPUT/" /etc/pacman.conf
	pacman -Syy --noconfirm
break
			;;

			*)	
				echo "You should give a whole number"
			;;
		esac
	fi
	done
else

echo "
	__________________________________________
	_____________PLEASE RUN AS ROOT___________
	__________________________________________
     "
fi
#######################################################################################################################################################

#sudo sed -i "/^$/a $Bangladesh" $mirrorlist #Adds Bangladesh Mirror Again at the First Position.
#sudo reflector --latest 200 --protocol http,https --sort rate --save /etc/pacman.d/mirrorlist
#wait
#sudo sed -i '/xeonbd/d' /etc/pacman.d/mirrorlist #Deletes the Bangladesh Mirror
#wait
#sudo sed -i '/^$/a Server = http://mirror.xeonbd.com/archlinux/$repo/os/$arch' /etc/pacman.d/mirrorlist #Adds Bangladesh Mirror after blank line

#reflector --latest 200 --protocol http,https --sort rate --save $HOME/mirrorlist

#sudo sed -i 's|^$|Server = http://mirror.xeonbd.com/archlinux/$repo/os/$arch|' /etc/pacman.d/mirrorlist #Adds Bangladesh Mirror

#sed -i 's#{{find}}#{{replace}}#g' {{filename}}

#sudo sed -i 's/^#Server/Server/g' /etc/pacman.d/mirrorlist

#sudo sed -i '1 i Server = http://mirror.xeonbd.com/archlinux/$repo/os/$arch' /etc/pacman.d/mirrorlist #Previous Command
