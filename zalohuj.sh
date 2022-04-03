#!/bin/bash -ex

# Mount BACKUP RW
mount -v -o remount,rw /media/BACKUP

# Backup
btrbk run --progress
sync

# Mount BACKUP back RO
mount -v -o remount,ro /media/BACKUP
