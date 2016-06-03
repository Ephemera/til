flush memcached
===============

찾아보니 몇 가지 방법이 있다

```
$ echo 'flush_all' | nc memcached-server memcached-port
```

```
$ echo 'flush_all' | netcat memcached-server memcached-port
```

```
$ nc memcached-server memcached-port <<< 'flush_all'
```

```
$ telnet memcached-server memcached-port
Trying memcached-server...
Connected to memcached-server.
Escape character is '^]'.
flush_all  <- enter
OK
```

