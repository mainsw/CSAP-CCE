export LANG=ko_KR.UTF-8
#!/bin/bash

if [ ! -e "/etc/manila/manila.conf" ]; then
  echo "보안설정,OT-46,공유파일 시스템 인증을 위한 오픈스택 Identity 사용,상,N/A">> ./openstack_report.csv
  exit 1
fi

TMP=$(mktemp)
cat /etc/manila/manila.conf | grep -i "auth_strategy" > $TMP
if [ $TMP  == '#auth_strategy = keystone' ] ; then
echo "보안설정,OT-46,공유파일 시스템 인증을 위한 오픈스택 Identity 사용,상,양호">> ./openstack_report.csv
else
echo "보안설정,OT-46,공유파일 시스템 인증을 위한 오픈스택 Identity 사용,상,취약">> ./openstack_report.csv
fi
