USE sakila;

-- 문제1번) 고객의 기본 정보인, 고객 id, 이름, 성, 이메일과 함께 고객의 주소 address, district, postal_code, phone 번호를 함께 보여주세요.
SELECT customer_id, first_name, last_name, email, address, district, postal_code, phone FROM customer
JOIN address on customer.address_id = address.address_id;

-- 문제2번) 고객의  기본 정보인, 고객 id, 이름, 성, 이메일과 함께 고객의 주소 address, district, postal_code, phone , city 를 함께 알려주세요.
SELECT customer_id, first_name, last_name, email, address, district, postal_code, phone , city FROM customer
LEFT JOIN address on customer.address_id = address.address_id
LEFT JOIN city on address.city_id = city.city_id;

-- 문제3번) Lima City에 사는 고객의 이름과, 성, 이메일, phonenumber에 대해서 알려주세요.
SELECT first_name, last_name, email, phone FROM customer
LEFT JOIN address on customer.address_id = address.address_id
LEFT JOIN city on address.city_id = city.city_id
WHERE city = 'Lima';

-- 문제4번) rental 정보에 추가로, 고객의 이름과, 직원의 이름을 함께 보여주세요.
	-- * 고객의 이름, 직원 이름은 이름과 성을 fullname 컬럼으로만들어서 직원이름/고객이름 2개의 컬럼으로 확인해주세요.
SELECT r.*,
concat(c.first_name, ' ' ,c.last_name) AS customer_fullname,
concat(s.first_name, ' ' , s.last_name) AS  staff_fullname
FROM rental r
LEFT JOIN customer c ON r.customer_id  =  c.customer_id
LEFT JOIN staff s ON r.staff_id  = s.staff_id;

-- 문제5번) [seth.hannon@sakilacustomer.org] 이메일 주소를 가진 고객의  주소 address, address2, postal_code, phone, city 주소를 알려주세요.
SELECT a.address,  a.address2, a.postal_code , a.phone , city.city
FROM customer c
LEFT JOIN address a ON c.address_id = a.address_id
LEFT JOIN city ON a.city_id = city.city_id
WHERE email ='seth.hannon@sakilacustomer.org';

-- 문제6번) Jon Stephens 직원을 통해 dvd대여를 한 payment 기록 정보를  확인하려고 합니다.
	-- - payment_id,  고객 이름 과 성,  rental_id, amount, staff 이름과 성을 알려주세요.
SELECT p.payment_id, 
c.first_name, c.last_name, 
p.rental_id, p.amount, 
s.first_name, s.last_name
FROM payment p
JOIN staff s ON p.staff_id = s.staff_id
JOIN customer c ON p.customer_id = c.customer_id
WHERE s.first_name = 'Jon' AND s.last_name = 'Stephens';

-- 문제7번) 배우가 출연하지 않는 영화의 film_id, title, release_year, rental_rate, length 를 알려주세요.
SELECT f.film_id, f.title, f.release_year, f.rental_rate, f.length FROM film f
JOIN film_actor fa ON f.film_id = fa.film_id
JOIN actor a ON fa.actor_id = a.actor_id
WHERE a.actor_id IS NULL;

-- 문제8번) store 상점 id별 주소 (address, address2, distict) 와 해당 상점이 위치한 city 주소를 알려주세요.
SELECT s.store_id, a.address, a.address2, a.district, c.city FROM store s
JOIN address a ON s.address_id = a.address_id
JOIN city c  ON a.city_id = c.city_id;

-- 문제9번) 고객의 id 별로 고객의 이름 (first_name, last_name), 이메일, 고객의 주소 (address, district), phone번호, city, country 를 알려주세요.
SELECT c.customer_id, concat(c.first_name,' ', c.last_name) as customer_name, c.email, concat(a.address, ', ', a.district) as customer_address, a.phone, ct.city, cr.country FROM customer c
JOIN address a on c.address_id = a.address_id
JOIN city ct on a.city_id = ct.city_id
JOIN country cr on ct.country_id = cr.country_id;

-- 문제10번) country 가 china 가 아닌 지역에 사는, 고객의 이름(first_name, last_name)과 , email, phonenumber, country, city 를 알려주세요
SELECT concat(c.first_name,' ', c.last_name) as customer_name, c.email, a.phone, cr.country, ct.city FROM customer c
JOIN address a on c.address_id = a.address_id
JOIN city ct on a.city_id = ct.city_id
JOIN country cr on ct.country_id = cr.country_id
WHERE cr.country NOT IN ('China');

-- 문제11번) Horror 카테고리 장르에 해당하는 영화의 이름과 description 에 대해서 알려주세요
SELECT f.title, f.description FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = fc.category_id
WHERE c.name in ('Horror');

-- 문제12번) Music 장르이면서, 영화길이가 60~180분 사이에 해당하는 영화의 title, description, length 를 알려주세요.
-- 	 - 영화 길이가 짧은 순으로 정렬해서 알려주세요.
SELECT f.title, f.description, f.length FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = fc.category_id
WHERE c.name in ('Music') AND f.length BETWEEN 60 AND 180
ORDER BY f.length ASC;

-- 문제13번) actor 테이블을 이용하여,  배우의 ID, 이름, 성 컬럼에 추가로    'Angels Life' 영화에 나온 영화 배우 여부를 Y , N 으로 컬럼을 추가 표기해주세요. 해당 컬럼은 angelslife_flag로 만들어주세요.
SELECT a.actor_id, a.first_name, a.last_name, 
CASE WHEN a.actor_id 
IN (SELECT fa.actor_id FROM film f 
JOIN film_actor fa ON f.film_id = fa.film_id 
WHERE f.title = 'ANgels Life') 
THEN 'Y' ELSE 'N' END 'angelslife_flag' 
From actor a;

-- 문제14번) 대여일자가 2005-06-01~ 14일에 해당하는 주문 중에서 , 직원의 이름(이름 성) = 'Mike Hillyer' 이거나  고객의 이름이 (이름 성) ='Gloria Cook'  에 해당 하는 rental 의 모든 정보를 알려주세요.
-- - 추가로 직원이름과, 고객이름에 대해서도 fullname 으로 구성해서 알려주세요.
SELECT r.*, concat(s.first_name,' ',s.last_name)AS staff_fullname, concat(c.first_name, ' ',c.last_name) AS customer_fullname 
FROM rental r
JOIN customer c ON r.customer_id = c.customer_id
JOIN staff s ON r.staff_id = s.staff_id
WHERE DATE(rental_date) BETWEEN '2005-06-01' AND '2005-06-14'
AND ( s.first_name|| ' '|| s.last_name = 'Mike Hillyer'
              OR c.first_name|| ' '|| c.last_name = 'Gloria Cook' );

-- 문제15번) 대여일자가 2005-06-01~ 14일에 해당하는 주문 중에서 , 직원의 이름(이름 성) = 'Mike Hillyer' 에 해당 하는 직원에게  구매하지 않은  rental 의 모든 정보를 알려주세요.
-- - 추가로 직원이름과, 고객이름에 대해서도 fullname 으로 구성해서 알려주세요.
SELECT r.*, concat(s.first_name,' ',s.last_name)AS staff_fullname, concat(c.first_name, ' ',c.last_name) AS customer_fullname 
FROM rental r
JOIN customer c ON r.customer_id = c.customer_id
JOIN staff s ON r.staff_id = s.staff_id
WHERE (DATE(rental_date) BETWEEN '2005-06-01' AND '2005-06-14') AND concat(s.first_name,' ',s.last_name) NOT IN ('Mike Hillyer');
