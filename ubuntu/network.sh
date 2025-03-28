#!/bin/bash

apt install -y network-manager || exit

renewcfg(){
    rm -rf /etc/netplan
    mkdir -pv /etc/netplan
    cat <<'EOF' >/etc/netplan/99-netcfg.yaml
network:
  version: 2
  renderer: NetworkManager
  ethernets:
    alleths:
      dhcp4: true
      dhcp6: false
EOF
}

renewcfg

systemctl stop systemd-networkd.service
systemctl disable systemd-networkd.service
systemctl mask systemd-networkd.service
systemctl unmask NetworkManager
systemctl enable NetworkManager
systemctl restart NetworkManager

renewcfg

# 删除无效连接
# nmcli -t -f uuid,device con | grep -E ':$' | while read line; do
#   nmcli con delete "${line:0:36}"
# done

# 查看当前连接
nmcli connection show

exit
