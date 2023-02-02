#!/bin/bash

openocd -f /usr/share/openocd/scripts/board/st_nucleo_f4.cfg -c "init;reset halt;flash write_image erase build/Release/source/Etna.elf;reset run;shutdown"
