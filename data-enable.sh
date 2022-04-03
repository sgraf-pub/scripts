#!/bin/bash -ex
read -s -p "Password: " DISK_PASS
echo -n "$DISK_PASS" | cryptsetup -v luksOpen UUID=84fa66e3-4fdc-4db6-95c8-20c901ec538f luks-84fa66e3-4fdc-4db6-95c8-20c901ec538f -d -
mkdir -v /media/DATA
mkdir -v /media/DATA/data
mkdir -v /media/DATA/zalohy
mount /dev/mapper/luks-84fa66e3-4fdc-4db6-95c8-20c901ec538f /media/DATA/data -o defaults,subvol=data,compress-force=zstd:1,discard=async -v
mount /dev/mapper/luks-84fa66e3-4fdc-4db6-95c8-20c901ec538f /media/DATA/zalohy -o defaults,subvol=zalohy,compress-force=zstd:1,discard=async -v
sudo -u medvidek /var/home/medvidek/.local/bin/wrap-dbus rygel -c /etc/rygel.conf &>/var/home/medvidek/.cache/rygel/rygel.log &
systemctl start smb
systemctl start beesd@d1bdc701-4cca-4f31-b91c-9a097607e156
