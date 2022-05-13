# SQL_TIL_for Data Analysis
1. 조인
       Inner조인
       Outer조인
       Self조인
       Full outer조인
       Cross조인
       Natural조인
2. 서브 쿼리
       집합연산자와 서브쿼리 = Union연산
       집합연산자와 서브쿼리 = UnionAll연산
       집합연산자와 서브쿼리 = intersect연산
       집합연산자와 서브쿼리 = Except연산

## JOIN
- 두 테이블을 붙여서 정보를 추출하는 방법
- one to many 관계로 연결되어야 함. 
- 연결되는 구조: 기본키 pk (Primary Key)- 외래키 FK(Foreign Key)
### INNER JOIN
- JOIN중 가장 많이 사용한다. JOIN 의 default 값이 INNER JOIN
- 두 테이블에 모두 정보값이 있을경우 결합하는 방식 (공통분모)
- 만약 한쪽 테이블에 내용이 없는경우 조인하지 않고 결과가 보여지지 않음. 
### OUTER JOIN
- 필요한 내용이 한쪽에만 있어도 사용 가능 
- Atable <LEFT | RIGHT | FULL> OUTER JOIN Btable 으로 사용된다. (LEFT OUTER JOIN = LEFT JOIN)
       - LEFT OUTER JOIN: 왼쪽 테이블의 내용은 모두 출력되어야 한다. 
       - RIGHT OUTER JOIN: 오른쪽 테이블의 내용은 모두 출력되어야 한다. 
       - 왼쪽 오른쪾의 기준은 보이는 그대로의 테이블 
       - FULL OUTER JOIN : 양쪽중 어느 한쪽이라도 들어있는 내용이면 출력
### CROSS JOIN 
- 한쪽 테이블의 모든 행과 다른쪽 테이블의 모든 행을 조인.
- 전체 행 개수 = 두테이블의 각행의 개수를 곱한 개수. (카티션 곱 Cartesian product)
- ON 구문을 사용 하지 않는다. 

### 자체 조인
- 아래 예시와 같이 하나의 테이블을 tree조직도 처럼 엮을 수 있는 방법
- 하나의 테이블에 서로 다른 별칭(alias)을 붙여서 조인하는 방식
```sql
select * FROM Atable a
INNER JOIN Atable b
ON a.column1 = b.column2
WHERE a.column2 = '조건';
```
## 서브 쿼리
- SELECT 안에 또다른 SELECT가 들어가는것 
- 2개의 sql문을 하나로 중첩쿼리는 괄호로 표기후 마지막에 ;로 
