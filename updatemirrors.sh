#!/bin/sh
#reflector --verbose --leatest 200 --protocol http,https --sort rate --save $HOME/mirrorlist
sudo reflector --verbose --leatest 200 --protocol http,https --sort rate --save /etc/pacman.d/mirrorlist
