#!/bin/bash -x

mount -o remount,rw /media/BACKUP
rsync --archive --delete --progress --hard-links /media/DATA/ /media/BACKUP/; sleep 5
mount -o remount,ro /media/BACKUP

