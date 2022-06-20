#!/bin/bash -ex
read -s -p "Password: " DISK_PASS
echo -n "$DISK_PASS" | cryptsetup -v luksOpen UUID=03a53235-3f88-4d31-b97f-12857fe2f19f luks-03a53235-3f88-4d31-b97f-12857fe2f19f -d -
echo -n "$DISK_PASS" | cryptsetup -v luksOpen UUID=8adb51f2-069f-4b62-9fb7-753bc60617d6 luks-8adb51f2-069f-4b62-9fb7-753bc60617d6 -d -
echo -n "$DISK_PASS" | cryptsetup -v luksOpen UUID=4eff7329-c991-4739-b41d-6a50af5a2d95 luks-4eff7329-c991-4739-b41d-6a50af5a2d95 -d -
echo -n "$DISK_PASS" | cryptsetup -v luksOpen UUID=0158d2c4-9b1e-4981-a2d1-728834d3e895 luks-0158d2c4-9b1e-4981-a2d1-728834d3e895 -d -
mkdir -v /media/BACKUP
mount /dev/mapper/luks-03a53235-3f88-4d31-b97f-12857fe2f19f /media/BACKUP -o defaults,compress-force=zstd:1,ro -v
sdparm --set=STANDBY_Z=1 /dev/sdd
sdparm --set=SZCT=3000 /dev/sdd
