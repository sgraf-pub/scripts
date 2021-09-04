#!/bin/bash -ex
read -s -p "Password: " DISK_PASS

echo -n "$DISK_PASS" | cryptsetup luksOpen UUID=84209400-b7a4-495d-b48c-82595dadc125 luks-84209400-b7a4-495d-b48c-82595dadc125 -d -
mkdir /media/DATA
mount /dev/mapper/luks-84209400-b7a4-495d-b48c-82595dadc125 /media/DATA -o defaults,compress-force=zstd:1
fstrim -v /media/DATA

sudo -u medvidek /var/home/medvidek/.local/bin/wrap-dbus rygel -c /etc/rygel.conf &>/var/home/medvidek/.cache/rygel/rygel.log &
systemctl start smb
systemctl restart airsaned
