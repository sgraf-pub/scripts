#!/bin/bash -ex
mount -v -o remount,rw /media/BACKUP
btrbk run --progress
sync
mount -v -o remount,ro /media/BACKUP
