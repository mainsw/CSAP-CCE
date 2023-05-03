

#!/bin/bash

# /etc/securetty 파일에 pts/0 ~ pts/x 관련 설정이 포함되어 있는지 확인
if grep -q "pts/[0-9]" /etc/securetty; then
  securetty_result="양호"
else
  securetty_result="취약"
fi

# SSH를 통해 루트 로그인이 허용되는지 확인
if grep -q "^PermitRootLogin\s*no" /etc/ssh/sshd_config; then
  result="양호"
elif grep -q "^PermitRootLogin\s*yes" /etc/ssh/sshd_config; then
 result="취약"
else
  result="양호"
fi

# 결과를 csv 파일에 저장
echo "구분,진단코드,진단항목,취약도,점검결과" > linux_report.csv
echo "계정관리,U-01,root 계정 원격 접속 제한,상,$result" >> linux_report.csv
