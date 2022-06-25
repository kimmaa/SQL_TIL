# SQL_TIL_for Data Analysis
1. RANK
2. EXISTS
3. ANY
    비교연산자
4. ALL
    비교연산자

## RANK
### RANK()
- MySQL에서는 서브쿼리에 order by 사용이 불가하므로 rank() over 로 순서를 확인한다.
- rank() over (order by 정렬할기준) 으로 하나의 컬럼을 생성할 수 있다.
- 금액이 같은 경우일 경우 같은 순위를 가진다

### DENSE_RANK()
- dense_rank() 금액이 같은 경우일 경우 같은 순위를 가진다.

## EXISTS
- 두 테이블 간의 결과를 어떤 값이 존재하는 지를 알고 싶은 경우이다. 핵심은 존재하는 가를 판단하는 것이다.
- EXISTS는 두 개의 테이블에서 같은 값을 가진 컬럼끼리 활용하여 서브쿼리 형태로 조건을 걸 수 있다.
- 서브쿼리에서 메인쿼리 테이블을 활용하는 형태를 연관 서브쿼리라고 한다.
- EXISTS 다음으로 오는 SELECT에서 * 대신 아무거나(1, ‘aa’, …) 입력해도 상관없다. EXISTS는 조건이 맞는 지에 대한 TRUE / FALSE만 확인하기 때문이다. 만족하는 결과가 최소 하나가 나오면 바로 TRUE로 판단한다.
- EXISTS 대신 IN (Subquery), JOIN을 활용하여 같은 결과를 얻을 수도 있다.IN (Subquery)는 속도가 느리기 때문에 EXISTS 또는 JOIN을 활용하는 편이 낫다고 한다.

### NOT EXISTS 
- 두 테이블 간의 결과를 어떤 값이 존재하지않는지를 알고 싶은 경우. 
- 예) 한번도 주문한적이 없는 ID, 한번도 빌리지 영화 카테고리 등등

### EXISTS vs IN vs JOIN
- IN, EXISTS 는 함수는 다르나 동일한 결과물을 내는 것이라고 생각해도 된다.
- 하지만 NOT IN, NOT EXISTS 는 NULL 에 의한 차이가 존재한다.

- 예제. 주문한 적이 있는 사용자 찾기
- EXISTS Query
```sql
SELECT * FROM customers WHERE EXISTS (
    SELECT * FROM orders WHERE orders.cs_no = customers.cs_no);
```
- IN Query
```sql
SELECT * FROM customers WHERE cs_no IN ( SELECT DISTINCT cs_no FROM orders);
```
- Join Query
```sql
SELECT DISTINCT c.*
FROM customers c JOIN orders o
on o.cs_no = c.cs_no;
```

## ANY
- 컬럼명 비교연산자 ANY(값들 혹은 서브쿼리)
- 여러개의 비교값 중 하나라도 만족하면 true 반환
- IN과 다른점은 **비교 연산자**를 사용한다는 점

### 비교 연산자와 ANY
```
> ANY : 최소값보다 크면
>= ANY : 최소값보다 크거나 같으면
< ANY : 최대값보다 작으면
<= ANY : 최대값보다 작거나 같으면
= ANY : IN과 같은 기능
= ANY : NOT IN과 같은 기능
```
#### 비교 연산자와 ANY 예제) 
- 서브 쿼리의 AGE 중 최소값보다 큰 AGE를 가진 데이터 조회
``` sql
SELECT * FROM TEST
WHERE AGE > ANY(SELECT AGE FROM TEST WHERE ADDR='서울');
```
- AGE가 20보다 큰 데이터 조회
```sql
SELECT * FROM TEST
WHERE AGE > ANY(20, 22, 31);
```

## ALL
- 컬럼명 비교연산자 ALL(값들 혹은 서브쿼리)
- 전체 값을 비교해서 모두 만족해야 true 반환
 
### 비교 연산자와 ALL
```
> ALL : 최대값보다 크면
>= ALL : 최대값보다 크거나 같으면
< ALL : 최소값보다 작으면
<= ALL : 최소값보다 작거나 같으면
= ALL : 서브 쿼리의 결과가 1건이면 괜찮지만 여러 건이면 오류가 발생
!= ALL : 서브 쿼리의 결과가 1건이면 괜찮지만 여러 건이면 오류가 발생
 ```

#### 비교 연산자와 ALL 예제)
- 서브 쿼리의 AGE 중 최대값보다 큰 AGE를 가진 데이터 조회
``` sql
SELECT *FROM TEST
WHERE AGE > ALL(SELECT AGE FROM TEST WHERE ADDR='서울');
```
- AGE가 31보다 큰 데이터 조회
```sql
SELECT * FROM TEST
WHERE AGE > ALL(20, 22, 31);
```
