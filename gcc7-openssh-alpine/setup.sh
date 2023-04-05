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

ninja=`which ninja|head -n 1`
ln -sf "$ninja" "$ninja-build"

# passwd -l root
ssh-keygen -t ed25519 -f '/root/.ssh/id_ed25519' -q -N ""
[ -n "$SSH_PUB_KEY" ] && echo "$SSH_PUB_KEY" > '/root/.ssh/authorized_keys'

if [ -d "/data1/zsh-demo/.oh-my-zsh" ]; then
    ln -sf "/data1/zsh-demo/.zshrc" "$HOME/"
    ln -sf "/data1/zsh-demo/.oh-my-zsh" "$HOME/"
fi

touch "$file"
exit

