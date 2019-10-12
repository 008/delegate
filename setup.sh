#!/bin/bash

apt-get update
wget https://github.com/008/delegate/raw/master/deleg_ubu16x64.tar.gz
tar xfv de*

/root/delegated -P11111 RELIABLE=* OWNER=root AUTHORIZER=-list{111111:222222} -vs -vS -vH -vt SERVER=socks5 REMITTABLE=* RES_WAIT=0 MAXIMA=delegated:200 MAXIMA=listen:200 HTTPCONF=max-ckapch:200 HTTPCONF=max-cka:200 TIMEOUT=dns:100,acc:100,con:100,lin:1

#echo 1 >/proc/sys/net/ipv4/icmp_echo_ignore_all

