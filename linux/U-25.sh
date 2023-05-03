export LANG=ko_KR.UTF-8
#!/bin/bash

CHECK1=$(systemctl list-unit-files nfs-server.service | grep ^nfs | awk '{print $2}')
HOSTNAME=$(hostname)
CHECK2=$(showmount -e $HOSTNAME | grep everyone | wc -l)

if [ $CHECK1 == 'disabled' ] || [ $CHECK2 = 0 ]; then
echo "서비스 관리,U-25,NFS 접근통제,상,양호">> ./linux_report.csv
else
echo "서비스 관리,U-25,NFS 접근통제,상,취약">> ./linux_report.csv
fi
