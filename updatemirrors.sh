#!/bin/sh
reflector --leatest 200 --protocol http,https --sort rate --save $HOME/
