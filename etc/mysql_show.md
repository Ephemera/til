MySQL
-----

DB이름을 찾을 일이 있어서 손으로 찾아야하나 쉘커맨드로 날려서 그렙해야하나 하다
혹시나해서 찾아봤는데 역시나 `LIKE`가 된다!

```sql
/* SHOW DATABASES syntax */
SHOW {DATABASES | SCHEMAS}
    [LIKE 'pattern' | WHERE expr]  --  e.g. SHOW DATABASES LIKE '%development%'  
    

/* SHOW TABLES syntax */
SHOW [EXTENDED] [FULL] TABLES
    [{FROM | IN} db_name]
    [LIKE 'pattern' | WHERE expr]
``` 


