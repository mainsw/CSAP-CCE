export LANG=ko_KR.UTF-8
#!/bin/bash

ls -l /etc/xinetd.d/rstatd >/dev/null 2>&1
if [ $? -ne 0 ] ; then
echo "서비스 관리,U-27,RPC 서비스 확인,상,양호">> ./linux_report.csv
else
echo "서비스 관리,U-27,RPC 서비스 확인,상,취약">> ./linux_report.csv
fi
