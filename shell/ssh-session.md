SSH session
===========

ssh을 이용해서 *같은 서버*에 *여러 세션*으로 접근 할 일이 종종 있는데 열 때마다 커넥션이 하나씩 생기므로 낭비라고 할 수 있다.
이런 상황에 좋은 옵션이 있다.

```bash
# file: ~/.ssh/config

Host * 
ControlMaster auto 
ControlPath ~/.ssh/sessions/master-%r@%h:%p  # 사용하기 이전에 ~/.ssh 아래에 sessions 디렉토리를 생성해줘야함
ControlPersist 600
```

- `Host`는 원하는대로.
- `ControlMaster`를 `auto`로 두면 기존에 있는 연결을 찾아서 시도하고 없으면 새로운 연결을 만든다.
- `ControlPath`에는 공유할 소켓들을 저장한다. (%r은 원격 로그인 유저, %h는 대상 호스트, %p는 연결 포트)
- `ControlPersist`옵션을 사용하지 않으면 마스터 세션(처음 접속한)을 끊었을 때 그 뒤에 붙었던 세션들까지 끊어진다. 단위는 초. `0`이나 `yes`로 설정하면 특별한 액션(e.g. ssh -O exit)을 취하지 않는 한 계속 백그라운드에 남아있다.

세션을 공유함에 따라 시스템 자원을 아낄 수 있다는 장점도 있지만 별도의 인증 과정도 생략되어 시간상 이점도 있다.
