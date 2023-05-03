export LANG=ko_KR.UTF-8
#!/bin/bash

echo "구분,진단코드,진단항목,취약도,점검결과"> openstack_report.csv

TMP=$(mktemp)
cat /etc/keystone/keystone.conf | grep -i "max_request_body_size" > $TMP

if [ -n $TMP ] ; then
echo "보안설정,OT-30,Identity 서비스 max_request_body_size 설정,상,양호">> ./openstack_report.csv
else
echo "보안설정,OT-30,Identity 서비스 max_request_body_size 설정,상,취약">> ./openstack_report.csv
fi