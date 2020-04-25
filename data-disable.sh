#!/bin/bash
echo "umount /media/DATA/"
umount /media/DATA/
echo "rmdir /media/DATA/"
rmdir /media/DATA/
echo "luksClose c61dde92-95ee-4987-b0ed-1f8ced36b52b"
cryptsetup luksClose /dev/mapper/luks-c61dde92-95ee-4987-b0ed-1f8ced36b52b
echo "luksClose c923dd84-b89c-4702-97e9-0a8ab4207364"
cryptsetup luksClose /dev/mapper/luks-c923dd84-b89c-4702-97e9-0a8ab4207364
