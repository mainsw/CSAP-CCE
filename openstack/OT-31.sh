export LANG=ko_KR.UTF-8
#!/bin/bash

if [ ! -e "/etc/keystone/keystone-paste.ini" ]; then
  echo "보안설정,OT-31,admin 토큰 비활성화,상,N/A">> ./openstack_report.csv
  exit 1
fi

cat /etc/keystone/keystone.conf | grep -i "admin_token" >/dev/null 2>&1
if [ $? -ne 1 ] ; then
cat /etc/keystone/keystone-paste.ini | grep -i "AdminTokenAuthMiddleware" >/dev/null 2>&1
if [ $? -ne 1 ] ; then
echo "보안설정,OT-31,admin 토큰 비활성화,상,양호">> ./openstack_report.csv
else
echo "보안설정,OT-31,admin 토큰 비활성화,상,취약">> ./openstack_report.csv
fi
fi