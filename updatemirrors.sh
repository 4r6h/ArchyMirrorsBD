#!/usr/bin/env bash
#######################################################################################################################################################
if [ $(whoami) = "root" ];
    then
          Bangladesh='Server = http://mirror.xeonbd.com/archlinux/$repo/os/$arch' #Defining Bangladesh Mirror.

          mirrorlist='/etc/pacman.d/mirrorlist' #Path to Pacman Mirrorlist.

#mirrorlist='mirrorlist'

          reflector --latest 200 --protocol http,https --sort rate --save $mirrorlist #Rates Mirrors For Best Speed.

          sed -i '/xeonbd/d' $mirrorlist #Deletes the Bangladesh Mirror.

#Add Bangladesh mirror at the top in first position.

          sed -i "1,/^Server/ {/^Server/i\
          $Bangladesh
          }" $mirrorlist
else
          echo "
                  __________________________________________
                  _____________PLEASE RUN AS ROOT___________
                  __________________________________________
                  "
fi

exit

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
