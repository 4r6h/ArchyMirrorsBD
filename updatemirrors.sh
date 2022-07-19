#!/bin/env bash
#reflector --latest 200 --protocol http,https --sort rate --save $HOME/mirrorlist
sudo reflector --latest 200 --protocol http,https --sort rate --save /etc/pacman.d/mirrorlist
sudo sed -i '12 i http://mirror.xeonbd.com/archlinux/$repo/os/$arch' /etc/pacman.d/mirrorlist
