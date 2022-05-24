# SQL_TIL_for Data Analysis
10. Limit
11. Order BY
12. Format
13. Round
14. TRUNCATE

## Limit
- 출력하는 개수를 제한한다. 
- 사용예시 LIMIT 시작, 개수 --> Limit 개수 (= Limit 0, 개수)
- 주로 ORDER BY와 함께 사용

## ORDER BY
- 결과의 값이나 개수에 대해서 영향을 미치지 않으면서 순서를 조절하나다. 
- ASC 오름차순
- DESC 내림차순
- 정렬기준은 한개 기준이 아니라 여러개 가능
```sql
ORDER BY first_condition DESC, secound_condition ASC
```
## FORMAT
- FORMAT 사용해 숫자 타입의 데이터를 세 자리마다 쉼표(,) 표시 실시
- FORMAT() 함수는 숫자 타입의 데이터를 세 자리마다 쉼표(,)를 사용하는 '#,###,###.##' 형식으로 변환해 줍니다 
- 반환되는 데이터의 형식이 숫자 타입이 아닌 문자열 타입 
- FORMAT 문법 : FORMAT(컬럼 및 데이터, 소주점 이하 표시될 자리수)

```sql
SELECT FORMAT(123456789.123456, 3) as "소수점 쉼표구분", -- [소주점 이하 3자리 표시]
       FORMAT(123456789, 4) as "정수 쉼표구분"; -- [소수점 이하 4자리 표시]
```

## ROUND (반올림)
- 소수점 자리수를 지정 할 수 있다
- ROUND(숫자,반올림할 자릿수) - 숫자를 반올림할 자릿수 +1 자릿수에서 반올림
```sql
SELECT ProductName, Price, ROUND(Price, 1) AS RoundedPrice
FROM Products;
```


## TRUNCATE (버림)
- TRUNCATE(숫자,버릴 자릿수) - 숫자를 버릴 자릿수 아래로 버림
```sql
SELECT TRUNCATE(345.156, 0);
```
