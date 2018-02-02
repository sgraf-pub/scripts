#!/bin/bash -x

# Balance DATA
btrfs balance start -musage=0 -v /media/DATA/
btrfs balance start -musage=20 -v /media/DATA/
btrfs balance start -dusage=0 -v /media/DATA/
btrfs balance start -dusage=20 -v /media/DATA/

# Mount BACKUP RW
mount -o remount,rw /media/BACKUP

# Balance BACKUP
btrfs balance start -musage=0 -v /media/BACKUP/
btrfs balance start -musage=20 -v /media/BACKUP/
btrfs balance start -dusage=0 -v /media/BACKUP/
btrfs balance start -dusage=20 -v /media/BACKUP/

# Sync DATA with BACKUP
cp      --archive --no-clobber --verbose \
        --one-file-system /media/DATA/* /media/BACKUP/

rsync   --archive --delete --hard-links --verbose \
        --one-file-system /media/DATA/ /media/BACKUP/

# Let the things calm down and move BACKUP back to RO
sleep 1m
mount -o remount,ro /media/BACKUP

