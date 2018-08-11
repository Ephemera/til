openssl
=======


#### 특정 도메인의 인증서 확인
브라우저를 통해 확인할 수도 있지만 커맨드로 간단하게 확인하는 방법도 있다

```
$ echo '' | openssl s_client -connect daum.net:443 

CONNECTED(00000003)                                             
depth=2 /C=US/O=DigiCert Inc/OU=www.digicert.com/CN=DigiCert Global Root G2
(후략)
```

#### 특정 도메인 인증서의 만기일 확인
이 역시도 브라우저를 통해 확인할 수 있지만 커맨드라인으로 확인할 수 있다

```
$ echo '' | openssl s_client -connect daum.net:443 | openssl x509 -noout -dates

depth=2 /C=US/O=DigiCert Inc/OU=www.digicert.com/CN=DigiCert Global Root G2                                                         
(중략)
notBefore=May 23 00:00:00 2018 GMT
notAfter=Jul 21 12:00:00 2020 GMT
```

