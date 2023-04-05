#!/bin/zsh

set -ex

rm -rf haproxy
mkdir haproxy
cd haproxy

BASE=`pwd`

pcre_build(){
    git clone 'https://github.com/luvit/pcre.git'
    cd pcre
    autoreconf -if .
    ./configure --prefix=/mnt/dists/pcre --enable-static --disable-shared
    make -j$(nproc) && make install
}

haproxy_build(){
    curl -LOR 'http://www.haproxy.org/download/2.4/src/devel/haproxy-2.4-dev9.tar.gz'
    tar -zxvf 'haproxy-2.4-dev9.tar.gz'
    cd 'haproxy-2.4-dev9'

    make TARGET=linux-musl LDFLAGS=-static \
    USE_ZLIB=1 ZLIB_LIB=/data1/dists/zlib/lib ZLIB_INC=/data1/dists/zlib/include \
    USE_PCRE=1 PCRE_LIB=/mnt/dists/pcre/lib PCRE_INC=/mnt/dists/pcre/include \
    USE_OPENSSL=1 SSL_LIB=/mnt/dists/openssl-v1.1.1k/lib SSL_INC=/mnt/dists/openssl-v1.1.1k/include

    make install PREFIX=/mnt/dists/haproxy
}

pcre_build
cd $BASE

haproxy_build
cd $BASE

exit

