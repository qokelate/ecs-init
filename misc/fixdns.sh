#!/bin/bash

grep 'dns=default' '/etc/NetworkManager/NetworkManager.conf' || \
sed -i.bak -e "s|\[main\]|\[main\]\ndns=default\n|" '/etc/NetworkManager/NetworkManager.conf'

rm -f /etc/resolv.conf
systemctl disable systemd-resolved.service
systemctl stop systemd-resolved
systemctl restart NetworkManager

exit
