#!/bin/bash -ex
read -s -p "Password: " DISK_PASS
echo -n "$DISK_PASS" | cryptsetup -v luksOpen UUID=84fa66e3-4fdc-4db6-95c8-20c901ec538f luks-84fa66e3-4fdc-4db6-95c8-20c901ec538f -d -
mkdir -v /media/DATA
mkdir -v /media/DATA/data
mkdir -v /media/DATA/zalohy
mount /dev/mapper/luks-84fa66e3-4fdc-4db6-95c8-20c901ec538f /media/DATA/data -o defaults,subvol=data,compress-force=zstd:1 -v
mount /dev/mapper/luks-84fa66e3-4fdc-4db6-95c8-20c901ec538f /media/DATA/zalohy -o defaults,subvol=zalohy,compress-force=zstd:1 -v
systemctl start minidlna
systemctl start smb
