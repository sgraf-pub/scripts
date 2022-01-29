#!/bin/bash -ex

# Mount BACKUP RW
systemctl stop beesd@b278045d-82ac-472f-a374-fb21afd1b906
mount -v -o remount,rw /media/BACKUP

# Backup
rsync -aEHXSx --progress /media/DATA/data/ /media/BACKUP/data/
rsync -aEHXSx --progress /media/DATA/zalohy/ /media/BACKUP/zalohy/
rsync -aEHXSxv --delete --dry-run /media/DATA/data/ /media/BACKUP/data/
rsync -aEHXSxv --delete --dry-run /media/DATA/zalohy/ /media/BACKUP/zalohy/

# Let the things calm down and move BACKUP back to RO
sync
mount -v -o remount,ro /media/BACKUP
systemctl start beesd@b278045d-82ac-472f-a374-fb21afd1b906
