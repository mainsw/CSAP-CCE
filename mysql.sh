#!/bin/bash

# 실행할 스크립트 파일들을 배열에 추가
scripts=(DY-01.sh DY-02.sh DY-03.sh DY-04.sh DY-05.sh DY-06.sh DY-07.sh DY-08.sh DY-09.sh)

echo "mysql에 접속하기 위해 비밀번호를 입력하시오..."
read pass
export pass
# 지금은 read로 비밀번호 한번만 입력하면 되게끔 변경 

# 배열에 추가한 스크립트 파일들을 차례대로 실행
for script in "${scripts[@]}"
do
    bash "./mysql/$script"
done