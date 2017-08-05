#!/bin/bash
read -s -p "Password: " DISK_PASS
echo

echo "luksOpen ST320005  42AS"
echo -n "$DISK_PASS" | cryptsetup luksOpen UUID=7eab0ebc-615f-4758-839a-6e8c7211ca9c luks-7eab0ebc-615f-4758-839a-6e8c7211ca9c -d -
echo "luksOpen WDC WD20  EARS-00MVWB0"
echo -n "$DISK_PASS" | cryptsetup luksOpen UUID=8764dcf4-aff8-4d38-8f03-89c2a866fdbb luks-8764dcf4-aff8-4d38-8f03-89c2a866fdbb -d -
echo "luksOpen SAMSUNG   HD153WI"
echo -n "$DISK_PASS" | cryptsetup luksOpen UUID=2e5ecaae-9ad9-4602-9ee8-f37b11e69c9b luks-2e5ecaae-9ad9-4602-9ee8-f37b11e69c9b -d -
echo "luksOpen SAMSUNG   HD203WI"
echo -n "$DISK_PASS" | cryptsetup luksOpen UUID=7841eead-708a-4ce8-8716-7f1f0abce422 luks-7841eead-708a-4ce8-8716-7f1f0abce422 -d -
echo "mount /media/BACKUP/ as R/O"
mount /dev/mapper/luks-7eab0ebc-615f-4758-839a-6e8c7211ca9c /media/BACKUP -o ro
