USE sakila;

-- 문제1번) store 별로 staff는 몇명이 있는지 확인해주세요.
SELECT store_id, count(staff_id) staff_count FROM staff
group by store_id;

-- 문제2번) 영화등급(rating) 별로 몇개 영화film을 가지고 있는지 확인해주세요.
SELECT rating, count(rating) numbers_of_rating FROM film
group by rating;

-- 문제3번) 출현한 영화배우(actor)가  10명 초과한 영화명은 무엇인가요?
SELECT title, count(actor_id) number_of_actors FROM film_actor fa
LEFT JOIN film f ON fa.film_id = f.film_id
group by fa.film_id
HAVING count(actor_id) > 10;

/* 아래와 같은 방법으로도 가능함
select f.title, fc.cnt 
from (select fa.film_id, count(*) cnt
from film_actor fa
group by fa.film_id having count(*) > 10) fc
inner join film f on f.film_id = fc.film_id */

-- 문제4번) 영화 배우(actor)들이 출연한 영화는 각각 몇 편인가요?
-- - 영화 배우의 이름 , 성 과 함께 출연 영화 수를 알려주세요.
SELECT a.actor_id, first_name, last_name, count(film_id) number_of_films fROM film_actor fa
LEFT JOIN actor a ON fa.actor_id = a.actor_id
group by a.actor_id
order by a.actor_id asc;
 /* 아래의 방법도 가능
select a.first_name, a.last_name, fa.cnt 
from (select fa.actor_id, count(*) cnt
from film_actor fa
group by fa.actor_id) fa
inner Join actor a on fa.actor_id =a.actor_id
*/

-- 문제5번) 국가(country)별 고객(customer) 는 몇명인가요?
SELECT country, count(customer_id) numbers_of_customer FROM customer c
JOIN address a ON c.address_id = a.address_id
JOIN city ct ON a.city_id = ct.city_id
JOIN country cr ON ct.country_id = cr.country_id
group by country;

/*
select cy.country , count(customer_id) cnt
from customer c
inner join address a  on c.address_id = a.address_id
inner join city    ct on ct.city_id   = a.city_id
inner join country cy on ct.country_id = cy.country_id
group by cy.country;
*/

-- 문제6번) 영화 재고 (inventory) 수량이 3개 이상인 영화(film) 는?
-- - store는 상관 없이 확인해주세요.
SELECT f.film_id, f.title, count(i.inventory_id) FROM inventory i
JOIN film f ON i.film_id = f.film_id
group by i.film_id
HAVING count(i.inventory_id) >= 3;

/* 위의 결과는 825개 아래의 결과는 694개
select  f.title , i.cnt
from
( select  film_id ,  count(*) cnt
from inventory i
group by  film_id
having count(*) > 3
) i
inner join film f on f.film_id = i.film_id;
*/

-- 문제7번) dvd 대여를 제일 많이한 고객 이름은?
SELECT * FROM payment
/*
--문제8번) rental 테이블을  기준으로,   2005년 5월26일에 대여를 기록한 고객 중, 하루에 2번 이상 대여를 한 고객의 ID 값을 확인해주세요.

--문제9번) film_actor 테이블을 기준으로, 출현한 영화의 수가 많은  5명의 actor_id 와 , 출현한 영화 수 를 알려주세요.

--문제10번) payment 테이블을 기준으로,  결제일자가 2007년2월15일에 해당 하는 주문 중에서  ,  하루에 2건 이상 주문한 고객의  총 결제 금액이 10달러 이상인 고객에 대해서 알려주세요.
--(고객의 id,  주문건수 , 총 결제 금액까지 알려주세요)

--문제11번) 사용되는 언어별 영화 수는?

--문제12번) 40편 이상 출연한 영화 배우(actor) 는 누구인가요?

--문제13번) 고객 등급별 고객 수를 구하세요. (대여 금액 혹은 매출액  에 따라 고객 등급을 나누고 조건은 아래와 같습니다.)
/*
A 등급은 151 이상
B 등급은 101 이상 150 이하
C 등급은   51 이상 100 이하
D 등급은   50 이하

- 대여 금액의 소수점은 반올림 하세요.

HINT
반올림 하는 함수는 ROUND 입니다.	
*/