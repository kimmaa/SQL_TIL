# SQL_TIL_for Data Analysis
0. 데이터형식
1. USE
2. select
3. select distinct
4. where
5. orderby
6. Like
7. In
8. Between
9. Isnull

## 데이터 형식
- DB의 데이터를 최적화
- 쿼리 속도에도 영향
### 정수형
- TINYINT (1 byte)
- SMALLINT (2 byte)
- INT (4 byte)
- BIGINT (8 byte)
- 추가로 부호를 사용하는 SIGNED와 양수만 사용하는 UNSIGNED

- 추가적으로 숫자로서 의미를 가지려면 다음 2가지 조건을 만족해야한다.
-   더하기/빼기 등 연산에 의미가 있다.
-   크다/작다 또는 순서에 의미가 있다.
-   전화번호 같은 것은 형태는 숫자이지만 숫자의 의미를 지니지 않기 때문에 CHAR(문자형)로 저장하는 것이 조금 더 효율적

### 문자형
- CHAR (1~255 byte) 고정 길이
- VARCHAR (1 ~ 16383 byte) 가변 길이
- CHAR(10)을 사용하면 'abc'를 저장해도 10자리를 사용, VARCHAR(10)에 'abc'를 저장하면 3자리만 가변적으로 사용
- CHAR를 사용하면 메모리 관리 측면에선 안 좋을 수 있지만 성능적으로는 더 효율이 좋기 때문에 고정적인 값을 저장할 때는 CHAR를 사용하는 것이 더 효율적



### 대량 문자 저장
- TEXT/BLOB 형식
- 실수형 FLOAT/DOUBLE
- 날짜형 DATE/TIME/DATETIME

## USE
- 사용할 데이터베이스를 가져올때 사용한다. 

## SELECT * FROM database table
- database tabledptj 확인할 결과셋을 출력할 statement *= all columns

## SELECT distinct 
- SELECT DISTINCT 구분되는 값 하나만 return 한다. 

## WHERE
- WHERE 절은 검색할 필터 역할 부분, 즉 조건절

- WHRER NOT
    - 칼럼 명에서 A 를 제외한 데이터들을 가져온다.

```sql
select * from "테이블 명" where not "칼럼 명" = "A";        
```
- IS NULL :: NULL 인 경우 
- IS NOT NULL :: NULL 이 아닌 경우

## 연산자
### 관계연산자
-  = 같다 
    - select * from "테이블 명" where "칼럼 명" = "A";        
    칼럼 명에서 A인 데이터들을 가져온다.
- !=, <> 같지 않다
-  >, < 크다, 작다. 
-  >=, <=  크거나 같다, 작거나 같다. 

### 논리연산자
- AND, && 비교하는 값 모두 참(true)여야 결과가 참(true)
- OR, || 비교하는 값 중 하나라도 참(true)이면 결과가 (true) 

### 기타연산자
-  IN(값1, 값2 ...) : IN 안에 있는 값이 있는 경우 
    - The IN operator allows you to specify multiple values in a WHERE clause.
    - The IN operator is a shorthand for multiple OR conditions.
- NOT IN(값1, 값2 ...) : NOT IN 안에 있는 값이 없는 경우 
- BETWEEN a AND b  : a 이상 b 이하의 값 
- LIKE('값%'), LIKE('%값'), LIKE('%값%') : 값이 처음, 끝, 어디든지 포함된 경우
    ```sql 
    select * from "테이블 명" where "칼럼 명" like "%A";  
    ```      
    - 칼럼 명에서 앞 문자열에 상관없이 뒤 문자가 A로 끝나는 데이터를 가져온다.
    ```sql
    select * from "테이블 명" where "칼럼 명" like "%A%";   
    ```    
    - 칼럼 명에서 앞, 뒤 문자열에 상관없이 중간에 A를 포함한 데이터를 가져온다.
- NOT LIKE('값%'), NOT LIKE('%값'), NOT LIKE('%값%')  : 값이 처음, 끝, 어디든지 포함되지 않은 경우 


