#!/usr/bin/env bash

original=$( grep "$1" /etc/fstab | awk '{print $4}')
file=$(grep "$1" /etc/fstab)
nuevo=$(echo "$original$2")
final=$(echo $file | sed "s|$original|$nuevo|g")
bkpfile /etc/fstab
sed -i "s|$file|$final|g" /etc/fstab
