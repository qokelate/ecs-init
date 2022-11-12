#!/bin/bash

service aegis status
service aegis stop

curl -LOR 'http://update.aegis.aliyun.com/download/uninstall.sh'
curl -LOR 'http://update.aegis.aliyun.com/download/quartz_uninstall.sh'
chmod 777 uninstall.sh quartz_uninstall.sh

./uninstall.sh
./quartz_uninstall.sh

pkill -9 aliyun-service
rm -rf /etc/init.d/agentwatch /usr/sbin/aliyun-service
rm -rf /usr/local/aegis*

pkill -9 CmsGoAgent-Worker
rm -rf /usr/local/cloudmonitor

systemctl stop aliyun.service
systemctl disable aliyun.service

rm -rf /usr/local/share/assist-daemon

systemctl stop tuned
systemctl stop firewalld
systemctl stop postfix
systemctl disable postfix
systemctl disable tuned
systemctl disable firewalld

exit
