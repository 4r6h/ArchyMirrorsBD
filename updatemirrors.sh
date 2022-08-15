#!/usr/bin/env bash

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
					
					[0-4])
						echo -e "\n Don't use less than 5 downloadings! \n" ;;
					
					
					1[3-*])
						echo -e "\n Don't use more than 12 downloadings! \n" ;;
	
					
					[5-9]|1[0-2])

						sed -i.4r6h "s/^ParallelDownloads.*/ParallelDownloads = $INPUT/" /etc/pacman.conf

											break ;;
					$ENTER)
					
						sed -i.4r6h "s/^ParallelDownloads.*/ParallelDownloads = 5/" /etc/pacman.conf
											
											break ;;
					( +([[:digit:]]) )

						echo -e "\n invalid $INPUT is not acceptable! \n" ;;

					*) 
						echo -e "\n Error! You should give a whole number!\n" ;;
				esac
done

}


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






#######################################################################################################################################################


#   				[DONT UNCOMMENT OR TOUCH THESE LINES OF CODE THESE ARE JUST FOR REFRENCE.]
#   				[DONT UNCOMMENT OR TOUCH THESE LINES OF CODE THESE ARE JUST FOR REFRENCE.]
#   				[DONT UNCOMMENT OR TOUCH THESE LINES OF CODE THESE ARE JUST FOR REFRENCE.]


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

#   				[DONT UNCOMMENT OR TOUCH THESE LINES OF CODE THESE ARE JUST FOR REFRENCE.]
#   				[DONT UNCOMMENT OR TOUCH THESE LINES OF CODE THESE ARE JUST FOR REFRENCE.]
#   				[DONT UNCOMMENT OR TOUCH THESE LINES OF CODE THESE ARE JUST FOR REFRENCE.]



#######################################################################################################################################################
