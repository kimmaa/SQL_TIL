# SQL 기본 개념

## SQL (Structured Query Language)
 - 구조화된 질의 언어
 - MySQL과 같은 DBMS의 개념은 1973년 에드거 프랭크 커드라는 학자가 최초 이론 정립 함. 
 - 국제표준화기구에서 SQL에 대한 표준을 정함 **표준 SQL**을 사용
 - 각 회사의 SQL들은 표준SQL을 최대한 따르고 있지만 각자 제품의 특성을 반형한 SQL을 사용함.  

## Database(DB)
- 데이터의 집합

## DBMS (Database Management System)
### 데이터베이스를 관리하고 운영하는 소프트웨어
### 데이터베이스는 여러명의 사용자나 응용 프로그램과 공유하고 동시에 접근이 가능해야해서 DBMS로 이용함. (엑셀은 대용량 데이터 관리하거나 여러사용자와 공유하는 개념과 거리가 있어서 DBMS가아님)

### 종류:    
- MySQL (Oracle | Unix,Linux,windows,Mac | 오픈소스(무료),상용),
- Oracle (Oracle | Unix,Linux,windows | 상용 시장 점유율 1위), 
- SQL Server (MS | windows | 주로 중대형급 시장에서 사용),
- MariaDB (MariaDB| Unix,Linux,windows | 오픈소스(무료),MySQL초기개발자가 독립해서 만듦), 
- PostgreSQL (PostgreSQL | Unix,Linux,windows,Mac | 오픈소스(무료)),
   - DB2 (IBM | Unix,Linux,windows | 메인프레임 시장 점유율 1위)
   - Access (MS | windows | PC용)
   - SQLite (SQLite | Android, iOS | 모바일 전용, 오픈소스(무료))
   
### 분류:
- 계층형 (Hierarchical) :  1960년 시작된 개념, 각 계층은 tree형태. 지금은 사용 안함
- 망형 (Network) : 계층형의 문제를 개선하기위해 1970년에 등장, 각 트리의 리프들끼리도 연결되는 유연한 구조. 단점은 프로그래머가 모든 구조를 이해해야만한다는것. 지금은 사용 안함.
- **관계형 (Relational)** 가장 많이 사용되며 MySQL이 속함 : **RDBMS**는 모든 데이터는 테이블table이라는 최소 단위로 저장되어 구성되며 이 테이블은 하나이상의 열column과 행row
- 객체지향형 (Object-Oriented)
- 객체관계형 (Object-Relational)

