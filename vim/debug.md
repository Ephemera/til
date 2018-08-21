debug
-----

#### how to read error message
Vim과 여러 플러그인들을 이용하다보면 불친절한 에러메시지와 함께 가끔 디버깅을
할 일이 생긴다. 에러메시지만으로는 무슨 소리인지 알기 어려우나 이번에 삽질을
하면서 조금 알게되었다.

버그가 있는 버전을 이용하다가 커서를 따옴표로 이동할 때마다 에러메시지가 떴다:

```
Error detected while processing function <SNR>49_Highlight_Matching_Pair:
line 97:
E475: Invalid argument: 0
```

처음보면 무슨 소린지 전혀 모르겠다.\
첫번째 줄의 `<SNR>49`는 `:scriptnames`를 실행하면 보여지는 로드된 소스들 중
49번째 파일에서 발생한다는 의미이다.\
두번째 줄은 `Highlight_Matching_Pair`함수의 78번째 라인에서 발생한다는 의미이다.

그래서 원래 소스와 비교를 해보니 내용이 좀 달랐다.\
결론적으로는, 최신으로 업데이트를 했지만 빌드를 잘못해서 옛날 파일을 계속 보고
있어서 이미 수정이 되었지만 적용이 되지 않았던 상황이었다.
