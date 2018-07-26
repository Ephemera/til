nginx -V
========

서버별로 nginx의 기본 정보들을 비교할 일이 있어서 `sudo nginx -V > result.out` 명령의 결과를 각 파일로 저장하려고 하였으나 터미널에 출력만 될 뿐 전혀 저장이 되지 않았다. 
owner 이슈인줄 알고 이래저래 명령어를 바꿔가며 해보았으나 해결되진 않았다.

문제는 `nginx -V`의 아웃풋.\
`nginx -V`는 결과를 `stderr`로 내려준다. 그러니 못 받을 수 밖에.\
`stdout`으로 돌려주면 잘 가져올 수 있다.

```
$ sudo nginx -V 2>&1 > result.out
```

