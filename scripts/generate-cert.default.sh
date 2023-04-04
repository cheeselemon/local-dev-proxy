openssl req -x509 -newkey rsa:4096 -sha256 -days 3650 -nodes \
  -keyout ./cert/local.dev.com.key -out ./cert/local.dev.com.crt -extensions san -config \
  <(echo "[req]"; 
    echo distinguished_name=req; 
    echo "[san]"; 
    echo subjectAltName=DNS:local.dev.com,IP:127.0.0.1
    ) \
  -subj "/CN=local.dev.com"

cat ./cert/local.dev.com.crt ./cert/local.dev.com.key > ./cert/local.dev.com.pem