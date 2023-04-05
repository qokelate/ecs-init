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
    'alpine:latest' '/data1/gcc7-alpine/run.sh'

