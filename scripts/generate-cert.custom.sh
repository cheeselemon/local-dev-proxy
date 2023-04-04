#!/bin/bash


domainRegex="(?=^.{4,253}$)(^(?:[a-zA-Z0-9](?:(?:[a-zA-Z0-9\-]){0,61}[a-zA-Z0-9])?\.)+([a-zA-Z]{2,}|xn--[a-zA-Z0-9][a-zA-Z0-9\-]*[a-zA-Z0-9])$)"
echo "----------------------"
echo "로컬 인증서 생성기 시작"
echo "----------------------"

while true; do
    echo "사용하고자 하는 도메인명을 입력해 주세요"
    echo "ex) local.dev.com"
    echo ""
    read domain

    if [[ $domain =~ $domainRegex ]];then
      echo '올바른 도메인명을 입력해 주세용'
    else
      echo $domain ' -> 이 도메인을 사용하시겠습니까? (y/n)'
      read yn
      case $yn in
        [Yy]* ) break;;
        [Nn]* ) echo '넵 처음부터 다시 시작합니다.';;
        * ) echo "y/n으로 답변해 주세용.. 다시 시작합니다";
      esac
    fi
done

echo "선택한 도메인명으로 인증서를 생성합니다: " $domain
echo ""
echo ""

openssl req -x509 -newkey rsa:4096 -sha256 -days 3650 -nodes \
  -keyout ./cert/$domain.key -out ./cert/$domain.crt -extensions san -config \
  <(echo "[req]"; 
    echo distinguished_name=req; 
    echo "[san]"; 
    echo subjectAltName=DNS:$domain,IP:127.0.0.1
    ) \
  -subj "/CN=$domain"

echo "pem 파일을 생성합니다."
echo ""
cat ./cert/$domain.crt ./cert/$domain.key > ./cert/$domain.pem

echo "인증서 생성 완료."
echo ""
