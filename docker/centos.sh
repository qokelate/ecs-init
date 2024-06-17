#!/bin/bash

set -e

cat <<'EOF' >'/usr/lib/systemd/system/docker.socket'
[Unit]
Description=Docker Socket for the API

[Socket]
ListenStream=/run/docker.sock
SocketMode=0660
SocketUser=root
SocketGroup=root

[Install]
WantedBy=sockets.target
EOF

cat <<'EOF' >'/usr/lib/systemd/system/docker.service'
[Unit]
Description=Docker Application Container Engine
Documentation=https://docs.docker.com
After=network-online.target docker.socket firewalld.service containerd.service time-set.target
Wants=network-online.target containerd.service
Requires=docker.socket

[Service]
Type=notify
ExecStart=/usr/bin/dockerd -H fd://
ExecReload=/bin/kill -s HUP $MAINPID
TimeoutStartSec=0
RestartSec=2
Restart=always

StartLimitBurst=3

StartLimitInterval=60s

LimitNPROC=infinity
LimitCORE=infinity
LimitNOFILE=1024:524288

TasksMax=infinity

Delegate=yes

KillMode=process
OOMScoreAdjust=-500

[Install]
WantedBy=multi-user.target
EOF

cd /tmp
curl -LORk 'https://download.docker.com/linux/static/stable/x86_64/docker-18.06.3-ce.tgz'
tar zxvf docker-18.06.3-ce.tgz
rsync -aP docker/ /usr/bin/
systemctl daemon-reload
rm -rf docker docker-18.06.3-ce.tgz

exit

yum install -y yum-utils

yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

yum install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

exit
