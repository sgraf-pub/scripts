#!/bin/bash -ex

# Mount BACKUP RW
mount -o remount,rw /media/BACKUP_n1
mount -o remount,rw /media/BACKUP_n2

# Backup
rsync -aEHXSxv --delete /media/DATA_n1/ /media/BACKUP_n1/
rsync -aEHXSxv --delete /media/DATA_n2/ /media/BACKUP_n2/

# Let the things calm down and move BACKUP back to RO
sleep 10s
mount -o remount,ro /media/BACKUP_n1
mount -o remount,ro /media/BACKUP_n2
