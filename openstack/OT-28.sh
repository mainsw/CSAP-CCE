#!/bin/bash

if [ ! -f "/etc/neutron/neutron.conf" ]; then
  echo "암호화,OT-28,네트워킹 서비스의 인증을 위한 안전한 프로토콜 사용,상,파일 존재 X" >> openstack_report.csv
exit
fi

auth_url=$(grep -Po "(?<=^\[keystone_authtoken\]\nauth_url = ).*" /etc/neutron/neutron.conf)

if [[ $auth_url == https://* ]]; then
    echo "암호화,OT-28,네트워킹 서비스의 인증을 위한 안전한 프로토콜 사용,상,양호" >> openstack_report.csv
else
    echo "암호화,OT-28,네트워킹 서비스의 인증을 위한 안전한 프로토콜 사용,상,취약" >> openstack_report.csv
fi

