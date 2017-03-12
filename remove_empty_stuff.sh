#!/usr/bin/bash -x

find /media/DATA/ -empty -type f -delete -print
find /media/DATA/ -type l -exec sh -c 'for x; do if [ ! -e "$x" ] ; then echo "$x"; rm -f "$x"; fi; done' _ {} +
find /media/DATA/ -empty -type d -delete -print

# Trash / Recycle bin
#find /media/DATA/ -type d -name '$RECYCLE.BIN' -o -name 'FOUND.*' -o -name '.Trash-*' -o -name 'LOST.DIR'

