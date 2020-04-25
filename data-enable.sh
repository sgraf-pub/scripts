#!/bin/bash
read -s -p "Password: " DISK_PASS
echo
echo "luksOpen c923dd84-b89c-4702-97e9-0a8ab4207364"
echo -n "$DISK_PASS" | cryptsetup luksOpen UUID=c923dd84-b89c-4702-97e9-0a8ab4207364 luks-c923dd84-b89c-4702-97e9-0a8ab4207364 -d -
echo "luksOpen c61dde92-95ee-4987-b0ed-1f8ced36b52b"
echo -n "$DISK_PASS" | cryptsetup luksOpen UUID=c61dde92-95ee-4987-b0ed-1f8ced36b52b luks-c61dde92-95ee-4987-b0ed-1f8ced36b52b -d -

echo "create /media/DATA/"
mkdir /media/DATA/
echo "mount /media/DATA/ as R/W"
mount /dev/mapper/luks-c923dd84-b89c-4702-97e9-0a8ab4207364 /media/DATA/ -o compress=zstd
