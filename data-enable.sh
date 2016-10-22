echo "WD Elements 107C"
cryptsetup luksOpen UUID=d4e6f546-2462-4356-8360-b5feafa41099 luks-d4e6f546-2462-4356-8360-b5feafa41099
echo "WD My Book 1140"
cryptsetup luksOpen UUID=0110be39-192e-4e68-8ac3-2efd57ceae10 luks-0110be39-192e-4e68-8ac3-2efd57ceae10
mount /dev/mapper/luks-d4e6f546-2462-4356-8360-b5feafa41099 /media/DATA/ -o rw

