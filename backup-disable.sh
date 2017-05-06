#!/bin/bash
echo "umount /media/BACKUP/"
umount /media/BACKUP/

echo "luksClose ST320005  42AS"
cryptsetup luksClose /dev/mapper/luks-7eab0ebc-615f-4758-839a-6e8c7211ca9c
echo "luksClose WDC WD20  EARS-00MVWB0"
cryptsetup luksClose /dev/mapper/luks-8764dcf4-aff8-4d38-8f03-89c2a866fdbb
echo "luksClose SAMSUNG   HD153WI"
cryptsetup luksClose /dev/mapper/luks-2e5ecaae-9ad9-4602-9ee8-f37b11e69c9b
echo "luksClose SAMSUNG   HD203WI"
cryptsetup luksClose /dev/mapper/luks-7841eead-708a-4ce8-8716-7f1f0abce422
