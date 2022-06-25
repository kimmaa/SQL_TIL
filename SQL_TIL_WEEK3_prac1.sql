USE sakila;
-- 문제1번) 매출을 가장 많이 올린 dvd 고객 이름은? (subquery 활용)
SELECT c.customer_id, c.first_name, c.last_name, RANK() OVER(ORDER BY sum DESC) as Ranking, db.sum
FROM customer c, (SELECT customer_id, sum(amount) as sum
FROM payment p
group by customer_id) AS db
WHERE c.customer_id = db.customer_id
limit 1;
-- MySQL에서는 서브쿼리에 order by 사용이 불가하므로 rank() over 로 순서를 확인한다.
-- rank() over (order by 정렬할기준) 으로 하나의 컬럼을 생성할 수 있다.
-- 금액이 같은 경우일 경우 같은 순위를 가진다
-- dense_rank() 금액이 같은 경우일 경우 같은 순위를 가진다.

-- 문제2번) 대여가 한번도이라도 된 영화 카테 고리 이름을 알려주세요. (쿼리는, Exists조건을 이용하여 풀어봅시다)
SELECT c.name FROM category c
WHERE exists (
				SELECT fc.category_id FROM rental r 
				JOIN inventory i ON r.inventory_id = i.inventory_id
				JOIN film_category fc ON i.film_id = fc.film_id
				where fc.category_id = c.category_id
                ) ;
-- 문제3번) 대여가 한번도이라도 된 영화 카테 고리 이름을 알려주세요. (쿼리는, Any 조건을 이용하여 풀어봅시다)
SELECT c.name FROM category c
WHERE c.category_id = ANY (
							SELECT fc.category_id FROM rental r 
							JOIN inventory i ON r.inventory_id = i.inventory_id 
							JOIN film_category fc ON i.film_id = fc.film_id
                            ) ;
                            
-- 문제4번) 대여가 가장 많이 진행된 카테고리는 무엇인가요? (Any, All 조건 중 하나를 사용하여 풀어봅시다)
SELECT * FROM category c 
JOIN (SELECT fc.category_id, count(*) AS cnt FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film_category fc ON i.film_id = fc.film_id
GROUP BY fc.category_id) A 
ON c.category_id = A.category_id
WHERE A.cnt >= ALL(
SELECT count(*) AS cnt FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film_category fc ON i.film_id = fc.film_id
GROUP BY fc.category_id);

-- 좀더 간단하게 풀 수 있는 방법이 없을까?

-- 문제5번) dvd 대여를 제일 많이한 고객 이름은? (subquery 활용)
SELECT c.first_name , c.last_name FROM customer c
WHERE c.customer_id = (SELECT p.customer_id FROM payment p
GROUP BY p.customer_id
ORDER BY count(p.rental_id) DESC
LIMIT 1);

-- 문제6번) 영화 카테고리값이 존재하지 않는 영화가 있나요?
SELECT f.title FROM film f
WHERE NOT EXISTS (SELECT * FROM film_category fc
WHERE f.film_id = fc.film_id);

