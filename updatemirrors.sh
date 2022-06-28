#!/bin/sh
reflector -l 200 --protocol http,https --sort rate --save $HOME/
