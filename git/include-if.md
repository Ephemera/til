includeIf
---------

조건부로 Git환경을 별도로 설정할 수 있게 해주는 기능이 2.13부터 추가되었다

```
# file: ~/.gitconfig
 
(전략) 

[includeIf "gitdif:~/work/"]
  path = ~/work/.gitconfig
[includeIf "gitdir:~/code/"]
  path = ~/code/.gitconfig
  
(후략)
```

`includeIf`라는 섹션에 `gitdir:`라는 접두사로 조건을 설정해두고 `path`의 값으로
원하는 위치를 설정해두면 해당 위치의 gitconfig값으로 조건마다 다른 값을 둘 수 있다
