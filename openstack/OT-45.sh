export LANG=ko_KR.UTF-8
#!/bin/bash

if [ ! -e "/etc/glance" ]; then
  echo "보안설정,OT-45,이미지 스토리지 서비스 인증을 위한 keystone 설정,상,N/A">> ./openstack_report.csv
  exit 1
fi

TMP1=$(mktemp)
TMP2=$(mktemp)
cat /etc/glance/glance-api.conf | grep -i "auth_strategy" > $TMP1
cat /etc/glance/glance-registry.conf | grep -i "auth_strategy" > $TMP1
if [ $TMP1  == '#auth_strategy = keystone' ] && [ $TMP2  == '#auth_strategy = keystone' ] ; then
echo "보안설정,OT-45,이미지 스토리지 서비스 인증을 위한 keystone 설정,상,양호">> ./openstack_report.csv
else
echo "보안설정,OT-45,이미지 스토리지 서비스 인증을 위한 keystone 설정,상,양호">> ./openstack_report.csv
fi
