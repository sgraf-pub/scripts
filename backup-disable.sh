#!/bin/bash -ex
systemctl stop beesd@b278045d-82ac-472f-a374-fb21afd1b906
sync
umount -v /media/BACKUP
rmdir -v /media/BACKUP
cryptsetup -v luksClose /dev/mapper/luks-03a53235-3f88-4d31-b97f-12857fe2f19f
cryptsetup -v luksClose /dev/mapper/luks-8adb51f2-069f-4b62-9fb7-753bc60617d6
cryptsetup -v luksClose /dev/mapper/luks-4eff7329-c991-4739-b41d-6a50af5a2d95
cryptsetup -v luksClose /dev/mapper/luks-0158d2c4-9b1e-4981-a2d1-728834d3e895
sdparm -C sync -r /dev/sdb
sdparm -C sync -r /dev/sdc
sdparm -C sync -r /dev/sdd
sdparm -C sync -r /dev/sde
sleep 5s
sdparm -C stop -r /dev/sdb
sdparm -C stop -r /dev/sdc
sdparm -C stop -r /dev/sdd
sdparm -C stop -r /dev/sde
