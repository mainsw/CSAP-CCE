#!/bin/bash

# /etc/services 파일 검사
if [ -O /etc/services ] && [ $(stat -c "%a" /etc/services) -le 644 ]; then
echo "파일 및 디렉토리 관리,U-13,/etc/services 파일 및 권한 설정,상,양호" >> linux_report.csv
else
echo "파일 및 디렉토리 관리,U-13,/etc/services 파일 및 권한 설정,상,취약" >> linux_report.csv
fi

# /etc/srvices 파일 검사
#if [ ! -O /etc/services ] || [ $(stat -c "%a" /etc/services) -gt 644 #]; then
#echo "파일 및 디렉토리 관리,U-13,/etc/services 파일 및 권한 설정,상,취약" >> linux_report.csv
fi
