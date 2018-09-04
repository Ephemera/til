nginx
-----

#### remove 'Server' header
HTTP응답에 기본적으로 `Server`라는 항목이 포함되어 있는데 웹서버의 종류와 버전을
명시하고 있다. 하지만 이 정보는 클라이언트입장에서 불필요한 정보일 뿐만아니라
서버입장에서는 (심각하진 않지만)보안상 헛점(?)을 제공하게 되는 것이기도 해서
웬만하면 제거해주는 것이 좋다.

nginx에서는 `headers-more-nginx-module`을 설치하거나 openresty를 사용하고
`more_clear_headers`설정을 해주면 된다.

```
(전략)

http {
  more_clear_headers 'Server';
  
(후략)  
```

