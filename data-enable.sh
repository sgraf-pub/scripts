#!/bin/bash
read -s -p "Password: " DISK_PASS
echo
echo "luksOpen WD Elements 107C"
echo -n "$DISK_PASS" | cryptsetup luksOpen UUID=d4e6f546-2462-4356-8360-b5feafa41099 luks-d4e6f546-2462-4356-8360-b5feafa41099 -d -
echo "luksOpen WD My Book 1140"
echo -n "$DISK_PASS" | cryptsetup luksOpen UUID=0110be39-192e-4e68-8ac3-2efd57ceae10 luks-0110be39-192e-4e68-8ac3-2efd57ceae10 -d -
echo "mount /media/DATA/ as R/W"
mount /dev/mapper/luks-d4e6f546-2462-4356-8360-b5feafa41099 /media/DATA/
