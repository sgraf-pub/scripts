#!/bin/bash -x
source /etc/os-release
sudo dnf update -y
sudo dnf install vim mock rpmlint -y
sudo usermod -a -G mock "$USER"
mock -r fedora-$VERSION_ID-x86_64 --init
sudo dnf groupinstall -y 'RPM Development Tools'
