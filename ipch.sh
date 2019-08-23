#!/bin/bash

#2019.8.23 martin

#change ip shell

NET_FILE="/etc/sysconfig/network-scripts"

NET_DIR="ifcfg-eno16777736"

cd $NET_FILE/

#change ip static for static:

grep "dhcp" $NET_FILE/ $NET_DIR

#change ip dhcp for static

sed -i s/dhcp/static/g $NET_DIR

sed -i s/ONBOOT=no/ONBOOT=yes/g $NET_DIR

read -p "Please enter ip Address,example 192.168.0.11 ip": IPADDR

cat>>$NET_FILE/$NET_DIR <<EOF

IPADDR=$IPADDR

NETMASK=255.255.255.0

NM_CONTROLLED=no

EOF

systemctl restart network.service


