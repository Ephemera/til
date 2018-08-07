IRC
===


#### 한 이메일로 여러 계정 사용
irc 계정을 쓰다보면 여러개를 써야하는 상황이 있는데 하나의 이메일로 쓰다보면 
너무 많은 계정이 등록되어 있다는 메시지가 뜨면서 등록이 안 되는 경우가 있다. 
그럴때는 하나의 계정으로 그룹핑 시켜주면 된다.

``` 
# 새로 생성한 계정으로 등록을 하려니 불가능하다는 메시지가 뜬다
/nick [new_account]
/msg nickserv register [password] asdf@asdf.com 
=> [NickServ] asdf@asdf.com has too many accounts registered.

# 우선 기존에 쓰는 계정으로 인증 
/msg nickserv identify [account] [password]

# 그루핑
/msg nickserv group
=> [NickServ] Nick [new_account] is now registered to your account.

# 끝
```



