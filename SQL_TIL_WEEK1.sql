USE SAKILA;
#문제1번) dvd 렌탈 업체의  dvd 대여가 있었던 날짜를 확인해주세요.
SELECT DISTINCT rental_date FROM rental;

#문제2번) 영화길이가 120분 이상이면서, 대여기간이 4일 이상이 가능한, 영화제목을 알려주세요.
SELECT title FROM film
WHERE length >=120 AND rental_duration >=4;

#문제3번) 직원의 id 가 2번인  직원의  id, 이름, 성을 알려주세요
SELECT staff_id, first_name, last_name FROM STAFF
WHERE staff_id = 2;

#문제4번) 지불 내역 중에서,   지불 내역 번호가 17510 에 해당하는  ,  고객의 지출 내역 (amount ) 는 얼마인가요?
SELECT payment_id, amount FROM payment
WHERE payment_id = 17510;
# DB에서 payment_id 가 17510 인 사항이 null값으로 나옴, 확인을 위해서 payment_id도 같이 출력한 구문임

#문제5번) 영화 카테고리 중에서 ,Sci-Fi  카테고리의  카테고리 번호는 몇번인가요?
SELECT category_id FROM category
WHERE name = 'Sci-Fi' ;

#문제6번) film 테이블을 활용하여, rating  등급(?) 에 대해서, 몇개의 등급이 있는지 확인해보세요.
SELECT distinct rating FROM film;

# 문제7번) 대여 기간이 (회수 - 대여일) 10일 이상이였던 rental 테이블에 대한 모든 정보를 알려주세요. 단 , 대여기간은  대여일자부터 대여기간으로 포함하여 계산합니다.
SELECT *, date(return_date) - date(rental_date)+1 as rental_dur FROM rental
WHERE date(return_date) - date(rental_date)+1 >= 10; 

/* 문제8번) 고객의 id 가  50,100,150 ..등 50번의 배수에 해당하는 고객들에 대해서, 회원 가입 감사 이벤트를 진행하려고합니다. 
고객 아이디가 50번 배수인 아이디와, 고객의 이름 (성, 이름)과 이메일에 대해서 확인해주세요. */
SELECT customer_id, first_name, last_name, email FROM customer
WHERE customer_id % 50 = 0;
-- 다른 풀이로 mod() 기능 사용이 가능 The MOD() function returns the remainder of a number divided by another number.

#문제9번) 영화 제목의 길이가 8글자인, 영화 제목 리스트를 나열해주세요.
SELECT title FROM film
WHERE length(title) = 8 ;

# 문제10번) city 테이블의 city 갯수는 몇개인가요?
SELECT count(*) FROM city;

# 문제11번) 영화배우의 이름 (이름+' '+성) 에 대해서,  대문자로 이름을 보여주세요.  단 고객의 이름이 동일한 사람이 있다면,  중복 제거하고, 알려주세요.
SELECT distinct UPPER(CONCAT(first_name,' ', last_name)) as  actor_name FROM actor;

# 문제12번) 고객 중에서,  active 상태가 0 인 즉 현재 사용하지 않고 있는 고객의 수를 알려주세요.
SELECT count(distinct customer_id) FROM CUSTOMER;

# 문제13번) Customer 테이블을 활용하여,  store_id = 1 에 매핑된  고객의 수는 몇명인지 확인해보세요.
SELECT count(distinct customer_id) FROM CUSTOMER
WHERE store_id=1;

# 문제14번) rental 테이블을 활용하여,  고객이 return 했던 날짜가 2005년6월20일에 해당했던 rental 의 갯수가 몇개였는지 확인해보세요.
SELECT count(rental_id) FROM rental;

# 문제15번)	film 테이블을 활용하여, 2006년에 출시가 되고 rating 이 'G' 등급에 해당하며, 대여기간이 3일에 해당하는  것에 대한 film 테이블의 모든 컬럼을 알려주세요.
SELECT * FROM film
WHERE rental_duration = 3 AND rating = 'G' AND release_year = 2006;

# 문제16번) langugage 테이블에 있는 id, name 컬럼을 확인해보세요 .
SELECT language_id, name FROM language;

# 문제17번) film 테이블을 활용하여,  rental_duration 이  7일 이상 대여가 가능한  film 에 대해서  film_id,   title,  description 컬럼을 확인해보세요.
SELECT film_id, title, description FROM film
WHERE rental_duration >=7;

# 문제18번) film 테이블을 활용하여, rental_duration 대여가 가능한 일자가 3일 또는 5일에 해당하는 film_id, title, desciption 을 확인해주세요.
SELECT * FROM film
WHERE rental_duration =3 OR rental_duration =5;
-- WHERE 절에서 OR 대신 AND 를 사용할 경우 오류 발생. 연산자를 >=3, <=5, AND 를 사용하게 되면 3일 4일 5일의 결과물이 도출됨

# 문제19번) Actor 테이블을 이용하여,  이름이 Nick 이거나  성이 Hunt 인  배우의  id 와  이름, 성을 확인해주세요.
SELECT actor_id, first_name, last_name FROM actor
WHERE first_name = 'Nick' OR last_name = 'Hunt';

#문제20번) Actor 테이블을 이용하여, Actor 테이블의 first_name 컬럼과 last_name 컬럼을, firstname, lastname 으로 컬럼명을 바꿔서 보여주세요
SELECT first_name as firstname, last_name as lastname FROM actor




