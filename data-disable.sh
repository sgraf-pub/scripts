#!/bin/bash -ex
systemctl stop minidlna
systemctl stop smb
sync
umount -v /media/DATA/data
umount -v /media/DATA/zalohy
rmdir -v /media/DATA/data
rmdir -v /media/DATA/zalohy
rmdir -v /media/DATA
cryptsetup -v luksClose luks-84fa66e3-4fdc-4db6-95c8-20c901ec538f
