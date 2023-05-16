export LANG=ko_KR.UTF-8
#!/bin/bash

TMP=$(ps -ef | grep httpd | awk '{print $1}' )

if echo "$TMP" | grep -q 'root'  ; then
	echo "보안설정,AP-06,웹 프로세스 권한 제한,상,취약">> apache_report.csv
else
	echo "보안설정,AP-06,웹 프로세스 권한 제한,상,양호">> apache_report.csv
fi
