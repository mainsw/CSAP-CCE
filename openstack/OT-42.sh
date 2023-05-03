export LANG=ko_KR.UTF-8
#!/bin/bash

if [ ! -e "/etc/nova/nova.conf" ]; then
  echo "보안설정,OT-42,안전한 환경에서의 NAS 운영,상,N/A"
  exit 1

cat /etc/cinder/cinder.conf | grep -i "nas_secure_file_permission" >/dev/null 2>&1
if [ $? -ne 0 ] ; then
echo "보안설정,OT-42,안전한 환경에서의 NAS 운영,상,양호">> ./openstack_report.csv
cat /etc/cinder/cinder.conf | grep -i "nas_secure_file_operations"
elif [ $? -ne 0 ] ; then
echo "보안설정,OT-42,안전한 환경에서의 NAS 운영,상,양호">> ./openstack_report.csv
else
echo "보안설정,OT-42,안전한 환경에서의 NAS 운영,상,취약">> ./openstack_report.csv
fi
fi