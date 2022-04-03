#!/bin/bash -ex
pkill rygel
systemctl stop smb
systemctl stop beesd@d1bdc701-4cca-4f31-b91c-9a097607e156
sync
umount -v /media/DATA/data
umount -v /media/DATA/zalohy
rmdir -v /media/DATA/data
rmdir -v /media/DATA/zalohy
rmdir -v /media/DATA
cryptsetup -v luksClose luks-84fa66e3-4fdc-4db6-95c8-20c901ec538f
