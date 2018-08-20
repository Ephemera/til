diff
----


#### diff opened windows
파일로 존재하는 두 텍스트는 `vimdiff`로 열어서 비교하는걸 알고 있었지만 매번
텍스트를 저장해서 비교할 수는 없기에 방법을 찾아보니 역시 있었다

vim에서 두 윈도우를 열어 비교할 대상을 작성하고

```
:windo diffthis
``` 

를 실행하면 두 윈도우가 diff 상태가 된다. (`:diffthis`는 각 윈도우를 적용)

diff 상태를 해제할 때는

```
:diffoff!
```
