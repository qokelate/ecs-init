#!/bin/bash

sdir=`dirname "$0"`
sdir=`realpath "$sdir/.."`


yum install -y epel-release
yum install -y zsh rsync vim screen iftop iotop htop git unzip

[ -d '/data1' ] || mkdir -pv /data1
cd /data1
git clone 'https://e.coding.net/smallcase/demo1/zsh-demo.git'
ln -sf /data1/zsh-demo/.oh-my-zsh "$HOME/"
ln -sf /data1/zsh-demo/.zshrc "$HOME/"

ln -sf "$sdir/config/.screenrc" "$HOME/"
ln -sf "$sdir/config/.vimrc" "$HOME/"

exit

