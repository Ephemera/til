less
=====

#### less +F
파일의 변화분을 실시간으로 볼 수 있다는 점은 `tail -f`와 같다.

다만 `less +F`는 모드가 변경할 수 있다.\
watching mode -> Ctrl-C -> navigation mode\
navigation mode -> F -> watching mode

`tail`은 실행시점부터 파일을 읽으나 `less`는 파일 전체를 로드한다.

`tail`은 여러 파일을 동시에 볼 수 있지만 `less`는 한 번에 파일 한 개밖에 안 된다.

`less`는 기본적으로 제어문자들을 날 것으로 보여준다. `-r` 옵션을 붙이면 원하는대로 노출된다.
