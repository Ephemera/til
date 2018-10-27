grep
----

[grep][1]에 대해 검색하다보면 여러가지 종류의 변이(?) grep이 있음을 알게 된다.
흔히 들어본 egrep(Extended Grep)부터 fgrep(Fixed Grep), rgrep(Recursive Grep),
zgrep, zegrep, zfgrep, pgrep(Process Grep), 등등...

#### egrep
`grep -E`와 같으며 확장된 정규식을 지원한다.

```
$ echo 'asdf' | egrep '\w+'
asdf

$ echo 'asdf' | grep '\w+'

$
```

#### fgrep
`grep -F`와 같으며 정규식을 지원하지 않고 문자열로만 검색하며 빠르다.
특수문자가 포함된 검색할 때 좀 더 편하다.

```
$ echo '[' | fgrep '['
[

$ echo '[' | grep '['
grep: brackets ([ ]) not balanced

$
```

#### rgrep
`grep -R`과 같으며 하위 디렉토리까지 검색의 범위에 들어간다.

#### z.*grep
gzip으로 압축된 파일의 내용을 검색할 때 굳이 압축을 풀지 않고 `z.*grep`을 이용
해서 바로 검색할 수 있다.

#### pgrep
`ps | grep`과 같다


[1]: https://www.gnu.org/software/grep/

