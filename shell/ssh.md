```
$ ssh-add
Error connecting to agent: No such file or directory
```

=> `SSH_AUTH_SOCK`이 잘못 설정되어 있었던 것 같다. 다시 설정해주면 OK.
