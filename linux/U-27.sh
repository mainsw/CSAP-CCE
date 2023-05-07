export LANG=ko_KR.UTF-8
#!/bin/bash

if [ -f /etc/xinetd.d ] ; then
cat /etc/xinetd.d/rstatd >/dev/null 2>&1
if [ $? -ne 0 ] ; then
	# 불필요한 RPC 서비스가 비활성화 되어 있는 경우
	echo "서비스 관리,U-27,RPC 서비스 확인,상,양호">> linux_report.csv
else
	# 불필요한 RPC 서비스가 활성화 되어 있는 경우
	echo "서비스 관리,U-27,RPC 서비스 확인,상,취약">> linux_report.csv
fi
fi

if [ -f /etc/inetd.conf ] ; then
cat /etc/inetd.conf >/dev/null 2>&1
if [ $? -ne 0 ] ; then
	# 불필요한 RPC 서비스가 비활성화 되어 있는 경우
	echo "서비스 관리,U-27,RPC 서비스 확인,상,양호">> linux_report.csv
else
	# 불필요한 RPC 서비스가 활성화 되어 있는 경우
	echo "서비스 관리,U-27,RPC 서비스 확인,상,취약">> linux_report.csv
fi
fi
