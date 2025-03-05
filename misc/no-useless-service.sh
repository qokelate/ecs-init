#!/bin/bash


# systemctl disable NetworkManager #Network Manager
# systemctl disable atd #Scheduling Tasks
# systemctl disable avahi-daemon #Zeroconf Zero configuration networking
# systemctl disable chronyd #NTP client/server
#systemctl disable gdm #GNOME Display Manager
systemctl disable --now unattended-upgrades
systemctl disable ModemManager #Modem Manager
systemctl disable abrt-oops #Automatic Bug Reporting Tool
systemctl disable abrt-xorg #Automatic Bug Reporting Tool
systemctl disable abrtd #automated bug reporting tool's daemon
systemctl disable accounts-daemon #Accounts Service
systemctl disable alsa-state #Soundcard driver
systemctl disable bluetooth #Network File System
systemctl disable colord #Manage, Install and Generate Color Profiles
systemctl disable cups #printer
systemctl disable denyhosts
systemctl disable firewalld
systemctl disable gssproxy #GSSAPI Proxy Daemon
systemctl disable libstoragemgmt #storage array management
systemctl disable libvirtd #Virtualization daemon
systemctl disable nfslock #Network File System
systemctl disable packagekit
systemctl disable packagekit #PackageKit Daemon
systemctl disable packagekit #suite of software applications for updates
systemctl disable packagekit-offline-update
systemctl disable postfix
systemctl disable qemu-guest-agent
systemctl disable smartd #rtkit-daemon
systemctl disable smartd #smartd
systemctl disable tuned
systemctl disable udisks2 #udisks2
systemctl disable upower #upower
systemctl disable vmtoolsd #vmtoolsd
systemctl disable wpa_supplicant #WiFi Driver



# systemctl stop NetworkManager #Network Manager
# systemctl stop atd #Scheduling Tasks
# systemctl stop avahi-daemon #Zeroconf Zero configuration networking
# systemctl stop chronyd #NTP client/server
#systemctl stop gdm #GNOME Display Manager
systemctl stop ModemManager #Modem Manager
systemctl stop abrt-oops #Automatic Bug Reporting Tool
systemctl stop abrt-xorg #Automatic Bug Reporting Tool
systemctl stop abrtd #automated bug reporting tool's daemon
systemctl stop accounts-daemon #Accounts Service
systemctl stop alsa-state #Soundcard driver
systemctl stop bluetooth #Network File System
systemctl stop colord #Manage, Install and Generate Color Profiles
systemctl stop cups #printer
systemctl stop denyhosts
systemctl stop firewalld
systemctl stop gssproxy #GSSAPI Proxy Daemon
systemctl stop libstoragemgmt #storage array management
systemctl stop libvirtd #Virtualization daemon
systemctl stop nfslock #Network File System
systemctl stop packagekit
systemctl stop packagekit #PackageKit Daemon
systemctl stop packagekit #suite of software applications for updates
systemctl stop packagekit-offline-update
systemctl stop postfix
systemctl stop qemu-guest-agent
systemctl stop smartd #rtkit-daemon
systemctl stop smartd #smartd
systemctl stop tuned
systemctl stop udisks2 #udisks2
systemctl stop upower #upower
systemctl stop vmtoolsd #vmtoolsd
systemctl stop wpa_supplicant #WiFi Driver


systemctl stop pmpause
systemctl stop pmlogger
systemctl stop pmdaroot
systemctl stop pmie
systemctl stop pmdakvm
systemctl stop pmproxy
systemctl stop pmcd
systemctl stop pmdaxfs

systemctl mask pmpause
systemctl mask pmlogger
systemctl mask pmdaroot
systemctl mask pmie
systemctl mask pmdakvm
systemctl mask pmproxy
systemctl mask pmcd
systemctl mask pmdaxfs


exit

