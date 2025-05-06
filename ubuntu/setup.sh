#!/bin/bash

apt update
apt install -y language-pack-zh-hans
apt install -y zsh rsync vim screen iftop iotop htop git unzip net-tools zip

mkdir -pv /data1; cd /data1
git clone 'https://e.coding.net/smallcase/demo1/zsh-demo.git'
ln -sf /data1/zsh-demo/.oh-my-zsh "$HOME/"
ln -sf /data1/zsh-demo/.zshrc "$HOME/"

sdir=`dirname "$0"`
ln -sf "$sdir/config/.screenrc" "$HOME/"
ln -sf "$sdir/config/.vimrc" "$HOME/"

exit