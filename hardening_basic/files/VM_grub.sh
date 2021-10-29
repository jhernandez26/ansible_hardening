#!/usr/bin/env bash

# Obtenemos el tipo de maquina
Virtual_machine=$(dmidecode -s system-manufacturer)

if [[ $Virtual_machine == "QEMU" ]]; then
   #bkpfile /etc/default/
   line_first=$(grep "^GRUB_CMDLINE_LINUX" /etc/default/grub  | awk -F\"  '{print $2}')
   line_second=$(echo "$line_first console=tty0 console=ttyS0,38400n8")
   sed -i "s|$line_first|$line_second|g" /etc/default/grub
   echo -e 'GRUB_SERIAL_COMMAND="serial --speed=38400 --unit=0 --word=8 --parity=no -stop=1"' >> /etc/default/grub
   for i in $(find /boot -iname "grub.cfg");do grub2-mkconfig > $i ; done
fi
