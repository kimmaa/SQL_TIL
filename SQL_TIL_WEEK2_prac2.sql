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
SELECT c.first_name, c.last_name, count(p.rental_id) rental_cnt FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN payment p ON r.rental_id = p.rental_id
group by c.customer_id
order by count(p.rental_id) desc
limit 1;
-- 처음 sum(p.amount)으로 뽑았는데, 그렇게 하면 많이 빌린 사람이 아니고 많은 지출을 한 사람으로 추출된다. 
/* 다른 방법
select  c.first_name , c.last_name, rental_cnt
from  customer c inner join
(
select p.customer_id , count(p.rental_id) rental_cnt
from payment p
group by p.customer_id
order by rental_cnt desc
limit 1
) p
on c.customer_id = p.customer_id ;
*/


-- 문제8번) rental 테이블을  기준으로,   2005년 5월26일에 대여를 기록한 고객 중, 하루에 2번 이상 대여를 한 고객의 ID 값을 확인해주세요.
SELECT customer_id, count(distinct rental_id) rental_prequency  FROM rental
WHERE DATE(rental_date) = '2005-05-26'
group by customer_id
HAVING count(distinct rental_id) >=2;

-- 문제9번) film_actor 테이블을 기준으로, 출현한 영화의 수가 많은  5명의 actor_id 와 , 출현한 영화 수 를 알려주세요.
SELECT actor_id, count(distinct film_id) numbers_of_film FROM film_actor
group by actor_id
order by count(distinct film_id) DESC
limit 5; 

-- 문제10번) payment 테이블을 기준으로,  결제일자가 2007년2월15일에 해당 하는 주문 중에서, -->해당 날짜에 데이터가 없어서 임의로 바꿈 2005-07-11
-- 하루에 2건 이상 주문한 고객의  총 결제 금액이 10달러 이상인 고객에 대해서 알려주세요. (고객의 id,  주문건수 , 총 결제 금액까지 알려주세요)
SELECT customer_id, count(distinct rental_id) rental_frequency, sum(amount) total_amount FROM payment
WHERE DATE(payment_date) = '2005-07-11'
group by customer_id
HAVING count(distinct rental_id)>=2 and sum(amount) >= 10;

-- 문제11번) 사용되는 언어별 영화 수는?
SELECT l.name, count(l.name) cnt FROM film f
JOIN language l ON f.language_id = l.language_id
group by l.name;

-- 문제12번) 40편 이상 출연한 영화 배우(actor) 는 누구인가요?
SELECT concat(a.first_name, ' ', a.last_name) actor_fullname, count(fa.film_id) film_number FROM film f
JOIN film_actor fa ON f.film_id = fa.film_id
JOIN actor a ON fa.actor_id = a.actor_id
group by a.actor_id
HAVING count(fa.film_id) >= 40;

-- 같은 결과 다른 표현
select  a.first_name , a.last_name , fc.cnt
from (select fc.actor_id, count(*) cnt
from film_actor fc
group by fc.actor_id
having count(*) >= 40) fc
inner join actor a on a.actor_id = fc.actor_id;

-- 문제13번) 고객 등급별 고객 수를 구하세요. (대여 금액 혹은 매출액에 따라 고객 등급을 나누고 조건은 아래와 같습니다.)
/*
A 등급은 151 이상 // B 등급은 101 이상 150 이하
C 등급은 51  이상 100 이하 // D 등급은 50  이하
- 대여 금액의 소수점은 반올림 하세요. HINT 반올림 하는 함수는 ROUND 입니다.	
*/
SELECT CASE WHEN rental_amount >= 150 THEN 'A' 
WHEN rental_amount BETWEEN 101 AND 150 THEN 'B'
WHEN rental_amount BETWEEN 51 AND 100 THEN 'C'
WHEN rental_amount <= 50 THEN 'D' END customer_classes, count(*) class_count
FROM (
SELECT r.customer_id , round(sum(p.amount) ,0) rental_amount FROM rental r
JOIN payment p ON r.rental_id = p.rental_id
group by r.customer_id
) r
group by case when rental_amount <= 50 then 'D'
when rental_amount between 51  and 100 then 'C'
when rental_amount between 101 and 150 then 'B'
when rental_amount >= 151  then 'A' end
ORDER by customer_classes ASC;

