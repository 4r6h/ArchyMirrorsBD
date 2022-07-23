#!/bin/env bash
#######################################################################################################################################################

Bangladesh='Server = http://mirror.xeonbd.com/archlinux/$repo/os/$arch' #Defining Bangladesh Mirror.

mirrorlist='/etc/pacman.d/mirrorlist' #Path to Pacman Mirrorlist.

#mirrorlist='mirrorlist'

sudo reflector --latest 200 --protocol http,https --sort rate --save $mirrorlist #Rates Mirrors For Best Speed.

sudo sed -i '/xeonbd/d' $mirrorlist #Deletes the Bangladesh Mirror.

sudo sed -i "1,/^Server/ {/^Server/i\
$Bangladesh
}" $mirrorlist

#sudo sed -i "/^$/a $Bangladesh" $mirrorlist #Adds Bangladesh Mirror Again at the First Position.
#######################################################################################################################################################

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
