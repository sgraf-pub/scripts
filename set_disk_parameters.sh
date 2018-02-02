#/bin/bash -x

for disk in /dev/sd?; do
    smartctl --set aam,off --set apm,128 --set lookahead,on --set wcache,off --set wcreorder,off --set standby,241 $disk
done

