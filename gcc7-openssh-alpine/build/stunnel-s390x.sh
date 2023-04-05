#!/bin/zsh

set -ex

rm -rf stunnel
mkdir stunnel
cd stunnel

BASE=`pwd`

zlib_build(){
	## zlib
	wget -c https://zlib.net/zlib-1.2.13.tar.gz
	tar -xzvf zlib-1.2.13.tar.gz
	cd zlib-1.2.13
	./configure --static --prefix=/mnt/dists/zlib
	make -j$(nproc) && make install
}

openssl_build(){
	## openssl, enable threads 
	wget -c https://github.com/openssl/openssl/archive/OpenSSL_1_1_1k.tar.gz
	tar -xzvf OpenSSL_1_1_1k.tar.gz
	cd openssl-OpenSSL_1_1_1k
	./Configure --prefix=/mnt/dists/openssl-v1.1.1k linux64-s390x zlib threads no-shared \
	--with-zlib-lib=/mnt/dists/zlib/lib --with-zlib-include=/mnt/dists/zlib/include
	make -j$(nproc) && make install_sw
}

stunnel_build(){
	## stunnel 
	wget   -c https://www.stunnel.org/downloads/stunnel-5.69.tar.gz
	tar -xzvf stunnel-5.69.tar.gz
	cd stunnel-5.69
	# refer here https://github.com/jirutka/stunnel-static/blob/master/build.sh
	sed -i 's/^stunnel_LDFLAGS = /&-all-static /' src/Makefile.in
	LDFLAGS="-L/mnt/dists/zlib/lib/ -lz" CFLAGS="-I/mnt/dists/zlib/include" \
	./configure --with-threads=pthread --disable-libwrap --disable-fips --disable-ipv6 --host=arm-linux \
	--prefix=/mnt/dists/stunnel  --with-ssl=/mnt/dists/openssl-v1.1.1k
	make -j$(nproc) && make install
}

cd $BASE

zlib_build
cd $BASE

openssl_build
cd $BASE

stunnel_build
cd $BASE

exit

