Worktree
========

branchA에서 작업을 하다 branchB에서 작업을 해야하거나 같은 브랜치에서 다른 작업을 해야하는 등의 전환이 필요할 경우 `git stash`를 사용하곤했는데 `git worktree`를 이용하면 더 편하게 다른 작업을 할 수 있다.

```
$ git worktree add ../feature origin/master 
Preparing ../feature (identifier master)
HEAD is now at f8327ea It's fake 

$ git worktree list
/Users/Ephemera/src/master   a061aab [master]
/Users/Ephemera/src/feature  f8327ea [master]

$ cd ../feature
// Continue to hack, commit 

$ cd ../master
$ rm -rf ../feature && git worktree prune
$ git worktree list
/Users/Ephemera/src/master   a061aab [master]
```

Git 2.5 부터 지원하는 명령이고 다른 디렉토리에 따로 클론 받는 것과 유사하게 동작하나 차이점(으로 보이는 것)은 중앙(?)관리가 가능하다는 것이며 `-b`옵션으로 브랜치를 동시에 생성하는 것도 가능하다.

`git worktree add`로 생성된 디렉토리 안의 `.git`은 디렉토리가 아니라 파일이며 `gitdir`정보를 가지고 있다. 그리고 해당 worktree의 정보는 기본 디렉토리의 `.git/worktree`에 담긴다.

