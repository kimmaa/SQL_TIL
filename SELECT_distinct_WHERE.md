# SQL_TIL_for Data Analysis

## USE
- 사용할 데이터베이스를 가져올때 사용한다. 

## SELECT * FROM database table
- database tabledptj 확인할 결과셋을 출력할 statement *= all columns

## SELECT distinct 
- SELECT DISTINCT 구분되는 값 하나만 return 한다. 

## WHERE
- WHERE 절은 검색할 필터 역할 부분, 즉 조건절

## 연산자
- 관계연산자
* = 같다 
    - select * from "테이블 명" where "칼럼 명" = "A";        
    칼럼 명에서 A인 데이터들을 가져온다.
* !=, <> 같지 않다
* >, < 크다, 작다. 
* >=, <=  크거나 같다, 작거나 같다. 

- 논리연산자
* AND, && 비교하는 값 모두 참(true)여야 결과가 참(true)
* OR, || 비교하는 값 중 하나라도 참(true)이면 결과가 (true) 

- 기타연산자
* IN(값1, 값2 ...) :: IN 안에 있는 값이 있는 경우 
    - The IN operator allows you to specify multiple values in a WHERE clause.
    - The IN operator is a shorthand for multiple OR conditions.
* NOT IN(값1, 값2 ...) :: NOT IN 안에 있는 값이 없는 경우 
* BETWEEN a AND b  :: a 이상 b 이하의 값 
* LIKE('값%'), LIKE('%값'), LIKE('%값%') :: 값이 처음, 끝, 어디든지 포함된 경우
    - select * from "테이블 명" where "칼럼 명" like "%A";        
    칼럼 명에서 앞 문자열에 상관없이 뒤 문자가 A로 끝나는 데이터를 가져온다.
    - select * from "테이블 명" where "칼럼 명" like "%A%";       
    칼럼 명에서 앞, 뒤 문자열에 상관없이 중간에 A를 포함한 데이터를 가져온다.
* NOT LIKE('값%'), NOT LIKE('%값'), NOT LIKE('%값%')  :: 값이 처음, 끝, 어디든지 포함되지 않은 경우 
    - select * from "테이블 명" where not "칼럼 명" = "A";        // 칼럼 명에서 A 를 제외한 데이터들을 가져온다.
* IS NULL :: NULL 인 경우 
* IS NOT NULL :: NULL 이 아닌 경우

