#!/bin/bash -x

# Deduplication DATA
duperemove -hdr --hashfile=/root/duperemove_data.hash \
        --dedupe-options=noblock  /media/DATA/
btrfs balance start -musage=20 -dusage=20 -v /media/DATA/

# Mount BACKUP RW
mount -o remount,rw /media/BACKUP

rsync   --archive --delete --verbose --executability \
        --fuzzy --delete-delay \
        --one-file-system /media/DATA/ /media/BACKUP/

# Deduplication of BACKUP
duperemove -hdr --hashfile=/root/duperemove_backup.hash \
        --dedupe-options=noblock  /media/BACKUP/
btrfs balance start -musage=20 -dusage=20 -v /media/BACKUP/

# Let the things calm down and move BACKUP back to RO
sleep 2m
mount -o remount,ro /media/BACKUP

