#!/bin/bash
echo "umount /media/DATA/"
umount /media/DATA/
echo "luksClose WD Elements 107C"
cryptsetup luksClose /dev/mapper/luks-d4e6f546-2462-4356-8360-b5feafa41099
echo "luksClose WD My Book 1140"
cryptsetup luksClose /dev/mapper/luks-0110be39-192e-4e68-8ac3-2efd57ceae10
