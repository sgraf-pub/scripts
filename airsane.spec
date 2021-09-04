Summary:        A SANE WebScan frontend that supports Apple's AirScan protocol.
Name:           airsane
Version:        1.20200904
Release:        1
License:        GPLv3
Source0:        https://github.com/SimulPiscator/AirSane/archive/master.tar.gz
ExclusiveArch:  x86_64
BuildRequires:  cmake
BuildRequires:  gcc-c++
BuildRequires:  sane-backends-devel
BuildRequires:  libpng-devel
BuildRequires:  avahi-devel

%description
A SANE WebScan frontend that supports Apple's AirScan protocol.
Scanners are detected automatically, and published through mDNS.
Though images may be acquired and transferred in JPEG, PNG, and
PDF/raster format through a simple web interface, AirSane's intended
purpose is to be used with AirScan/eSCL clients such as Apple's Image
Capture.

Images are encoded on-the-fly during acquisition, keeping memory/storage
demands low. Thus, AirSane will run fine on a Raspberry Pi or similar
device.

Authentication and secure communication are not supported.

If you are looking for a powerful SANE web frontend, AirSane may not be
for you. You may be interested in phpSANE instead.

%global debug_package %{nil}

%prep
%setup -q -n AirSane-master

%build
sed -i 's,libpng/png.h,png.h,' imageformats/pngencoder.cpp
sed -i 's,/usr/local/bin/airsaned,/usr/bin/airsaned,' systemd/airsaned.service
cd ../
mkdir AirSane-build
cd AirSane-build
cmake ../AirSane-master
make

%install
mkdir -p $RPM_BUILD_ROOT/etc/default/
mkdir -p $RPM_BUILD_ROOT/etc/systemd/system/
mkdir -p $RPM_BUILD_ROOT/usr/bin/
mkdir -p $RPM_BUILD_ROOT/etc/airsane/

install ../AirSane-master/systemd/airsaned.default $RPM_BUILD_ROOT/etc/default/airsane
install ../AirSane-master/systemd/airsaned.service $RPM_BUILD_ROOT/etc/systemd/system/
install ../AirSane-build/airsaned $RPM_BUILD_ROOT/usr/bin/
install ../AirSane-master/etc/Gnome-scanner.png $RPM_BUILD_ROOT/etc/airsane/
install ../AirSane-master/etc/options.conf $RPM_BUILD_ROOT/etc/airsane/

%post

%clean
rm -rf $RPM_BUILD_ROOT
rm -rf %{_tmppath}/%{name}
rm -rf %{_topdir}/BUILD/%{name}

%files
/etc/default/airsane
/etc/systemd/system/airsaned.service
/usr/bin/airsaned
/etc/airsane/Gnome-scanner.png
/etc/airsane/options.conf

%changelog
* Sun Aug 01 2010  Your name here
- 1.0 r1 First release
