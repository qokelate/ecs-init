#!/bin/bash

sdir=`realpath "$0"`
sdir=`dirname "$sdir"`

yum install -y epel-release
yum install -y zsh rsync vim screen iftop iotop htop git unzip

mkdir /data1
cd /data1
git clone 'https://e.coding.net/sma11case/demo1/zsh-demo.git'
ln -sf /data1/zsh-demo/.oh-my-zsh "$HOME/"
ln -sf /data1/zsh-demo/.zshrc "$HOME/"

ln -sf "$sdir/config/.screenrc" "$HOME/"
ln -sf "$sdir/config/config/.vimrc" "$HOME/"

exit

