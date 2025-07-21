#!/bin/bash

apt update
apt install -y language-pack-zh-hans
apt install -y dnsutils iputils-ping telnet zsh rsync vim screen iftop iotop htop git unzip net-tools zip curl

mkdir -pv /data1; cd /data1
git clone 'https://e.coding.net/smallcase/demo1/zsh-demo.git'
ln -sf /data1/zsh-demo/.oh-my-zsh "$HOME/"
ln -sf /data1/zsh-demo/.zshrc "$HOME/"

cd "$(dirname "$0")"
sdir=`git rev-parse --show-toplevel`
sdir=`realpath "$sdir"`
ln -sf "$sdir/config/.screenrc" "$HOME/"
ln -sf "$sdir/config/.vimrc" "$HOME/"

exit