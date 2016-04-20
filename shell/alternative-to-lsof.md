Alternative to lsof
===================

확인하고 싶은 소켓의 [File descriptor][1]가 필요한데 서버에 [lsof][2]가 없고 설치도 여의치 않은 상황이라 대안을 찾아보았다. 물론 `lsof`가 설치되어 있거나 설치가 가능한 경우에는 `lsof`를 사용하는것이 훨씬 수월하다.

먼저 확인하고 싶은 프로세스의 `PID`를 확인한다:

```
$ ps ax | grep [PATTERN]
4790 ?        Sl     6:42 /blahblah/program...
// 첫번째 컬럼의 4790이 PID
```

확인하고 싶은 포트의 `Inode`를 확인한다:

```shell
$ netstat -ane | grep [PATTERN]
tcp        0      0 172.16.123.456:38190    192.168.123.456:8080     ESTABLISHED 1000       184201668 
// 마지막 컬럼의 184201668가 Inode
```


해당 프로세스의 File descriptor 디렉토리를 찾아본다:

```shell
$ ls -l /proc/[PID]/fd | grep [Inode]
lrwx------ 1 owner group 64 Apr 20 18:58 182 -> socket:[184201668]
// 찾았다, 요놈! 182가 찾던 File descriptor
```

:speech_balloon:

p.s. 사실 원래는 훨씬 복잡한 방법으로 Inode를 찾았다. `netstat`로 Inode를 확인하는 것이 불가능한 줄 알고 직접 `/proc/net/tcp`를 뒤져보았다:

```
$ python -c 'print hex(8080)'
0x1f90
$ cat /proc/net/tcp | grep 1F90
12: 8EAB11AC:952E 8356A9C0:1F90 01 00000000:00000000 02:000040EE 00000000  1000        0 184201668 2 ffff88005fef4380 20 4 0 10 -1 
...
```
이 글을 쓰면서 `netstat`에 `-e` 옵션이 있다는 것을 알게 됐...


[1]: https://en.wikipedia.org/wiki/File_descriptor
[2]: http://linux.die.net/man/8/lsof

