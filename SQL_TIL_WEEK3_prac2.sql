-- 문제1번) 대여점(store)별 영화 재고(inventory) 수량과 전체 영화 재고 수량은? (grouping set)
-- GROUPING SETS 는 ORACLE 및 DB2사용시 사용가능 MySql에서는 WITH ROLLUP 혹은 UNION ALL을 대신 사용할 수 있다.
SELECT store_id, count(*) FROM inventory i
GROUP BY GROUPING SETS ((store_id),());
-- 동일한 결과값을 UNION ALL 이용하여 풀어내기
SELECT store_id, COUNT(*) cnt FROM inventory i
GROUP BY store_id
UNION ALL
SELECT ifnull(NULL, 'total'), COUNT(*) FROM inventory i;

-- 문제2번) 대여점(store)별 영화 재고(inventory) 수량과 전체 영화 재고 수량은? (rollup)
SELECT ifnull(store_id, 'total') store_id, count(*) FROM inventory i 
GROUP BY store_id WITH ROLLUP;

-- 문제3번) 국가(country)별 도시(city)별 매출액, 국가(country)매출액 소계 그리고 전체 매출액을 구하세요. (grouping set)
SELECT cr.country , ct.city, sum(p.amount) rental_amount FROM payment p
JOIN customer c ON p.customer_id = c.customer_id
JOIN address a ON a.address_id = c.address_id
JOIN city ct ON ct.city_id = a.city_id
JOIN country cr ON cr.country_id = ct.country_id
GROUP BY GROUPING SETS ((cr.country , ct.city) , (cr.country) , ()  )
order by cr.country, ct.city;
-- UNIOIN ALL 을 이용한 풀이 ## 다시 해보기 총합이 안나옴
SELECT ifnull(cr.country, 'Total') country, city, sum(p.amount) rental_amount FROM payment p
JOIN customer c ON p.customer_id = c.customer_id
JOIN address a ON a.address_id = c.address_id
JOIN city ct ON ct.city_id = a.city_id
JOIN country cr ON cr.country_id = ct.country_id
GROUP BY cr.country
UNION ALL
SELECT country, ifnull(ct.city, 'country total')city, sum(p.amount) rental_amount FROM payment p
JOIN customer c ON p.customer_id = c.customer_id
JOIN address a ON a.address_id = c.address_id
JOIN city ct ON ct.city_id = a.city_id
JOIN country cr ON cr.country_id = ct.country_id
GROUP BY ct.city
ORDER BY country, city;

-- 문제4번) 국가(country)별 도시(city)별 매출액, 국가(country)매출액 소계 그리고 전체 매출액을 구하세요. (rollup)
SELECT ifnull(cr.country, 'Total') country, ifnull(ct.city, 'country total')city, sum(p.amount) rental_amount FROM payment p
JOIN customer c ON p.customer_id = c.customer_id
JOIN address a ON c.address_id = a.address_id
JOIN city ct ON a.city_id = ct.city_id
JOIN country cr ON ct.country_id = cr.country_id
GROUP BY cr.country, ct.city with rollup
ORDER BY cr.country, ct.city;

-- 문제5번) 영화배우별로  출연한 영화 count 수 와,   모든 배우의 전체 출연 영화 수를 합산 해서 함께 보여주세요.
SELECT ifnull(actor_id, 'TOTAL') actor_id, count(*) FROM film_actor fa
GROUP BY actor_id with rollup;

-- 문제6번) 국가 (Country)별, 도시(City)별  고객의 수와 ,  전체 국가별 고객의 수를 함께 보여주세요. (grouping sets)
select cty.country , ct.city, count(distinct customer_id) as cnt from customer c
inner join address a on a.address_id = c.address_id
inner join city ct on ct.city_id = a.city_id
inner join country cty on cty.country_id = ct.country_id
group by grouping sets ( (cty.country, ct.city ), (cty.country ))
order by cty.country ,  ct.city;
-- WITH ROLLUP 을 사용한 예
select ifnull(country, 'Total') country, ifnull(city, 'country total')city, COUNT(distinct customer_id) cust_cnt from customer c
JOIN address a ON a.address_id = c.address_id
JOIN city ct ON ct.city_id = a.city_id
JOIN country cr ON cr.country_id = ct.country_id
GROUP BY cr.country, ct.city with rollup
ORDER BY cr.country, ct.city;

-- 문제7번) 영화에서 사용한 언어와 영화 개봉 연도에 대한 영화 갯수와, 영화 개봉 연도에 대한 영화 갯수를 함께 보여주세요.
SELECT ifnull(language_id, 'TOTAL') language_id , release_year , count(film_id) FROM film
GROUP BY language_id, release_year with rollup;

-- 문제8번) 연도별, 일별 결제  수량과,  연도별 결제 수량을 함께 보여주세요.
-- - 결제수량은 결제 의 id 갯수 를 의미합니다.
SELECT YEAR(payment_date), DAY(payment_date), count(payment_id) cnt FROM payment p
GROUP BY YEAR(payment_date), DAY(payment_date) with rollup;

-- 문제9번) 지점 별,  active 고객의 수와 ,   active 고객 수 를  함께 보여주세요. 지점과, active 여부에 대해서는 customer 테이블을 이용하여 보여주세요.
-- - grouping sets 를 이용해서 풀이해주세요.
SELECT store_id, active, Count(customer_id) AS cnt FROM customer c
GROUP BY GROUPING SETS( ( store_id, active ), ( active ) );

-- 문제10번) 지점 별,  active 고객의 수와 ,   active 고객 수 를  함께 보여주세요. 지점과, active 여부에 대해서는 customer 테이블을 이용하여 보여주세요.
-- - roll up으로 풀이해보면서, grouping sets 과의 차이를 확인해보세요.

-- WITH ROLLUP 사용
SELECT store_id, ifnull(active, 'store total') active, count(customer_id) FROM customer c
GROUP BY store_id, active WITH ROLLUP;