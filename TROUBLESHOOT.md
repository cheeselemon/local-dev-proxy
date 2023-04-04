## 트러블슈팅 문서

### ajax CORS 요청 실패


**CORS 도메인 참고 :** 

```
*.dev.com 형태로 구성해주세요.
```

---

### dev websocket 접속 실패

CRA의 경우 dev server 기본값으로 

* HOST=window.location.hostname
* PORT=window.location.port

를 사용합니다.

그런데, localhost:4000 으로 dev 서버를 실행하고 있고, 

nginx reverse proxy를 이용하여 우회 접속하게 되는 경우 dev server 주소로 custom.domain:4000을 바라보게 됩니다. 

예시: 


따라서 환경변수로 `HOST=localhost`를 지정해서 실행합니다. 


결과 : 
