#!/bin/bash
portRegex="(^[0-9]$)"
echo "----------------------"
echo "docker-compose.yml 파일 생성기 시작"
echo "사용하는 도메인명 : " $domain
echo "----------------------"
echo "./templates/docker-compose.yml.template 에서 "
echo "./docker-compose.yml을 생성합니다..."
echo ""
cp ./templates/docker-compose.yml.template ./docker-compose.yml
sed -i "" "s/{DOMAIN_NAME}/$domain/gi" ./docker-compose.yml

echo "완료"
echo ""