#!/usr/bin/env bash

# Obtenemos el tipo de maquina
Virtual_machine=$(dmidecode -s system-manufacturer)

if [[ $Virtual_machine == "QEMU" ]]; then
   bkpfile /etc/default/
   line_first=$(grep "^GRUB_CMDLINE_LINUX" /etc/default/grub  | awk -F\"  '{print $2}')
   line_second=$(echo "$line_first ")
   sed -i "s|$line_first|$line_second|g" /etc/default/grub
   for i in $(find /boot -iname "grub.cfg");do grub2-mkconfig > /etc/default/grub; done
fi
