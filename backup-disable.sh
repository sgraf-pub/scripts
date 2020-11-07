#!/bin/bash -ex
umount /media/BACKUP_n1
rmdir /media/BACKUP_n1
cryptsetup luksClose /dev/mapper/luks-d5719f6e-8488-4b89-a785-a72c21099298

umount /media/BACKUP_n2
rmdir /media/BACKUP_n2
cryptsetup luksClose /dev/mapper/luks-317d4e44-3353-4d87-9685-1235280140fa
