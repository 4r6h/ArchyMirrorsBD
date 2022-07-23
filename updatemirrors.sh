#!/bin/env bash
sudo reflector --latest 200 --protocol http,https --sort rate --save /etc/pacman.d/mirrorlist
wait
sudo sed -i '/xeonbd/d' /etc/pacman.d/mirrorlist #Deletes the Bangladesh Mirror
wait
sudo sed -i '/^$/a Server = http://mirror.xeonbd.com/archlinux/$repo/os/$arch' /etc/pacman.d/mirrorlist #Adds Bangladesh Mirror after blank line

#reflector --latest 200 --protocol http,https --sort rate --save $HOME/mirrorlist

#sudo sed -i 's|^$|Server = http://mirror.xeonbd.com/archlinux/$repo/os/$arch|' /etc/pacman.d/mirrorlist #Adds Bangladesh Mirror

#sed -i 's#{{find}}#{{replace}}#g' {{filename}}

#sudo sed -i 's/^#Server/Server/g' /etc/pacman.d/mirrorlist

#sudo sed -i '1 i Server = http://mirror.xeonbd.com/archlinux/$repo/os/$arch' /etc/pacman.d/mirrorlist #Previous Command
