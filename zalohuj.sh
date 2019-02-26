#!/bin/bash -x

# Deduplication DATA
/usr/sbin/duperemove -hdr --hashfile=/media/DATA/Zalohy/backup/duperemove_data.hash /media/DATA/

# Balance DATA
btrfs balance start -musage=20 -dusage=20 -v /media/DATA/

# Mount BACKUP RW
mount -o remount,rw /media/BACKUP

rsync   --archive --delete --verbose \
        --one-file-system /media/DATA/ /media/BACKUP/

# Deduplication of BACKUP
/usr/sbin/duperemove -hdr --hashfile=/media/DATA/Zalohy/backup/duperemove_backup.hash /media/BACKUP/

# Balance BACKUP
btrfs balance start -musage=20 -dusage=20 -v /media/BACKUP/

# Let the things calm down and move BACKUP back to RO
sleep 2m
mount -o remount,ro /media/BACKUP

