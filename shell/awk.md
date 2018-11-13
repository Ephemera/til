awk
---


#### sort 없이 중복된 줄 제거

일반적으로 제목과 같은 동작을 원할 때 `cat file | sort | uniq`와 같은 명령어로
중복된 줄을 제거한다.\
정확히 똑같은 결과를 주지만 `sort`없이 하려면 `awk`를 써서 하는 방법이 있다.

```
$ cat file | awk '!x[$0]++'
```

`x`라는 배열에 `$0`를 저장하고 없으면 출력하는 명령이다.\
`$0`이라는 `awk` 변수는 한 줄을 그대로 들고 있다.


#### 특정 라인 보기

`awk`에서 사용되는 변수 중에 `NR`이 있다.

```
$ echo -e "a\nb\nc" | awk '{print $1,NR}'
a 1
b 2
c 3
```

과정에 따른 전체 레코드 수(Number of Records variable)를 들고 있다.
이걸 이용하면 쉽게 특정 라인을 가져올 수 있다.

```
$ echo -e "a\nb\nc" | awk 'NR==2'
b
```

#### 기본제공변수들

`NR`에 대해 파악하다보니 다른 변수들도 많았다


**FS**(input Field Separator)

`awk`는 기본적으로 한 칸의 공백을 기준으로 구분하는데 그 구분자를 원하는 것으로 바꿀 수
있다.

```sh
$ echo 'a/b/c d/e/f' | awk '{print $2}'
d/e/f

$ echo 'a/b/c d/e/f' | awk -F '/' '{print $3}'
c d

# 아래와 같이 쓸 수도 있다

$ echo 'a/b/c d/e/f' | awk 'BEGIN {FS="/"} {print $3}'
c d
```

**OFS**(Output Field Separator)

`awk`는 기본적으로 한 칸의 공백을 출력할 때의 구분자로 사용하는데 이것도 변경할
수 있다.

```sh
$ echo 'a b c' | awk 'BEGIN {OFS=",";} {print $1,$2}'
a,b # 공백이 기본구분자이고 출력할 땐 ,를 구분자로 사용했으므로

$ echo 'a/b/c' | awk -F '/' 'BEGIN {OFS=","} {print $1,$2}'
a,b

$ echo 'a/b/c' | awk 'BEGIN {FS="/";OFS=",";} {print $1,$2}'
a,b
```
