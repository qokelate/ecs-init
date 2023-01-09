#!/bin/sh

echo 'nameserver 8.8.8.8' >/etc/resolv.conf
opkg update
opkg install block-mount kmod-fs-ext4 kmod-usb-ohci kmod-usb-storage e2fsprogs fdisk

exit

fdisk -l
fdisk /dev/sda

mkfs.ext4 /dev/sdb
mount /dev/sdb /mnt
mkdir /tmp/cproot
mount --bind / /tmp/cproot
tar -C /tmp/cproot -cvf - . | tar -C /mnt -xvf -
sync
umount /tmp/cproot

block detect > /etc/config/fstab

