#!/bin/bash -ex
read -s -p "Password: " DISK_PASS
echo -n "$DISK_PASS" | cryptsetup luksOpen UUID=d5719f6e-8488-4b89-a785-a72c21099298 luks-d5719f6e-8488-4b89-a785-a72c21099298 -d -
mkdir /media/BACKUP_n1
mount /dev/mapper/luks-d5719f6e-8488-4b89-a785-a72c21099298 /media/BACKUP_n1 -o compress-force=zstd,ro

echo -n "$DISK_PASS" | cryptsetup luksOpen UUID=317d4e44-3353-4d87-9685-1235280140fa luks-317d4e44-3353-4d87-9685-1235280140fa -d -
mkdir /media/BACKUP_n2
mount /dev/mapper/luks-317d4e44-3353-4d87-9685-1235280140fa /media/BACKUP_n2 -o compress-force=zstd,ro
