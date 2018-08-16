curl
----

#### 여러 개의 파일을 받을 때
예를들어 어떤 호스트에서 file1, file2, file3을 받고 싶을 때 `wget`으로는 그냥

```
$ wget http://hostname/{file1,file2,file3}
```

하면 된다.
하지만 기어코 `curl`을 이용해서 받고 싶다고 한다면

```
$ curl --remote-name-all http://hostname/{file1,file2,file3}
```

`--remote-name-all` 옵션만 붙여주면 원격의 파일이름 그대로 받을 수 있다.

