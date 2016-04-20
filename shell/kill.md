kill
====


`kill <pid>`와 `kill -TERM <pid>`는 똑같이 프로세스에게 정지를 명령한다.  

```
$ kill <pid>
$ kill -TERM <pid>
$ kill -s TERM
$ kill -15 TERM  # 이상은 모두 같은 동작이다
```

다만, `SIGTERM`은 `SIGKILL`과는 다르게 프로세스에 의해 잡히거나(?) 무시될 수 있다.

자주 쓰는 신호들
----------------
Portable number | Description
--------------- | -----------
              1 | HUP (hang up)
              2 | INT (interrupt)
              3 | QUIT (quit)
              6 | ABRT (abort)
              9 | KILL (non-catchable, non-ignorable kill)
             14 | ALRM (alarm clock)
             15 | TERM (software termination signal)

