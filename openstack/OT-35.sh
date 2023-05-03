export LANG=ko_KR.UTF-8
#!/bin/bash

if [ -f /etc/openstack-dashboard/local_settings.py ] ; then
cat /etc/openstack-dashboard/local_settings.py | grep -i "SESSION_COOKIE_HTTPONLY" >/dev/null 2>&1
if [ $? -ne 0 ] ; then
echo "보안설정,OT-35,Dashboard의 SESSION_COOKIE_HTTPONLY 설정,상,양호">> ./openstack_report.csv
else
echo "보안설정,OT-35,Dashboard의 SESSION_COOKIE_HTTPONLY 설정,상,취약">> ./openstack_report.csv
if [ -f etc/openstack-dashboard/local_settings ] ; then
cat /etc/openstack-dashboard/local_settings | grep -i "SESSION_COOKIE_HTTPONLY" >/dev/null 2>&1
if [ $? -ne 0 ] ; then
echo "보안설정,OT-35,Dashboard의 SESSION_COOKIE_HTTPONLY 설정,상,양호">> ./openstack_report.csv
else
echo "보안설정,OT-35,Dashboard의 SESSION_COOKIE_HTTPONLY 설정,상,취약">> ./openstack_report.csv
fi
fi
fi
fi