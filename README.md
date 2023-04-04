# local-dev-proxy
local 개발을 위한 HTTPS 프록시 서버 입니다.

<a href="HOWITWORKS.md">구조 이해하기</a>

## 시작하기

`scripts/start.sh` 스크립트가 수행하는 절차는 다음과 같습니다.
 
1. 로컬 개발에 사용할 SSL 인증서를 발급 합니다. 

2. nginx 웹서버의 default.conf 파일을 생성합니다.

3. docker-compose.yml 파일을 생성합니다.


### 스크립트 실행하기

프로젝트 루트에서 다음과 같이 실행하세요. 

```bash
bash ./scripts/start.sh
```

**CORS 도메인 참고 :** 

```
*.dev.com 형태로 구성해주세요.
```


예시 도메인으로 `local.dev.com` 를 사용하겠습니다.




```
----------------------
로컬 인증서 생성기 시작
----------------------
사용하고자 하는 도메인명을 입력해 주세요
ex) local.dev.com

local.dev.com
local.dev.com  -> 이 도메인을 사용하시겠습니까? (y/n)
y

...
```

사용하고자 하는 프론트 앱의 포트는 `3000`번을 사용하겠습니다. 


```

----------------------
nginx default.conf 파일 생성기 시작
사용하는 도메인명 :  local.dev.com
----------------------
로컬 서버의 포트를 알려주세요.
ex) 3000

3000 
```
...

```
----------------------
docker-compose.yml 파일 생성기 시작
사용하는 도메인명 :  local.dev.com
----------------------
./templates/docker-compose.yml.template 에서 
./docker-compose.yml을 생성합니다...

완료
```

여기까지 출력되었다면 모든 파일이 완성되었습니다.

프로젝트 폴더에서 다음과 같은 파일들이 생성되었는지 확인해보세요.

`docker-compose.yml`

`conf/conf.d/default.conf` 

`cert/local.dev.com.crt`

`cert/local.dev.com.key`

`cert/local.dev.com.pem`

---
### 로컬 SSL 인증서 허용하기

Finder에서 `local.dev.com.pem` 파일을 더블클릭 하여

Keychain Access의 **로그인** 항목에 추가합니다.

추가된 인증서를 더블클릭하여 인증서의 Trust 설정을 변경하겠습니다. 

상세 정보창을 닫기를 눌러 허용 설정을 저장합니다. (패스워드 입력하거나 지문 인식)

아래와 같이 This certificate is marked as trusted... 라고 표시되면 인증서 허용이 완료된 것입니다.

---
### docker compose 

도커를 이용해 nginx 컨테이너를 실행합니다. 

```
docker compose up -d 
```

nginx 설정파일 및 docker-compose 설정파일이 정상적으로 생성되었다면,
도커 컨테이너가 정상적으로 실행됩니다. 

```
docker ps

CONTAINER ID   IMAGE                 COMMAND                  CREATED         STATUS        PORTS                                      NAMES
12ee5bf84e72   nginx:1.23.2-alpine   "/docker-entrypoint.…"   2 seconds ago   Up 1 second   0.0.0.0:80->80/tcp, 0.0.0.0:443->443/tcp   local-dev-proxy
```

---

### /etc/hosts 설정

/etc/hosts 파일에 원하는 도메인이 127.0.0.1을 바라보게 해야 합니다.

```
sudo vi /etc/hosts
```

맨 아래에 다음과 같은 줄을 추가하고 저장합니다.

```
127.0.0.1 local.dev.com
```


---

### 브라우저를 켜고 확인해봅니다

https://local.dev.com 으로 접속해서 웹 사이트가 잘 나오는지 확인합니다.


---
## Troubleshooting

<a href="TROUBLESHOOT.md">Troubleshooting</a>


---

### TO-DO

* [ ] wildcard 서브도메인에 대해 SSL 인증서를 발급받을 수 있게 하기 

* [ ] multi 서브도메인에 대해 nginx routing 


https://serverfault.com/questions/811111/wildcard-localhost-ssl-with-nginx-and-chrome