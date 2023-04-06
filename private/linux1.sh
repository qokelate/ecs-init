#!/bin/bash

echo 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBD+Y1DwXMQQDU0BtbCLv5MGWdH92j6m7HWJxxj0AALL demodata' > /root/.ssh/authorized_keys

sed -i -e 's/PasswordAuthentication/#PasswordAuthentication/g' /etc/ssh/sshd_config

echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config
echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config

systemctl restart sshd

mkdir /data1
cd /data1

yum install -y git
git clone 'https://e.coding.net/smallcase/demo1/ecs-init.git'

/data1/ecs-init/misc/rhel9.sh
/data1/ecs-init/misc/setup.sh
/data1/ecs-init/misc/no-useless-service.sh

exit
