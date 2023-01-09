#!/usr/bin/zsh

cd /tmp

# export all_proxy=http://172.16.1.1:14602
# export http_proxy=http://172.16.1.1:14602

/etc/init.d/dnsmasq stop
echo 'nameserver 8.8.8.8' >/etc/resolv.conf
opkg update
opkg remove dnsmasq
echo 'nameserver 8.8.8.8' >/etc/resolv.conf

opkg install dnsmasq-full
echo 'all-servers' >/etc/dnsmasq.conf
echo 'server=223.5.5.5' >>/etc/dnsmasq.conf
/etc/init.d/dnsmasq restart

wget -O kuoruan-public.key http://openwrt.kuoruan.net/packages/public.key
opkg-key add kuoruan-public.key

if ! grep -qs kuoruan /etc/opkg/customfeeds.conf; then
	echo "src/gz kuoruan_packages http://openwrt.kuoruan.net/packages/releases/$(. /etc/openwrt_release ; echo $DISTRIB_ARCH)" \
	  >> /etc/opkg/customfeeds.conf

	echo "src/gz kuoruan_universal http://openwrt.kuoruan.net/packages/releases/all" \
	  >> /etc/opkg/customfeeds.conf
fi

opkg update
opkg install curl v2ray-core luci-compat

# mv -fv /etc/config/v2ray /etc/config/v2ray.bak
# mv -fv /etc/init.d/v2ray /etc/init.d/v2ray.bak
rm -f /etc/config/v2ray /etc/init.d/v2ray
curl -LORk 'https://github.com/kuoruan/luci-app-v2ray/releases/download/v2.0.0-1/luci-app-v2ray_2.0.0-1_all.ipk'
opkg install luci-app-v2ray_2.0.0-1_all.ipk

exit

