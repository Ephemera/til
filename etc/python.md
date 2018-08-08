Python
======


#### Dict로 이루어진 List를 특정 키의 값으로 정렬하려면:

```python
from operator import itemgetter

result = sorted(list_of_dict, key=itemgetter('key'))
# lambda를 이용할 수도 있다
result = sorted(list_of_dict, key=lambda x:x['key']) 
```

#### Dict로 이루어진 List를 특정 키의 값으로 그루핑하려면:

```python
from operator import itemgetter
from itertools import groupby

# 그루핑을 하려는 키로 정렬을 하고 groupby 해야한다
# 쉘에서 sort를 하고 uniq를 하는 이유와 같다
result = groupby(sorted(list_of_dict, key=itemgetter('key')), key=itemgetter('key'))
```



