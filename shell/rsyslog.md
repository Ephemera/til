rsyslog
-------

#### rsyslog를 다른 파일로 저장
다른 머신의 syslog를 한 곳에서 받는 상황. \
여러가지 방법이 있지만 뭔가 제한된 상황에서 받는 호스트별로 파일을 분리해서
저장하고 싶을때 ipaddress로 분류하는 방법이 있다.

```
# file: rsyslog.conf
if $fromhost-ip == '192.168.0.10' then /var/log/syslog-host1 
& ~
if $fromhost-ip == '192.168.0.11' then /var/log/syslog-host2 
& ~
```

기본 룰 앞에 위 로직을 적어준다.\
`& ~`의 의미는 조건이 맞을 경우 해당파일에 저장하고 과정을 중단하라는 의미이다.

