#!/bin/bash

# 파일 생성 및 초기화
echo "구분,진단코드,진단항목,취약도,점검결과" > linux_report.csv

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
