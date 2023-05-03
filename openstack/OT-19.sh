#!/bin/bash

auth_url=$(grep -Po "(?<=^\[glance\]\nauth_url = ).*" /etc/nova/nova.conf)

if [[ $auth_url == https://* ]]; then
    echo "암호화,OT-19,Nova와 Glance의 안전한 통신,상,양호" >> /home/ot/script/openstack_report.csv
else
    echo "암호화,OT-19,Nova와 Glance의 안전한 통신,상,취약" >> /home/ot/script/openstack_report.csv
fi
