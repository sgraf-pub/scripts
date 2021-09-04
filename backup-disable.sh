#!/bin/bash -x

umount /media/BACKUP
rmdir /media/BACKUP
cryptsetup luksClose /dev/mapper/luks-8c0048d5-e630-4e90-a969-1af6e34fab70
cryptsetup luksClose /dev/mapper/luks-7247b2f5-7e6b-48bf-b4dd-aca59c596e1a
