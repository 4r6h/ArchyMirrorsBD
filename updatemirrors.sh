#!/bin/env bash
#reflector --latest 200 --protocol http,https --sort rate --save $HOME/mirrorlist
sudo reflector --latest 200 --protocol http,https --sort rate --save /etc/pacman.d/mirrorlist
