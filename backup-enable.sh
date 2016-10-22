echo "WD My Book 1140"
cryptsetup luksOpen UUID=0110be39-192e-4e68-8ac3-2efd57ceae10 luks-0110be39-192e-4e68-8ac3-2efd57ceae10
mount /dev/mapper/luks-0110be39-192e-4e68-8ac3-2efd57ceae10 /media/BACKUP/ -o ro
