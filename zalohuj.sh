#!/bin/bash -x

#mount -o remount,rw /media/BACKUP
mount -o remount,rw /media/NEW
#rsync --archive --delete --progress --hard-links /media/DATA/ /media/BACKUP/; sleep 5
rsync --archive --delete --progress --hard-links /media/DATA/ /media/NEW/; sleep 5
#mount -o remount,ro /media/BACKUP
mount -o remount,ro /media/NEW

