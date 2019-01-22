systemd
-------

#### 특정 디렉토리에서 실행할 필요가 있을때

예를 들어 아래와 같은 코드를 system service로 실행하려고 한다

```
#!/bin/sh

set -e

npm install
export PATH="node_modules/.bin:node_modules/hubot/node_modules/.bin:$PATH"

exec node_modules/.bin/hubot --name "me-bot" "$@" 
```

`ExecStart`만 설정하면 루트를 기준으로 상대경로를 인식하기 때문에 파일을 찾을 수
없는 문제가 생긴다.
이럴때 `WorkingDirectory`를 설정해주면 된다.

```
[Service]
WorkingDirectory=/path/to/run
ExecStart=/path/to/run/exefile
```

