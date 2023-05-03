export LANG=ko_KR.UTF-8
#!/bin/bash

VERSION=$(mktemp)
cat /etc/mail/sendmail.cf | grep DZ > $VERSION
if [ $VERSION == 8.15.2 ] ; then
echo "서비스 관리,U-30,Sendmail 버전 점검,상,양호">> ./linux_report.csv
else
echo "서비스 관리,U-30,Sendmail 버전 점검,상,취약">> ./linux_report.csv
fi