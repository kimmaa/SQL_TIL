-- 문제1번) dvd 대여를 제일 많이한 고객 이름은? (analytic funtion 활용)
-- analytic function 사용
SELECT MAX(c.first_name), MAX(c.last_name), r.customer_id, ROW_NUMBER () OVER (ORDER BY count(*) DESC) AS rental_rank FROM rental r
JOIN customer c ON r.customer_id = c.customer_id 
GROUP BY r.customer_id 
ORDER BY RENTAL_RANK
LIMIT 1;

-- ROW_NUMBER () OVER를 사용하여 행의 개수를 세어 순위를 매긴다. 
-- 중복을 허용하려면 dense_rank() over를 사용

-- analytic function 미사용
SELECT MAX(c.first_name) , MAX(c.last_name), count(*) rent_cnt FROM customer c
JOIN rental r ON c.customer_id=r.customer_id
GROUP BY r.customer_id
ORDER BY count(*) DESC
LIMIT 1;

-- 문제2번) 매출을 가장 많이 올린 dvd 고객 이름은? (analytic funtion 활용)
-- analytic function 사용
SELECT MAX(c.first_name) firstname, MAX(c.last_name) lastname, p.customer_id, sum(p.amount) total_amount, ROW_NUMBER()OVER(ORDER BY sum(p.amount)DESC) AS total_rank FROM payment p
JOIN customer c ON p.customer_id = c.customer_id
GROUP BY p.customer_id
ORDER BY total_rank
LIMIT 1;

-- analytic function 미사용 
SELECT c.first_name,c.last_name, p.customer_id, sum(p.amount) total FROM customer c
JOIN payment p ON c.customer_id=p.customer_id
GROUP BY p.customer_id
ORDER BY sum(p.amount) DESC
LIMIT 1;

-- 문제3번) dvd 대여가 가장 적은 도시는? (analytic funtion)
-- analytic function 사용
SELECT ct.city_id, ct.city,count(r.rental_id) rent_total, ROW_NUMBER()OVER(ORDER BY count(r.rental_id)) AS rent_rank FROM rental r
JOIN customer c ON r.customer_id=c.customer_id
JOIN address a ON c.address_id = a.address_id
JOIN city ct ON a.city_id = ct.city_id
GROUP BY ct.city_id
LIMIT 1;
-- analytic function 미사용
SELECT ct.city_id, ct.city, count(r.rental_id) cnt FROM rental r
JOIN customer c ON r.customer_id=c.customer_id
JOIN address a ON c.address_id = a.address_id
JOIN city ct ON a.city_id = ct.city_id
GROUP BY ct.city_id
ORDER BY count(r.rental_id) 
LIMIT 1;

-- 문제4번) 매출이 가장 안나오는 도시는? (analytic funtion)
-- analytic function 사용
SELECT ct.city_id, ct.city,sum(p.amount) amount_total, ROW_NUMBER()OVER(ORDER BY sum(p.amount)) AS payment_total  FROM payment p
JOIN customer c ON p.customer_id=c.customer_id
JOIN address a ON c.address_id = a.address_id
JOIN city ct ON a.city_id = ct.city_id
GROUP BY ct.city_id
LIMIT 1;

-- analytic function 미사용
SELECT ct.city, sum(p.amount) AS payment_total  FROM payment p
JOIN customer c ON p.customer_id=c.customer_id
JOIN address a ON c.address_id = a.address_id
JOIN city ct ON a.city_id = ct.city_id
GROUP BY ct.city_id
ORDER BY SUM(p.amount)
LIMIT 1;

-- 문제5번) 월별 매출액을 구하고 이전 월보다 매출액이 줄어든 월을 구하세요. (일자는 payment_date 기준)
SELECT *,YEAR (payment_date), MONTH (payment_date)FROM payment p
ORDER BY DATE(payment_date)

/*
문제6번) 도시별 dvd 대여 매출 순위를 구하세요.

문제7번) 대여점별 매출 순위를 구하세요.

문제8번) 나라별로 가장 대여를 많이한 고객 TOP 5를 구하세요.

문제9번) 영화 카테고리 (Category) 별로 대여가 가장 많이 된 영화 TOP 5를 구하세요

문제10번) 매출이 가장 많은 영화 카테고리와 매출이 가장 작은 영화 카테고리를 구하세요. (first_value, last_value)
*/
