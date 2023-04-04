#!/bin/bash
portRegex="(^[0-9]$)"
echo "----------------------"
echo "nginx default.conf 파일 생성기 시작"
echo "사용하는 도메인명 : " $domain
echo "----------------------"

while true; do
    echo "로컬 서버의 포트를 알려주세요."
    echo "ex) 3000"
    echo ""
    read port

    if [[ $port =~ $portRegex ]];then
        echo '올바른 포트를 입력해 주세용(숫자)'
    else 
        break
    fi
done

echo "./templates/default.conf.template 에서 "
echo "./conf/conf.d/default.conf 를 생성합니다..."
echo ""
cp ./templates/default.conf.template ./conf/conf.d/default.conf
sed -i "" "s/{DOMAIN_NAME}/$domain/gi" ./conf/conf.d/default.conf
sed -i "" "s/{PORT}/$port/gi" ./conf/conf.d/default.conf

echo "완료"
echo ""