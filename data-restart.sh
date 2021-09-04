#!/bin/bash -x

pkill rygel
systemctl stop smb
sudo -u medvidek /var/home/medvidek/.local/bin/wrap-dbus rygel -c /etc/rygel.conf &>/var/home/medvidek/.cache/rygel/rygel.log &
systemctl start smb
systemctl restart airsaned
