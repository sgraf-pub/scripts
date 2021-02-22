#!/bin/bash -ex
read -s -p "Password: " DISK_PASS
echo -n "$DISK_PASS" | cryptsetup luksOpen UUID=8c0048d5-e630-4e90-a969-1af6e34fab70 luks-8c0048d5-e630-4e90-a969-1af6e34fab70 -d -
mkdir /media/DATA_n1
mount /dev/mapper/luks-8c0048d5-e630-4e90-a969-1af6e34fab70 /media/DATA_n1 -o rw,compress-force=zstd

echo -n "$DISK_PASS" | cryptsetup luksOpen UUID=7247b2f5-7e6b-48bf-b4dd-aca59c596e1a luks-7247b2f5-7e6b-48bf-b4dd-aca59c596e1a -d -
mkdir /media/DATA_n2
mount /dev/mapper/luks-7247b2f5-7e6b-48bf-b4dd-aca59c596e1a /media/DATA_n2 -o rw,compress-force=zstd

mkdir /media/DATA/
mkdir /media/DATA/0day
mount -o bind /media/DATA_n1/0day /media/DATA/0day
mkdir /media/DATA/CDs_DVDs
mount -o bind /media/DATA_n1/CDs_DVDs /media/DATA/CDs_DVDs
mkdir /media/DATA/Filmy
mount -o bind /media/DATA_n2/Filmy /media/DATA/Filmy
mkdir /media/DATA/Fotky
mount -o bind /media/DATA_n1/Fotky /media/DATA/Fotky
mkdir /media/DATA/Hudba
mount -o bind /media/DATA_n1/Hudba /media/DATA/Hudba
mkdir /media/DATA/Serialy
mount -o bind /media/DATA_n2/Serialy /media/DATA/Serialy
mkdir /media/DATA/Study
mount -o bind /media/DATA_n1/Study /media/DATA/Study
mkdir /media/DATA/Temp
mount -o bind /media/DATA_n1/Temp /media/DATA/Temp
#mkdir /media/DATA/Zalohy
#mount -o bind /media/DATA_n1/Zalohy /media/DATA/Zalohy

#systemctl start minidlna
systemctl start smb
