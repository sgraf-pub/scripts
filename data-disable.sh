#!/bin/bash -x

pkill rygel
systemctl stop smb

umount /media/DATA
rmdir /media/DATA
cryptsetup luksClose luks-84209400-b7a4-495d-b48c-82595dadc125
