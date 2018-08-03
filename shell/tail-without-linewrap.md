tail without linewrap
=====================

`tail`을 사용해서 텍스트나 로그 등을 볼 때 자동으로 스크린 사이즈에 맞춰서 줄넘김을 해버려서 불편할 때가 있다.

```
tail -f access.log | less -S
```

`less`의 `-S`옵션은 스크린 사이즈를 넘어가는 내용을 잘라버린다.

