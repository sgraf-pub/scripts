#/bin/bash -x

for disk in /dev/sd{a..g}; do
    smartctl --set aam,off --set apm,128 --set lookahead,on --set wcache,on --set wcreorder,on --set standby,241 $disk
done
