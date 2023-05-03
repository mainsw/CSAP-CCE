export LANG=ko_KR.UTF-8
#!/bin/bash

if [ ! -e "/etc/cinder/cinder.conf" ]; then
  echo "보안설정,OT-41,블록 스토리지 서비스의 인증을 위한 keystone 사용,상,N/A">> ./openstack_report.csv
  exit 1
fi

TMP=$(mktemp)
cat /etc/cinder/cinder.conf | grep -i "auth_strategy" > $TMP
if [ $TMP  == '#auth_strategy = keystone' ] ; then
echo "보안설정,OT-41,블록 스토리지 서비스의 인증을 위한 keystone 사용,상,양호">> ./openstack_report.csv
else
echo "보안설정,OT-41,블록 스토리지 서비스의 인증을 위한 keystone 사용,상,취약">> ./openstack_report.csv
fi
