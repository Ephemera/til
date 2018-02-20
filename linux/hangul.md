한글설정
--------

1\.  
fcitx-hangul 설치  
`$ sudo apt install fcitx-hangul`  

2\.  
`System Settings > Language Support`에 들어가서 필요한 나머지 패키지들을 설치한다(들어가면 팝업이 뜨면서 자동으로 진행됨)  

3\.  
위 창의 `Keyboard input method system:`에서 `fcitx`를 선택

4\.  
`AllSettings > Text Entry`에서 `Input sources to use:`에서는 `Hangul(Fcitx)`선택, `Switch to next source using:`에서는 원하는 단축키를 선택

4.0.  
단축키를 한영키로 입력하려고 하면 `The shortcut "Hangul" cannot be used because it will become impossible to type using this key`라고 하면서 입력이 불가능할 수 있다.

4.1.  
이럴땐 dconf-tools를 설치하고  
`$ sudo apt install dconf-tools`

4.2.  
dconf Editor를 실행한 다음 `org > gnome > desktop > wm > keybindings`로 들어가서 보면 `switch-input-source`키가 있는데 이 키의 값을 `Hangul`로 변경하면 한영키로 설정이 가능하다

5\.  
화면 우측상단 메뉴바의 fcitx아이콘을 선택해서 `Configure Current Input Method`를 선택하고 한글 설정에 들어가면 세벌식 설정도 가능하다


