#!/bin/bash
read -s -p "Password: " DISK_PASS
echo

echo "luksOpen d5719f6e-8488-4b89-a785-a72c21099298"
echo -n "$DISK_PASS" | cryptsetup luksOpen UUID=d5719f6e-8488-4b89-a785-a72c21099298 luks-d5719f6e-8488-4b89-a785-a72c21099298 -d -
echo "luksOpen 317d4e44-3353-4d87-9685-1235280140fa"
echo -n "$DISK_PASS" | cryptsetup luksOpen UUID=317d4e44-3353-4d87-9685-1235280140fa luks-317d4e44-3353-4d87-9685-1235280140fa -d -

echo "create /media/BACKUP/"
mkdir /media/BACKUP/
echo "mount /media/BACKUP/ as RO"
mount /dev/mapper/luks-317d4e44-3353-4d87-9685-1235280140fa /media/BACKUP/ -o ro,compress=zstd

