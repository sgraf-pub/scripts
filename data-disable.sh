#!/bin/bash -ex

systemctl stop minidlna
systemctl stop smb

umount /media/DATA/0day
umount /media/DATA/CDs_DVDs
umount /media/DATA/Filmy
umount /media/DATA/Fotky
umount /media/DATA/Hudba
umount /media/DATA/Serialy
umount /media/DATA/Study
umount /media/DATA/Temp
#umount /media/DATA/Zalohy
rmdir /media/DATA/0day
rmdir /media/DATA/CDs_DVDs
rmdir /media/DATA/Filmy
rmdir /media/DATA/Fotky
rmdir /media/DATA/Hudba
rmdir /media/DATA/Serialy
rmdir /media/DATA/Study
rmdir /media/DATA/Temp
#rmdir /media/DATA/Zalohy
rmdir /media/DATA/

umount /media/DATA_n2
rmdir /media/DATA_n2
cryptsetup luksClose luks-7247b2f5-7e6b-48bf-b4dd-aca59c596e1a

umount /media/DATA_n1
rmdir /media/DATA_n1
cryptsetup luksClose luks-8c0048d5-e630-4e90-a969-1af6e34fab70
