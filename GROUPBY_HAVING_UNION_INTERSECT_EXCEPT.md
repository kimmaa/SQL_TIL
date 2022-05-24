# SQL_TIL_for Data Analysis
1. Group by
2. Having
3. UNION
4. UnionAll
5. intersect
6. Except

## GROUP BY
- 데이터를 그룹으로 묶어주는 기능을 한다.

## HAVING 
- GROUP BY와 함께 사용되며 WHERE 절대신 집계함수와 관련된 조건을 제한한다. 

# 집합연산자와 서브쿼리
- SQL에는 집합 개념을 활용한 UNION(합집합), UNION ALL(중복 포함 합집합) INTERSECT(교집합), EXCEPT(차집합) 연산자가 존재한다.
## UNION
- 합집합 연산

## UnionAll
- 중복 포함 합집합

## intersect
- 교집합 연산, PostgreSQL에서만 활용가능하다.
- MySQL에서는 INTERSECT 구문은 작동하지 않는다. 
- 개념을 활용하기 위해 JOIN 연산을 활용한다.
- 모든 컬럼을 key로 INNER JOIN을 실행하면 간단히 해결할 수 있다.

## Except
- 차집합 연산, PostgreSQL에서만 활용가능하다.
- Oracle에서는 EXCEPT 대신 MINUS 연산자가 사용된다.
- 개념을 활용하기 위해 JOIN 연산을 활용한다.
- LEFT(RIGHT) JOIN을 실행하면 한쪽 테이블에 존재하지 않는 ROW에 대해 null 값이 생긴다. 이 NULL 값만을 WHERE 절에서 포함하면 된다.
