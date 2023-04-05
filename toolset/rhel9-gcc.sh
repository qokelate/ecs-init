#!/bin/bash

dnf install -y git

git config --global user.name "Full Name"
git config --global user.email "email@example.com"
git config --global core.editor vim

dnf group install -y "Development Tools"
dnf install -y llvm-toolset

dnf install -y make autoconf libtool cmake3

exit
