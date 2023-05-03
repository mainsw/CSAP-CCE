#!/bin/bash

# world writable 파일 검색
if [[ $(find / -xdev -type f -perm -o+w) ]]; then
  # 취약한 경우
  echo "파일 및 디렉토리 관리,U-16,world writable 파일 점검,상,취약" >> linux_report.csv
else
  # 양호한 경우
  echo "파일 및 디렉토리 관리,U-16,world writable 파일 점검,상,양호" >> linux_report.csv
fi
