export LANG=ko_KR.UTF-8
#!/bin/bash

if [ ! -e "/etc/nova/nova.conf" ]; then
  echo "보안설정,OT-40,Compute의 인증을 위한 keystone 사용,상,N/A"
  exit 1
fi

TMP=$(mktemp)
cat /etc/nova/nova.conf | grep -i "auth_strategy" > $TMP
if [ $TMP  == '#auth_strategy = keystone' ] ; then
echo "보안설정,OT-40,Compute의 인증을 위한 keystone 사용,상,양호">> ./openstack_report.csv
else
echo "보안설정,OT-40,Compute의 인증을 위한 keystone 사용,상,취약">> ./openstack_report.csv
fi
