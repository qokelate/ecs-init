#!/bin/sh

"$(dirname "$0")/setup.sh"

/usr/sbin/sshd -D

exit


docker network create \
--driver=bridge '--subnet=172.16.0.1/24' \
--opt 'com.docker.network.bridge.name=net0' \
net0


docker run --restart=unless-stopped --name=gcc7-alpine -d \
    -h 'gcc7-alpine.local' --net net0 -e 'TZ=Asia/Shanghai' \
    -p '20002:22' \
    -v '/data1:/data1' \
    -v '/data1:/mnt' \
    -e 'SSH_PUB_KEY=ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBD+Y1DwXMQQDU0BtbCLv5MGWdH92j6m7HWJxxj0AALL demo1' \
    'alpine:latest' '/data1/ecs-init/gcc7-openssh-alpine/run.sh'

ln -sf "/data1/zsh-demo/.zshrc" "$HOME/"
ln -sf "/data1/zsh-demo/.oh-my-zsh" "$HOME/"
