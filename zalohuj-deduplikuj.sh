#!/bin/bash -ex

# Mount BACKUP RW
mount -o remount,rw /media/BACKUP_n1
mount -o remount,rw /media/BACKUP_n2

# Hardlinking
hardlink -v /media/DATA_n1 &
hardlink -v /media/DATA_n2 &
hardlink -v /media/BACKUP_n1 &
hardlink -v /media/BACKUP_n2 &
wait

# Let the things calm down and move BACKUP back to RO
sleep 10s
mount -o remount,ro /media/BACKUP_n1
mount -o remount,ro /media/BACKUP_n2
