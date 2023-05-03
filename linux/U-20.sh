#!/bin/bash

file_paths=("/etc/xinetd.d/finger" "/etc/inetd.conf")

for file_path in "${file_paths[@]}"; do
  if [ -f "$file_path" ]; then
    
    service_enabled=$(grep "disable" $file_path | awk '{print $3}')

    if [ "$service_enabled" = "yes" ]; then
      status="양호"
    else
      status="취약"
    fi
    message="$file_path: finger 서비스 상태-$status"
  fi
done
echo -e "서비스 관리,U-20,Finger 서비스 비활성화,상,$status" >> linux_report.csv
