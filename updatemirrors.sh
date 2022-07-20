#!/bin/env bash
#reflector --latest 200 --protocol http,https --sort rate --save $HOME/mirrorlist
sudo reflector --latest 200 --protocol http,https --sort rate --save /etc/pacman.d/mirrorlist
sudo sed -i '/xeonbd/d' /etc/pacman.d/mirrorlist

sed -i '0,/^Server.*/s/^Server.*/Server = http://mirror.xeonbd.com/archlinux/$repo/os/$arch\n&/' /etc/pacman.d/mirrorlist

#sudo sed -i '1 i Server = http://mirror.xeonbd.com/archlinux/$repo/os/$arch' /etc/pacman.d/mirrorlist
#sed '/^Server=.*/i Done'
