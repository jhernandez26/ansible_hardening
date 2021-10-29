#!/usr/bin/env bash

line_first=$(grep "^GRUB_CMDLINE_LINUX" /etc/default/grub  | awk -F\"  '{print $2}')
line_second=$(echo "$line_first audit_backlog_limit=8192 audit=1")
sed -i "s|$line_first|$line_second|g" /etc/default/grub
for i in $(find /boot -iname "grub.cfg");do grub2-mkconfig > $i ; done

