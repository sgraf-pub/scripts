#!/bin/bash -x

btrfs balance start -musage=0  /
btrfs balance start -musage=80 /
btrfs balance start -dusage=0  /
btrfs balance start -dusage=20 /
btrfs scrub   start -Bd        /

btrfs balance start -musage=0  /media/DATA
btrfs balance start -musage=80 /media/DATA
btrfs balance start -dusage=0  /media/DATA
btrfs balance start -dusage=20 /media/DATA

mount -o remount,rw /media/BACKUP
btrfs balance start -musage=0  /media/BACKUP
btrfs balance start -musage=80 /media/BACKUP
btrfs balance start -dusage=0  /media/BACKUP
btrfs balance start -dusage=20 /media/BACKUP
mount -o remount,ro /media/BACKUP

