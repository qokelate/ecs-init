#!/bin/bash

# systemctl disable atd #Scheduling Tasks
# systemctl disable avahi-daemon #Zeroconf Zero configuration networking
# systemctl disable chronyd #NTP client/server
# systemctl disable NetworkManager #Network Manager
# systemctl set-default multi-user.target #character interface
# systemctl stop atd #Scheduling Tasks
# systemctl stop avahi-daemon #Zeroconf Zero configuration networking
# systemctl stop chronyd #NTP client/server
# systemctl stop NetworkManager #Network Manager
systemctl disable abrtd #automated bug reporting tool's daemon
systemctl disable abrt-oops #Automatic Bug Reporting Tool
systemctl disable abrt-xorg #Automatic Bug Reporting Tool
systemctl disable accounts-daemon #Accounts Service
systemctl disable alsa-state #Soundcard driver
systemctl disable bluetooth #Network File System
systemctl disable colord #Manage, Install and Generate Color Profiles
systemctl disable cups #printer
systemctl disable gdm #GNOME Display Manager
systemctl disable gssproxy #GSSAPI Proxy Daemon
systemctl disable libstoragemgmt #storage array management
systemctl disable libvirtd #Virtualization daemon
systemctl disable ModemManager #Modem Manager
systemctl disable nfslock #Network File System
systemctl disable packagekit #PackageKit Daemon
systemctl disable packagekit #suite of software applications for updates
systemctl disable smartd #rtkit-daemon
systemctl disable smartd #smartd
systemctl disable udisks2 #udisks2
systemctl disable upower #upower
systemctl disable vmtoolsd #vmtoolsd
systemctl disable wpa_supplicant #WiFi Driver
systemctl stop abrtd #automated bug reporting tool's daemon
systemctl stop abrt-oops #Automatic Bug Reporting Tool
systemctl stop abrt-xorg #Automatic Bug Reporting Tool
systemctl stop accounts-daemon #Accounts Service
systemctl stop alsa-state #Soundcard driver
systemctl stop bluetooth #Network File System
systemctl stop colord #Manage, Install and Generate Color Profiles
systemctl stop cups #printer
systemctl stop gdm #GNOME Display Manager
systemctl stop gssproxy #GSSAPI Proxy Daemon
systemctl stop libstoragemgmt #storage array management
systemctl stop libvirtd #Virtualization daemon
systemctl stop ModemManager #Modem Manager
systemctl stop nfslock #Network File System
systemctl stop packagekit #PackageKit Daemon
systemctl stop packagekit #suite of software applications for updates
systemctl stop smartd #rtkit-daemon
systemctl stop smartd #smartd
systemctl stop udisks2 #udisks2
systemctl stop upower #upower
systemctl stop vmtoolsd #vmtoolsd
systemctl stop wpa_supplicant #WiFi Driver

systemctl stop denyhosts
systemctl disable denyhosts

exit
