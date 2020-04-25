#!/bin/bash
echo "umount /media/BACKUP/"
umount /media/BACKUP/
echo "rmdir /media/BACKUP/"
rmdir /media/BACKUP/
echo "luksClose d5719f6e-8488-4b89-a785-a72c21099298"
cryptsetup luksClose /dev/mapper/luks-d5719f6e-8488-4b89-a785-a72c21099298
echo "luksClose 317d4e44-3353-4d87-9685-1235280140fa"
cryptsetup luksClose /dev/mapper/luks-317d4e44-3353-4d87-9685-1235280140fa
