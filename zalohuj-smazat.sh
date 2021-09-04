#!/bin/bash -ex

# Mount BACKUP RW
mount -o remount,rw /media/BACKUP

# Backup
rsync -aEHXSxv --delete /media/DATA/ /media/BACKUP/

# Let the things calm down and move BACKUP back to RO
sleep 10s
mount -o remount,ro /media/BACKUP
