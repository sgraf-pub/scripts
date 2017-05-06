#/bin/bash -x

for disk in /dev/sd{a..g}; do
    smartctl --set aam,off --set apm,128 --set lookahead,on --set wcache,on --set wcreorder,on --set standby,242 $disk
done

for disk in /dev/sd{b..c}; do
    sdparm --set STANDBY=1,SCT=36000 --save $disk
done

echo 'auto' > '/sys/bus/usb/devices/1-6.1.3/power/control'; 
echo 'auto' > '/sys/bus/usb/devices/1-6.1.4/power/control'; 
echo 'auto' > '/sys/bus/usb/devices/1-6.2/power/control'; 
echo 'auto' > '/sys/bus/usb/devices/1-6.1.2/power/control'; 
echo 'auto' > '/sys/bus/usb/devices/1-6.3/power/control'; 
echo 'auto' > '/sys/bus/usb/devices/1-6.4/power/control'; 

