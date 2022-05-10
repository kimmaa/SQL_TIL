## 문자열에서 원하는 부분만 가져오기 SUBSTR()
- 사용 예시 :   
```sql
                SUBSTR(str,pos), 
                SUBSTR(str FROM pos), 
                SUBSTR(str,pos,len), 
                SUBSTR(str FROM pos FOR len)
```
    *str :  원본 문자열
    *pos :  시작 위치값 (pos를 양수만 쓸 수 있는 것이 아니라, 음수로도 쓸 수 있다. 음수로 쓰게 되면 끝에서 부터 체크한다.)
    *len :  가져올 길이값

## Like 사용 
- like 조건 절에 정규식 적용해 특정 문자 패턴을 만족하는 데이터 출력 가능
    1. [ㄱ-ㅎㅏ-ㅣ가-힣a-zA-Z0-9] : 한글, 영어, 숫자를 포함하는 데이터를 출력
    2. [ㄱ-ㅎㅏ-ㅣ가-힣] : 한글 데이터를 포함하는 데이터를 출력
    3. [a-zA-Z] : 영문 데이터를 포함하는 데이터를 출력
    4. [0-9] : 숫자 데이터를 포함하는 데이터를 출력
    5. like 조건에서 '조건%' 을 지정 시 특정 문자 패턴으로 시작하는 데이터를 검색
    6. like 조건에서 '%조건' 을 지정 시 특정 문자 패턴으로 종료하는 데이터를 검색



## Date에서 요소 추출 
### EXTRACT ~FROM~
- 사용 예시 : 
```sql 
select extract('날짜요소' from 컬럼X) as 별칭 from 테이블A;
```
    - 날짜 요소 
        YEAR
        MONTH
        DAY
        HOUR
        MINUTE
        SECOND
### DATE() 라이브러리 이용하여 검색
- WHERE절에서 년도 범위 검색
``` SQL  
    where DATE(orderdate) between '2017-09-02' and '2017-09-03';
```

## CASE ~ WHEN ~ THEN
- 가장 많이 쓰이는 조건문. 조건에 따라 값을 각각 다르게 지정해 주는 역할. 
- CASE사용법 : 
``` SQL  
CASE WHEN 조건절 THEN 참일때 값 ELSE 거짓일때 값 END 컬럼명
```
- 다중 CASE 사용법 :
```sql
SELECT CASE WHEN 조건1 THEN 결과1
WHEN 조건2 THEN 결과2
ELSE 결과3 END FROM 데이터베이스.테이블명;
```
    - 실예시: 테이블(MY_TABLE)에서 성적(SCORE)별 학점을 계산
```SQL
    SELECT *,
   (CASE WHEN SCORE>= '90' THEN 'A학점'
        WHEN (SCORE>= '80' AND SCORE < '90') THEN 'B학점'
        WHEN (SCORE>= '70' AND SCORE < '80') THEN 'C학점' 
        WHEN (SCORE>= '60' AND SCORE < '70') THEN 'D학점'
        ELSE 'F학점' END) AS '학점'
    FROM MY_TABLE
```

## IF ELSE
- CASE WHEN과 같은 조건문. CASE문과 마찬가지로 조건에 따라 원하는 작업을 수행.

- IF 사용법 : if (조건, true, false) 문법으로 사용하며, 오라클 decode와 유사한 기능

```sql
IF 조건 참일때 값 ELSE 거짓일때 값 END 컬럼명
```
    - 사용 예시1
```sql
select if(2<=3, 'A', 'B') as "if 조건 결과";
```
    - 사용 예시2
```sql
- @NUM 이 30일때 30, 40일경우 40이라고 출력, 아닐경우 아니라고 출력--
DECLARE @NUM INT
SET @NUM = 40

IF(@NUM = 30) PRINT 'NUM은 30입니다.' ELSE IF(@NUM=40)
PRINT 'NUM은 40입니다'
ELSE
PRINT 'NUM은 30이나 40이 아닙니다.'
```
