#!/bin/bash

# 서명용 호스트 초기화
echo "=========================="
echo " Initializing sining host "
echo "=========================="
mkdir -p ./demoCA
mkdir -p ./demoCA/certs ./demoCA/crl ./demoCA/newcerts ./demoCA/private
touch ./demoCA/index.txt
echo '1000' | tee ./demoCA/serial

# 인증 기관용 인증서 생성
echo "=================================="
echo " Creating a certificate authority "
echo "=================================="
echo "---------------------"
echo " Generate rsa ca key "
echo "---------------------"
openssl genrsa -out ca.key.pem 4096
echo "--------------------------"
echo " Generate rsa ca cert key "
echo "--------------------------"
openssl req -key ca.key.pem -new -x509 -days 7300 -extensions v3_ca -out ca.crt.pem 

# 클라이언트에 인증기관용 인증서 추가
echo "============================================="
echo " Adding the certificate authority to clients "
echo "============================================="
echo "cp ca.crt.pem /usr/local/share/ca-certificates/"
cp ca.crt.pem /usr/local/share/ca-certificates/
echo "update-ca-certificates"
update-ca-certificates

# SSL/TLS 키 생성
echo "========================="
echo " Creating an SSL/TLS key "
echo "========================="
openssl genrsa -out server.key.pem 2048

# SSL/TLS 인증서 서명 요청용 키 생성
echo "================================================="
echo " Creating an SSL/TLS certificate signing request "
echo "================================================="
cp /usr/lib/ssl/openssl.cnf .
openssl req -config openssl.cnf -key server.key.pem -new -out server.csr.pem

# SSL/TLS 인증서 생성
echo "=================================="
echo " Creating the SSL/TLS certificate "
echo "=================================="
openssl ca -config openssl.cnf -extensions v3_req -days 3650 -in server.csr.pem -out server.crt.pem -cert ca.crt.pem -keyfile ca.key.pem
