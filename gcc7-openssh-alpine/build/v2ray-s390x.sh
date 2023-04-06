#!/bin/zsh

set -ex

apk update
apk add go

git clone --recursive --depth 1 'https://github.com/v2fly/v2ray-core.git'
cd v2ray-core/main

go build -a -trimpath \
-ldflags "-linkmode external -extldflags -static -s -w" \
-o v2ray .

exit

