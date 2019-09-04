GPG
===

gpg signing을 포함한 커밋을 하려고 해도

```
error: gpg failed to sign the data
fatal: failed to write commit object
```

와 같은 에러가 떨어지고, `gpg --clearsign` 명령을 하면

```
gpg: signing failed: Inappropriate ioctl for device                                                                               
gpg: [stdin]: clear-sign failed: Inappropriate ioctl for device
```

와 같은 에러가 날 경우에 `GPG_TTY`를 설정해주면 문제가 해결된다

```
export GPG_TTY=$(tty)
```
