#!/bin/bash -x
# update version in airsane.spec
source /etc/os-release
rm -f /var/home/$USER/rpmbuild/SOURCES/master.tar.gz
rm -f /var/home/$USER/rpmbuild/SRPMS/airsane-*.src.rpm
rpmbuild --undefine=_disable_source_fetch -bs airsane.spec
VERSION=$(grep 'Version:' airsane.spec | awk '{ print $2 }')
mock -r fedora-$VERSION_ID-x86_64 rebuild "/var/home/$USER/rpmbuild/SRPMS/airsane-${VERSION}-1.src.rpm"
rm -f airsane-*.x86_64.rpm
cp /var/lib/mock/fedora-$VERSION_ID-x86_64/result/airsane-${VERSION}-1.x86_64.rpm .
