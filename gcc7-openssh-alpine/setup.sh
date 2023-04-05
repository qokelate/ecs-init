#!/bin/sh

set -ex

file='/etc/running.txt'
[ -f "$file" ] && exit

apk update
apk add shadow sudo

apk add git zsh vim rsync screen
apk add git zsh vim rsync screen cmake ca-certificates curl clang gcc distcc python3

apk add ninja make automake musl-dev build-base linux-headers openssh libtool automake autoconf
#apk add gcc-multilib multilib gcc++

ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''
ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N ''
ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -N ''

passwd -l root
ssh-keygen -t ed25519 -f '/root/.ssh/id_ed25519' -q -N ""
[ -n "$SSH_PUB_KEY" ] && echo "$SSH_PUB_KEY" > '/root/.ssh/authorized_keys'

ninja=`which ninja|head -n 1`
ln -sf "$ninja" "$ninja-build"

touch "$file"
exit

