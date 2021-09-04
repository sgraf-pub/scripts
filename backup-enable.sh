#!/bin/bash -ex
read -s -p "Password: " DISK_PASS

echo -n "$DISK_PASS" | cryptsetup luksOpen UUID=8c0048d5-e630-4e90-a969-1af6e34fab70 luks-8c0048d5-e630-4e90-a969-1af6e34fab70 -d -
echo -n "$DISK_PASS" | cryptsetup luksOpen UUID=7247b2f5-7e6b-48bf-b4dd-aca59c596e1a luks-7247b2f5-7e6b-48bf-b4dd-aca59c596e1a -d -

mkdir /media/BACKUP
mount /dev/mapper/luks-7247b2f5-7e6b-48bf-b4dd-aca59c596e1a /media/BACKUP -o defaults,ro,compress-force=zstd:1

