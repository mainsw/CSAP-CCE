export LANG=ko_KR.UTF-8
#!/bin/bash

TMP=$(mktemp)
cat << EOF >> $TMP
tftp
talk
EOF

ls -l /etc/xinetd.d/$TMP >/dev/null 2>&1
if [ $? -ne 0 ] ; then
echo '"서비스 관리", "U-29", "tftp, talk 서비스 비활성화", "상", "양호"' >> ./linux_report.csv
else
echo '"서비스 관리", "U-29", "tftp, talk 서비스 비활성화", "상", "취약"' >> ./linux_report.csv
fi