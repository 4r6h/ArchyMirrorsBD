#!/bin/sh
#reflector --leatest 200 --protocol http,https --sort rate --save $HOME/mirrorlist
sudo reflector --leatest 200 --protocol http,https --sort rate --save /etc/pacman.d/mirrorlist
