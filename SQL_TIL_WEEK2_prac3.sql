-- 문제1번) 영화 배우가, 영화 180분 이상의 길이의 영화에 출연하거나, 영화의 rating 이 R인 등급에 해당하는 영화에 출연한 영화 배우에 대해서, 
-- 영화 배우 ID 와 (180분이상 / R등급영화)에 대한 Flag 컬럼을 알려주세요.
-- - film_actor 테이블와 film 테이블을 이용하세요. union, unionall, intersect, except 중 상황에 맞게 사용해주세요.
-- - actor_id 가 동일한 flag 값 이 여러개 나오지 않도록 해주세요.
SELECT actor_id, '180mins_over' AS flag
FROM film_actor fa WHERE  film_id IN (SELECT film_id FROM film f WHERE length >= 180)
UNION 
SELECT actor_id, 'rating_R' FROM film_actor fa
WHERE  film_id IN (SELECT film_id FROM film f WHERE rating = 'R')
order by actor_id ASC;
-- Notice the "AS flag" above - it is an alias. SQL Aliases are used to give a table or a column a temporary name. An alias only exists for the duration of the query. So, here we have created a temporary column named "flag", that list whether the contact person is a "180mins_over" or a "Rating_R".

-- 문제2번) R등급의 영화에 출연했던 배우이면서, 동시에, Alone Trip의 영화에 출연한 영화배우의 ID 를 확인해주세요.
-- - film_actor 테이블와 film 테이블을 이용하세요. union, unionall, intersect, except 중 상황에 맞게 사용해주세요.
SELECT a.actor_id, a.first_name, a.last_name FROM film f
JOIN film_actor fa ON f.film_id = fa.film_id
JOIN actor a ON fa.actor_id = a.actor_id
WHERE f.rating = 'R' OR f.title = 'Alone Trip';

/* MySQL에서는 INTERSECT 구문은 작동하지 않는다. 
SQL에는 집합 개념을 활용한 UNION(합집합), UNION ALL(중복 포함 합집합) INTERSECT(교집합), EXCEPT(차집합) 연산자가 존재한다.
참고 : Oracle에서는 EXCEPT 대신 MINUS 연산자가 사용된다.
EXCEPT와 INTERSECT는 PostgreSQL에서만 활용가능하다.
EXCEPT와 INTERSECT 개념을 활용하기 위해 JOIN 연산을 활용한다.

INTERSECT
모든 컬럼을 key로 INNER JOIN을 실행하면 간단히 해결할 수 있다.

EXCEPT
LEFT(RIGHT) JOIN을 실행하면 한쪽 테이블에 존재하지 않는 ROW에 대해 null 값이 생긴다. 이 NULL 값만을 WHERE 절에서 포함하면 된다.


SELECT actor_id
FROM   film_actor fa
WHERE  film_id IN (SELECT film_id
                   FROM   film
                   WHERE  rating = 'R')
INTERSECT
SELECT actor_id
FROM   film_actor fa
WHERE  film_id IN (SELECT film_id
                   FROM   film f
                   WHERE  title = 'Alone Trip')
*/

-- 문제3번) G 등급에 해당하는 필름을 찍었으나, 영화를 20편이상 찍지 않은 영화배우의 ID 를 확인해주세요.
-- - film_actor 테이블와 film 테이블을 이용하세요. union, unionall, intersect, except 중 상황에 맞게 사용해주세요.
/*https://yahwang.github.io/posts/52*/

/*
문제4번) 필름 중에서,  필름 카테고리가 Action, Animation, Horror 에 해당하지 않는 필름 아이디를 알려주세요.

- category 테이블을 이용해서 알려주세요.

문제5번) Staff  의  id , 이름, 성 에 대한 데이터와 , Customer 의 id, 이름 , 성에 대한 데이터를  하나의  데이터셋의 형태로 보여주세요.

- 컬럼 구성 : id, 이름 , 성, flag (직원/고객여부) 로 구성해주세요.

문제6번) 직원과  고객의 이름이 동일한 사람이 혹시 있나요? 있다면, 해당 사람의 이름과 성을 알려주세요.

문제7번) 반납이 되지 않은 대여점(store)별 영화 재고 (inventory)와 전체 영화 재고를 같이 구하세요. (union all)

문제8번) 국가(country)별 도시(city)별 매출액, 국가(country)매출액 소계 그리고 전체 매출액을 구하세요. (union all)
*/