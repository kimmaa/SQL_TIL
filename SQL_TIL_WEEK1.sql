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


