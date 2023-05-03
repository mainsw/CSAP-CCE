export LANG=ko_KR.UTF-8
#!/bin/bash

TMP=$(mktemp)
ps -ef | egrep "ypserv|ypbind|ypxfrd|rpc.yppasswdd|rpc.ypupdated" | grep -v grep | awk '{print $2,$6}'> $TMP
if [ -n $TMP ] ; then
echo '"서비스 관리", "U-28", "NIS, NIS+ 점검", "상", "양호"'>> ./linux_report.csv
else
echo '"서비스 관리", "U-28", "NIS, NIS+ 점검", "상", "취약"'>> ./linux_report.csv
fi