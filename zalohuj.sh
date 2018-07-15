#!/bin/bash -x

# Deduplication DATA
/usr/sbin/duperemove -hdr --hashfile=/var/tmp/duperemove_data.hash /media/DATA/

# Balance DATA
btrfs balance start -musage=0 -v /media/DATA/
btrfs balance start -musage=20 -v /media/DATA/
btrfs balance start -dusage=0 -v /media/DATA/
btrfs balance start -dusage=20 -v /media/DATA/

# Mount BACKUP RW
mount -o remount,rw /media/BACKUP

# Sync DATA with BACKUP
#cp      --archive --no-clobber --verbose \
#        --one-file-system /media/DATA/* /media/BACKUP/

rsync   --archive --delete --verbose \
        --one-file-system /media/DATA/ /media/BACKUP/

# Deduplication of BACKUP
/usr/sbin/duperemove -hdr --hashfile=/var/tmp/duperemove_backup.hash /media/BACKUP/

# Backup index files
cp --force /var/tmp/duperemove* /media/DATA/Zalohy/backup/

# Balance BACKUP
btrfs balance start -musage=0 -v /media/BACKUP/
btrfs balance start -musage=20 -v /media/BACKUP/
btrfs balance start -dusage=0 -v /media/BACKUP/
btrfs balance start -dusage=20 -v /media/BACKUP/

# Let the things calm down and move BACKUP back to RO
sleep 2m
mount -o remount,ro /media/BACKUP

