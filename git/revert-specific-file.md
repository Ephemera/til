Revert specific file
====================

git을 사용하다보면 전체가 아니라 파일 하나만 이전으로 돌리거나 지웠던 파일을 복구해야할 때가 있다

```
git checkout <tree-ish> -- <path> 

// 예를들어 
// git checkout abcdefg -- README.md 
// git checkout develop -- README.md 
// git checkout HEAD~1 -- README.md 
```

