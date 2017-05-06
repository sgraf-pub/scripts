#!/bin/bash -x

mount -o remount,rw /media/BACKUP
rsync --archive --delete --whole-file --hard-links --verbose /media/DATA/ /media/BACKUP/
sleep 1m
mount -o remount,ro /media/BACKUP

