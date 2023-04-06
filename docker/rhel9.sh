#!/bin/bash

dnf -y install dnf-plugins-core

yum install -y yum-utils

yum-config-manager \
    --add-repo \
    'https://download.docker.com/linux/rhel/docker-ce.repo'

yum install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

exit
