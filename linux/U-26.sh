export LANG=ko_KR.UTF-8
#!/bin/bash

ps -ef | grep auto >/dev/null 2>&1
if [ $? -ne 0 ] ; then
echo "서비스 관리,U-26,automountd,상,양호">> ./linux_report.csv
else
echo "서비스 관리,U-26,automountd,상,양호">> ./linux_report.csv
fi
