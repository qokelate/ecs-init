#!/bin/sh

echo 'nameserver 8.8.8.8' >/etc/resolv.conf
opkg update
opkg install zsh vim htop file coreutils-truncate coreutils-realpath coreutils-nohup bind-dig git screen rsync 
opkg install unzip procps-ng-kill procps-ng-pkill procps-ng-ps

opkg install ca-certificates ca-bundle
opkg install curl iftop socat haproxy

ln -sf /usr/bin/zsh /bin/

exit
