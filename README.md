# SQL_TIL
Every day SQL study 


- 1
    
    문제1번) dvd 렌탈 업체의  dvd 대여가 있었던 날짜를 확인해주세요.
    
    문제2번) 영화길이가 120분 이상이면서, 대여기간이 4일 이상이 가능한, 영화제목을 알려주세요.
    
    문제3번) 직원의 id 가 2번인  직원의  id, 이름, 성을 알려주세요
    
    문제4번) 지불 내역 중에서,   지불 내역 번호가 17510 에 해당하는  ,  고객의 지출 내역 (amount ) 는 얼마인가요?
    
    문제5번) 영화 카테고리 중에서 ,Sci-Fi  카테고리의  카테고리 번호는 몇번인가요?
    
    문제6번) film 테이블을 활용하여, rating  등급(?) 에 대해서, 몇개의 등급이 있는지 확인해보세요.
    
    문제7번) 대여 기간이 (회수 - 대여일) 10일 이상이였던 rental 테이블에 대한 모든 정보를 알려주세요.
    단 , 대여기간은  대여일자부터 대여기간으로 포함하여 계산합니다.
    
    문제8번) 고객의 id 가  50,100,150 ..등 50번의 배수에 해당하는 고객들에 대해서,
    회원 가입 감사 이벤트를 진행하려고합니다.
    고객 아이디가 50번 배수인 아이디와, 고객의 이름 (성, 이름)과 이메일에 대해서
    확인해주세요.
    
    문제9번) 영화 제목의 길이가 8글자인, 영화 제목 리스트를 나열해주세요.
    
    문제10번)	city 테이블의 city 갯수는 몇개인가요?
    
    문제11번)	영화배우의 이름 (이름+' '+성) 에 대해서,  대문자로 이름을 보여주세요.  단 고객의 이름이 동일한 사람이 있다면,  중복 제거하고, 알려주세요.
    
    문제12번)	고객 중에서,  active 상태가 0 인 즉 현재 사용하지 않고 있는 고객의 수를 알려주세요.
    
    문제13번)	Customer 테이블을 활용하여,  store_id = 1 에 매핑된  고객의 수는 몇명인지 확인해보세요.
    
    문제14번)	rental 테이블을 활용하여,  고객이 return 했던 날짜가 2005년6월20일에 해당했던 rental 의 갯수가 몇개였는지 확인해보세요.
    
    문제15번)	film 테이블을 활용하여, 2006년에 출시가 되고 rating 이 'G' 등급에 해당하며, 대여기간이 3일에 해당하는  것에 대한 film 테이블의 모든 컬럼을 알려주세요.
    
    문제16번)	langugage 테이블에 있는 id, name 컬럼을 확인해보세요 .
    
    문제17번)	film 테이블을 활용하여,  rental_duration 이  7일 이상 대여가 가능한  film 에 대해서  film_id,   title,  description 컬럼을 확인해보세요.
    
    문제18번)	film 테이블을 활용하여,  rental_duration   대여가 가능한 일자가 3일 또는 5일에 해당하는  film_id,  title, desciption 을 확인해주세요.
    
    문제19번)	Actor 테이블을 이용하여,  이름이 Nick 이거나  성이 Hunt 인  배우의  id 와  이름, 성을 확인해주세요.
    
    문제20번)	Actor 테이블을 이용하여, Actor 테이블의  first_name 컬럼과 last_name 컬럼을 , firstname, lastname 으로 컬럼명을 바꿔서 보여주세요
    
- 1 정답
    
    퀴즈 1 정답
    
    문제1번) dvd 렌탈 업체의  dvd 대여가 있었던 날짜를 확인해주세요.
    
    ```sql
    select distinct date(rental_date)
    from rental
    ```
    
    문제2번) 영화길이가 120분 이상이면서, 대여기간이 4일 이상이 가능한, 영화제목을 알려주세요.
    
    ```sql
    select title
    from film
    where length >=120
    and rental_duration>=4
    ```
    
    문제3번) 직원의 id 가 2 번인  직원의  id, 이름, 성을 알려주세요
    
    ```sql
    select staff_id , first_name , last_name
    from staff
    where staff_id =2
    ```
    
    문제4번) 지불 내역 중에서,   지불 내역 번호가 17510 에 해당하는  ,  고객의 지출 내역 (amount ) 는 얼마인가요?
    
    ```sql
    select amount
    from payment
    where payment_id = 17510
    ```
    
    문제5번) 영화 카테고리 중에서 ,Sci-Fi  카테고리의  카테고리 번호는 몇번인가요?
    
    ```sql
    select category_id
    from category
    where name ='Sci-Fi'
    ```
    
    문제6번) film 테이블을 활용하여, rating  등급(?) 에 대해서, 몇개의 등급이 있는지 확인해보세요.
    
    ```sql
    select distinct rating
    from film
    ```
    
    문제7번) 대여 기간이 (회수 - 대여일) 10일 이상이였던 rental 테이블에 대한 모든 정보를 알려주세요.
    
    단 , 대여기간은  대여일자부터 대여기간으로 포함하여 계산합니다.
    
    ```sql
    select *,  date(return_date) - date(rental_date) +1 
    					as diff_date
    where date(return_date) - date(rental_date) +1 >=10
    ```
    
    문제8번) 고객의 id 가  50,100,150 ..등 50번의 배수에 해당하는 고객들에 대해서, 회원 가입 감사 이벤트를 진행하려고합니다. 고객 아이디가 50번 배수인 아이디와, 고객의 이름 (성, 이름)과 이메일에 대해서 확인해주세요.
    
    ```sql
    select customer_id, last_name, first_name, email
    from customer
    where mod(customer_id,50) =0
    ```
    
    문제9번) 영화 제목의 길이가 8글자인, 영화 제목 리스트를 나열해주세요.
    
    ```sql
    select  length(title), title
    from film
    where length(title) =8
    order by title
    ```
    
    문제10번) city 테이블의 city 갯수는 몇개인가요?
    
    ```sql
    select count(*)
    from city
    ```
    
    문제11번) 영화배우의 이름 (이름+' '+성) 에 대해서,  대문자로 이름을 보여주세요.  단 고객의 이름이 동일한 사람이 있다면,  중복 제거하고, 알려주세요.
    
    ```sql
    select distinct upper(first_name ||' '|| last_name)
    from actor
    ```
    
    문제12번) 고객 중에서,  active 상태가 0 인 즉 현재 사용하지 않고 있는 고객의 수를 알려주세요.
    
    ```sql
    select count(distinct customer_id)
    from customer c
    where active =0
    ```
    
    문제13번) Customer 테이블을 활용하여,  store_id = 1 에 매핑된  고객의 수는 몇명인지 확인해보세요.
    
    ```sql
    select count(distinct customer_id)
    from customer c
    where store_id =1
    ```
    
    문제14번) rental 테이블을 활용하여,  고객이 return 했던 날짜가 2005년6월20일에 해당했던 rental 의 갯수가 몇개였는지 확인해보세요.
    
    ```sql
    select count(distinct rental_id)
    from rental r
    where date(return_date) ='2005-06-20'
    ```
    
    문제15번) film 테이블을 활용하여, 2006년에 출시가 되고 rating 이 'G' 등급에 해당하며, 대여기간이 3일에 해당하는  것에 대한 film 테이블의 모든 컬럼을 알려주세요.
    
    ```sql
    select *
    from film
    where release_year  ='2006'
    and rental_duration =3
    and rating ='G'
    ```
    
    문제16번) langugage 테이블에 있는 id, name 컬럼을 확인해보세요 .
    
    ```sql
    select language_id , name
    from language
    ```
    
    문제17번) film 테이블을 활용하여,  rental_duration 이  7일 이상 대여가 가능한  film 에 대해서  film_id,   title,  description 컬럼을 확인해보세요.
    
    ```sql
    select film_id ,title, description
    from film
    where rental_duration >=7
    ```
    
    문제18번) film 테이블을 활용하여,  rental_duration   대여가 가능한 일자가 3일 또는 5일에 해당하는  film_id,  title, desciption 을 확인해주세요.
    
    ```sql
    select film_id ,title, description
    from film
    where rental_duration =3 or  rental_duration =5
    ```
    
    문제19번) Actor 테이블을 이용하여,  이름이 Nick 이거나  성이 Hunt 인  배우의  id 와  이름, 성을 확인해주세요.
    
    ```sql
    select actor_id , first_name , last_name
    from actor
    where first_name  ='Nick' or last_name ='Hunt'
    ```
    
    문제20번) Actor 테이블을 이용하여, Actor 테이블의  first_name 컬럼과 last_name 컬럼을 , firstname, lastname 으로 컬럼명을 바꿔서 보여주세요
    
    ```sql
    select first_name  as firstname, 
    				last_name as lastname
    ```
    
- 2
    
    문제1번) film 테이블을 활용하여,  film 테이블의  100개의 row 만 확인해보세요.
    
    문제2번) actor 의 성(last_name) 이  Jo 로 시작하는 사람의 id 값이 가장 낮은 사람 한사람에 대하여, 사람의  id 값과  이름, 성 을 알려주세요.
    
    문제3번)film 테이블을 이용하여, film 테이블의 아이디값이 1~10 사이에 있는 모든 컬럼을 확인해주세요.
    
    문제4번) country 테이블을 이용하여, country 이름이 A 로 시작하는 country 를 확인해주세요.
    
    문제5번) country 테이블을 이용하여, country 이름이 s 로 끝나는 country 를 확인해주세요.
    
    문제6번) address 테이블을 이용하여, 우편번호(postal_code) 값이 77로 시작하는  주소에 대하여, address_id, address, district ,postal_code  컬럼을 확인해주세요.
    
    문제7번) address 테이블을 이용하여, 우편번호(postal_code) 값이  두번째글자가 1인 우편번호의  address_id, address, district ,postal_code  컬럼을 확인해주세요.
    
    문제8번) payment 테이블을 이용하여,  고객번호가 341에 해당 하는 사람이 결제를 2007년 2월 15~16일 사이에 한 모든 결제내역을 확인해주세요.
    
    문제9번) payment 테이블을 이용하여, 고객번호가 355에 해당 하는 사람의 결제 금액이 1~3원 사이에 해당하는 모든 결제 내역을 확인해주세요.
    
    문제10번) customer 테이블을 이용하여, 고객의 이름이 Maria, Lisa, Mike 에 해당하는 사람의 id, 이름, 성을 확인해주세요.
    
    문제11번) film 테이블을 이용하여,  film의 길이가  100~120 에 해당하거나 또는 rental 대여기간이 3~5일에 해당하는 film 의 모든 정보를 확인해주세요.
    
    문제12번) address 테이블을 이용하여, postal_code 값이  공백('') 이거나 35200, 17886 에 해당하는 address 에 모든 정보를 확인해주세요.
    
    문제13번) address 테이블을 이용하여,  address 의 상세주소(=address2) 값이  존재하지 않는 모든 데이터를 확인하여 주세요.
    
    문제14번) staff 테이블을 이용하여, staff 의  picture  사진의 값이 있는  직원의  id, 이름,성을 확인해주세요.  단 이름과 성을  하나의 컬럼으로 이름, 성의형태로  새로운 컬럼 name 컬럼으로 도출해주세요.
    
    문제15번) rental 테이블을 이용하여,  대여는했으나 아직 반납 기록이 없는 대여건의 모든 정보를 확인해주세요.
    
    문제16번) address 테이블을 이용하여, postal_code 값이  빈 값(NULL) 이거나 35200, 17886 에 해당하는 address 에 모든 정보를 확인해주세요.
    
    문제17번) 고객의 성에 John 이라는 단어가 들어가는, 고객의 이름과 성을 모두 찾아주세요.
    
    문제18번) 주소 테이블에서, address2 값이 null 값인 row 전체를 확인해볼까요?
    
- 2 정답
    
    문제1번) film 테이블을 활용하여,  film 테이블의  100개의 row 만 확인해보세요.
    
    ```sql
    select *
    
    from film
    
    limit 100
    ```
    
    문제2번) actor 의 성(last_name) 이  Jo 로 시작하는 사람의 id 값이 가장 낮은 사람 한사람에 대하여, 사람의  id 값과  이름, 성 을 알려주세요.
    
    ```sql
    select actor_id, first_name , last_name
    
    from actor
    
    where last_name like 'Jo%'
    
    order by actor_id
    
    limit 1
    ```
    
    문제3번)film 테이블을 이용하여, film 테이블의 아이디값이 1~10 사이에 있는 모든 컬럼을 확인해주세요.
    
    ```sql
    select *
    
    from film
    
    where film_id between 1 and 10
    ```
    
    문제4번) country 테이블을 이용하여, country 이름이 A 로 시작하는 country 를 확인해주세요.
    
    ```sql
    select *
    
    from country where country like 'A%'
    ```
    
    문제5번) country 테이블을 이용하여, country 이름이 s 로 끝나는 country 를 확인해주세요.
    
    ```sql
    select *
    from country
    where lower(country) like '%s'
    ```
    
    문제6번) address 테이블을 이용하여, 우편번호(postal_code) 값이 77로 시작하는  주소에 대하여,    address_id, address, district ,postal_code  컬럼을 확인해주세요.
    
    ```sql
    select address_id, address, district ,postal_code
    from address
    where postal_code like '77%'
    ```
    
    문제7번) address 테이블을 이용하여, 우편번호(postal_code) 값이  두번째글자가 1인 우편번호의      address_id, address, district ,postal_code  컬럼을 확인해주세요.
    
    ```sql
    select address_id, address, district ,postal_code
    
    from address
    
    where substring(postal_code,2,1) ='1'
    ```
    
    문제8번) payment 테이블을 이용하여,  고객번호가 341에 해당 하는 사람이 결제를 2007년 2월 15~16일 사이에 한 모든 결제내역을 확인해주세요.
    
    ```sql
    select *
    
    from payment
    
    where customer_id =341
    
    and payment_date between '2007-02-15 00:00:00' and '2007-02-16 23:59:59'
    ```
    
    문제9번) payment 테이블을 이용하여, 고객번호가 355에 해당 하는 사람의 결제 금액이 1~3원 사이에 해당하는 모든 결제 내역을 확인해주세요.
    
    ```sql
    select *
    
    from payment
    
    where customer_id =355
    
    and amount between 1 and 3
    ```
    
    문제10번) customer 테이블을 이용하여, 고객의 이름이 Maria, Lisa, Mike 에 해당하는 사람의 id, 이름, 성을 확인해주세요.
    
    ```sql
    select customer_id ,first_name ,last_name
    
    from customer
    
    where first_name  in ('Maria','Lisa','Mike')
    ```
    
    문제11번) film 테이블을 이용하여,  film의 길이가  100~120 에 해당하거나 또는 rental 대여기간이 3~5일에 해당하는 film 의 모든 정보를 확인해주세요.
    
    ```sql
    select*
    
    from film f
    
    where ( length between 100 and 120 )
    
    or (rental_duration between 3 and 5)
    ```
    
    문제12번) address 테이블을 이용하여, postal_code 값이  공백('') 이거나 35200, 17886 에 해당하는 address 에 모든 정보를 확인해주세요.
    
    ```sql
    SELECT *,
           CASE
             WHEN postal_code = '' THEN 'empty'
             ELSE Cast(postal_code AS VARCHAR)
           END AS postal_code_emptyflag
    FROM   address
    WHERE  postal_code IN ( '', '35200', '17886' )
    ```
    
    문제13번) address 테이블을 이용하여,  address 의 상세주소(=address2) 값이  존재하지 않는 모든 데이터를 확인하여 주세요.
    
    ```sql
    select *,  
    coalesce(address2,'empty') as new_address2
    from address
    where address2 is null
    ```
    
    문제14번) staff 테이블을 이용하여, staff 의  picture  사진의 값이 있는  직원의  id, 이름,성을 확인해주세요.  단 이름과 성을  하나의 컬럼으로 이름, 성의형태로  새로운 컬럼 name 컬럼으로 도출해주세요.
    
    ```sql
    select staff_id, first_name ||', '|| last_name  as name
    from staffs
    where picture  is not null
    ```
    
    문제15번) rental 테이블을 이용하여,  대여는했으나 아직 반납 기록이 없는 대여건의 모든 정보를 확인해주세요.\
    
    ```sql
    select *
    
    from rental
    
    where return_date  is null
    ```
    
    문제16번) address 테이블을 이용하여, postal_code 값이  빈 값(NULL) 이거나 35200, 17886 에 해당하는 address 에 모든 정보를 확인해주세요.
    
    ```sql
    select *
    from address
    where postal_code  in ('35200','17886') or postal_code is null
    ```
    
    문제17번) 고객의 성에 John 이라는 단어가 들어가는, 고객의 이름과 성을 모두 찾아주세요.
    
    ```sql
    select first_name, last_name
    from customer
    where last_name like '%John%'
    ```
    
    문제18번) 주소 테이블에서, address2 값이 null 값인 row 전체를 확인해볼까요?
    
    ```sql
    select *
    from address
    where address2 is null
    ```
    

---

### **1주차 퀴즈**

- `**또 다른 디비를 사용한 퀴즈 접속방법 및 ERD - QUIZ용**`
    
    Host 206.189.155.123
    
    Port 5433
    Database postgres
    Username camp
    Password camp
    
    ![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/f41f1a3e-9cea-44b7-83f8-31e7c17620b4/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/f41f1a3e-9cea-44b7-83f8-31e7c17620b4/Untitled.png)
    
- 1주차 퀴즈
    
    **퀴즈**
    
    문제1번)  각 제품 가격을 5 % 줄이려면 어떻게 해야 할까요?
    
    ```sql
    
    ```
    
    문제2번)  고객이 주문한 목록을 주문 일자로 내림차순 정렬해서 보여주세요.
    
    ```sql
    
    ```
    
    문제3번)  employees 테이블을 이용하여, 705 아이디를 가진 직원의 , 이름, 성과  해당 직원의  태어난 해를 확인해주세요.
    
    ```sql
    
    ```
    
    문제4번)  customers 테이블을 이용하여,  고객의 이름과 성을 하나의 컬럼으로 전체 이름을 보여주세요 (이름, 성 의 형태로  full_name 이라는 이름으로 보여주세요)
    
    ```sql
    
    ```
    
    문제5번) orders 테이블을 활용하여, 고객번호가 1001 에 해당하는 사람이 employeeid 가 707인 직원으로부터  산 주문의 id 와 주문 날짜를 알려주세요.
    * 주문일자 빠른순으로 정렬하여, 보여주세요.
    
    ```sql
    
    ```
    
    문제6번)  vendors 테이블을 이용하여, 벤더가 위치한 state 주가 어떻게 되는지, 확인해보세요.  중복된 주가 있다면, 중복제거 후에 알려주세요.
    
    ```sql
    
    ```
    
    문제7번) 주문일자가  2017-09-02~ 09-03일 사이에 해당하는 주문 번호를 알려주세요.
    
    ```sql
    
    ```
    
    문제8번) products 테이블을 활용하여, productdescription에 상품 상세 설명 값이 없는  상품 데이터를 모두 알려주세요.
    
    ```sql
    
    ```
    
    문제9 번) vendors 테이블을 이용하여, vendor의 State 지역이 NY 또는 WA 인 업체의 이름을 알려주세요.
    
    ```sql
    
    ```
    
    문제10번)  customers 테이블을 이용하여, 고객의 id 별로,  custstate 지역 중 WA 지역에 사는 사람과  WA 가 아닌 지역에 사는 사람을 구분해서  보여주세요.
    
    - customerid 와, newstate_flag 컬럼으로 구성해주세요 .
    - newstate_flag 컬럼은 WA 와 OTHERS 로 노출해주시면 됩니다.
    
    ```sql
    
    ```
    
- 1주차 퀴즈 정답
    
    문제1번)  각 제품 가격을 5 % 줄이면 어떻게 될까요?
    
    ```sql
     select productname, retailprice, retailprice *0.95
       from products
    ```
    
    문제2번)  고객이 주문한 목록을 주문 일자로 내림차순 정렬해서 보여주세요.
    
    ```sql
     select  ordernumber, orderdate, customerid
       from orders
      order by orderdate desc
    ```
    
    문제3번)  employees 테이블을 이용하여, 705 아이디를 갖은  직원의 , 이름, 성과  해당 직원의  태어난 해를 확인해주세요.
    
    ```sql
    SELECT empfirstname,
           emplastname,
           Extract (year FROM empbirthdate) AS birsthday_yyyy
    FROM   employees
    WHERE  employeeid = 705
    ```
    
    ![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/b4339021-8270-47c4-85d2-8fdd8c32c892/Untitled.png)
    
    문제4번)  customers 테이블을 이용하여,  고객의 이름과 성을 하나의 컬럼으로 전체 이름을 보여주세요 (이름, 성 의 형태로  full_name 이라는 이름으로 보여주세요)
    
    ```sql
        select first_name ||', '|| last_name  as  full_name, *
        from customer
    
    ```
    
    문제5번) orders 테이블을 활용하여, 고객번호가 1001 에 해당하는 사람이 employeeid 가 707인 직원으로부터  산 주문의 id 와 주문 날짜를 알려주세요.
    * 주문일자 빠른순으로 정렬하여, 보여주세요.
    
    ```sql
    select ordernumber, orderdate
    from orders
    where customerid =1001
    and employeeid=707
    order by ordernumber  asc
    ```
    
    문제6번)  vendors 테이블을 이용하여, 벤더가 위치한 state 주가 어떻게 되는지, 확인해보세요.  중복된 주가 있다면, 중복제거 후에 알려주세요.
    
    ```sql
    select distinct vendstate
    from vendors v
    ```
    
    문제7번) 주문일자가  2017-09-02~ 09-03일 사이에 해당하는 주문 번호를 알려주세요.
    
    ```sql
    select ordernumber
    from orders
    where orderdate  between '2017-09-02' and '2017-09-03'
    ```
    
    문제8번) products 테이블을 활용하여, productdescription에 상품 상세 설명 값이 없는  상품 데이터를 모두 알려주세요.
    
    ```sql
    select *,  coalesce(productdescription ,'Empty') as new_productdescription
    from products
    where productdescription is null
    ;
    ```
    
    문제9 번) vendors 테이블을 이용하여, vendor의 State 지역이 NY 또는 WA 인 업체의 이름을 알려주세요.
    
    ```sql
    select vendname
    from vendors
    where vendstate  in ('NY','WA')
    ```
    
    문제10번)  customers 테이블을 이용하여, 고객의 id 별로,  custstate 지역 중 WA 지역에 사는 사람과  WA 가 아닌 지역에 사는 사람을 구분해서  보여주세요.
    
    - customerid 와, newstate_flag 컬럼으로 구성해주세요 .
    - newstate_flag 컬럼은 WA 와 OTHERS 로 노출해주시면 됩니다.
    
    ```sql
    select customerid ,
    case when custstate ='WA' then 'WA' else 'OTHERS' end as newstate_flag
    from customers c
    
    -- CASE 문은 어떻게 쓰는건지 알아보세요! :)
    ```
    

### **2주차 실습문제**

---

- 3
    
    문제1번) 고객의 기본 정보인, 고객 id, 이름, 성, 이메일과 함께 고객의 주소 address, district, postal_code, phone 번호를 함께 보여주세요.
    
    문제2번) 고객의  기본 정보인, 고객 id, 이름, 성, 이메일과 함께 고객의 주소 address, district, postal_code, phone , city 를 함께 알려주세요.
    
    문제3번) Lima City에 사는 고객의 이름과, 성, 이메일, phonenumber에 대해서 알려주세요.
    
    문제4번) rental 정보에 추가로, 고객의 이름과, 직원의 이름을 함께 보여주세요.
    
    - 고객의 이름, 직원 이름은 이름과 성을 fullname 컬럼으로만들어서 직원이름/고객이름 2개의 컬럼으로 확인해주세요.
    
    문제5번) [seth.hannon@sakilacustomer.org](mailto:seth.hannon@sakilacustomer.org) 이메일 주소를 가진 고객의  주소 address, address2, postal_code, phone, city 주소를 알려주세요.
    
    문제6번) Jon Stephens 직원을 통해 dvd대여를 한 payment 기록 정보를  확인하려고 합니다.
    - payment_id,  고객 이름 과 성,  rental_id, amount, staff 이름과 성을 알려주세요.
    
    문제7번) 배우가 출연하지 않는 영화의 film_id, title, release_year, rental_rate, length 를 알려주세요.
    
    문제8번) store 상점 id별 주소 (address, address2, distict) 와 해당 상점이 위치한 city 주소를 알려주세요.
    
    문제9번) 고객의 id 별로 고객의 이름 (first_name, last_name), 이메일, 고객의 주소 (address, district), phone번호, city, country 를 알려주세요.
    
    문제10번) country 가 china 가 아닌 지역에 사는, 고객의 이름(first_name, last_name)과 , email, phonenumber, country, city 를 알려주세요
    
    문제11번) Horror 카테고리 장르에 해당하는 영화의 이름과 description 에 대해서 알려주세요
    
    문제12번) Music 장르이면서, 영화길이가 60~180분 사이에 해당하는 영화의 title, description, length 를 알려주세요.
    
    - 영화 길이가 짧은 순으로 정렬해서 알려주세요.
    
    문제13번) actor 테이블을 이용하여,  배우의 ID, 이름, 성 컬럼에 추가로    'Angels Life' 영화에 나온 영화 배우 여부를 Y , N 으로 컬럼을 추가 표기해주세요.  해당 컬럼은 angelslife_flag로 만들어주세요.
    
    문제14번) 대여일자가 2005-06-01~ 14일에 해당하는 주문 중에서 , 직원의 이름(이름 성) = 'Mike Hillyer' 이거나  고객의 이름이 (이름 성) ='Gloria Cook'  에 해당 하는 rental 의 모든 정보를 알려주세요.
    
    - 추가로 직원이름과, 고객이름에 대해서도 fullname 으로 구성해서 알려주세요.
    
    문제15번) 대여일자가 2005-06-01~ 14일에 해당하는 주문 중에서 , 직원의 이름(이름 성) = 'Mike Hillyer' 에 해당 하는 직원에게  구매하지 않은  rental 의 모든 정보를 알려주세요.
    
    - 추가로 직원이름과, 고객이름에 대해서도 fullname 으로 구성해서 알려주세요.
- 3 정답
    
    문제1번) 고객의 기본 정보인, 고객 id, 이름, 성, 이메일과 함께 고객의 주소 address, district, postal_code, phone 번호를 함께 보여주세요.
    
    ```sql
    select customer_id, first_name ,last_name, email, customer.address_id, address.district, 
    address.postal_code , address.phone
    from customer
    join address on customer.address_id = address.address_id
    ```
    
    문제2번) 고객의  기본 정보인, 고객 id, 이름, 성, 이메일과 함께 고객의 주소 address, district, postal_code, phone , city 를 함께 알려주세요. 	
    
    ```sql
    select customer_id, first_name ,last_name, email, customer.address_id, 
    address.district, address.postal_code , address.phone , city.city
    from customer
    left outer join  address on customer.address_id = address.address_id
    left outer join city on  address.city_id = city.city_id
    ```
    
    문제3번) Lima City에 사는 고객의 이름과, 성, 이메일, phonenumber에 대해서 알려주세요.
    
    ```sql
    select first_name ,last_name, email, address.phone
    from customer
    join address on customer.address_id = address.address_id
    join city on  address.city_id = city.city_id
    where city.city ='Lima'
    ```
    
    문제4번) rental 정보에 추가로, 고객의 이름과, 직원의 이름을 함께 보여주세요.
    
    - 고객의 이름, 직원 이름은 이름과 성을 fullname 컬럼으로만들어서 직원이름/고객이름 2개의 컬럼으로 확인해주세요.
    
    ```sql
    select r.*,
    c.first_name , c.last_name ,
    s.first_name , s.last_name
    from rental as r
    left outer join customer as  c on r.customer_id  =  c.customer_id
    left outer join staff s on r.staff_id  = s.staff_id
    
    ```
    
    문제5번) [seth.hannon@sakilacustomer.org](mailto:seth.hannon@sakilacustomer.org) 이메일 주소를 가진 고객의  주소 address, address2, postal_code, phone, city 주소를 알려주세요.
    
    ```sql
    select address.address,  address.address2, address.postal_code , address.phone , city.city
    from customer
    join address on customer.address_id = address.address_id
    join city on  address.city_id = city.city_id
    where customer.email ='seth.hannon@sakilacustomer.org'
    ```
    
    문제6번) Jon Stephens 직원을 통해 dvd대여를 한 payment 기록 정보를  확인하려고 합니다.
    - payment_id,  고객 이름 과 성,  rental_id, amount, staff 이름과 성을 알려주세요.
    
    ```sql
    select payment_id,
    customer.first_name, customer.last_name ,
    payment.rental_id,  payment.amount,
    
      staff.first_name, staff.last_name
    
    from payment
    join customer  on payment.customer_id = customer.customer_id
    join staff     on payment.staff_id = staff.staff_id
    where staff.first_name ='Jon'
    and staff.last_name ='Stephens'
    ```
    
    문제7번) 배우가 출연하지 않는 영화의 film_id, title, release_year, rental_rate, length 를 알려주세요.
    
    ```sql
    select film.film_id, film.title, release_year, rental_rate,length
    from film
    left outer join film_actor on film.film_id = film_actor.film_id
    left outer join actor  on film_actor.actor_id = actor.actor_id
    where actor.actor_id is null
    ```
    
    문제8번) store 상점 id별 주소 (address, address2, distict) 와 해당 상점이 위치한 city 주소를 알려주세요.
    
    ```sql
    select store.store_id, address.address, address.address2, address.district, city.city
    from store
    left outer join address on store.address_id= address.address_id
    left outer join city on address.city_id = city.city_id
    ```
    
    문제9번) 고객의 id 별로 고객의 이름 (first_name, last_name), 이메일, 고객의 주소 (address, district), phone번호, city, country 를 알려주세요.
    
    ```sql
    SELECT c.customer_id,
           c.first_name,
           c.last_name,
           c.email,
           a.address,
           a.district,
           a.phone,
           ci.city,
           co.country
    FROM   customer c
           JOIN address a
             ON c.address_id = a.address_id
           JOIN city ci
             ON a.city_id = ci.city_id
           JOIN country co
             ON ci.country_id = co.country_id;
    ```
    
    문제10번) country 가 china 가 아닌 지역에 사는, 고객의 이름(first_name, last_name)과 , email, phonenumber, country, city 를 알려주세요
    
    ```sql
    select customer.first_name, customer.last_name, customer.email,
    address.phone,
    country.country,
    city.city
    from customer
    join address on customer.address_id = address.address_id
    join city on address.city_id = city.city_id
    join country on city.country_id = country.country_id
    where country.country  not in ('China')
    ```
    
    문제11번) Horror 카테고리 장르에 해당하는 영화의 이름과 description 에 대해서 알려주세요
    
    ```sql
    SELECT title,
           description
    FROM   film f
           JOIN film_category fc
             ON f.film_id = fc.film_id
           JOIN category c
             ON fc.category_id = c.category_id
    WHERE  c.name = 'Horror';
    ```
    
    문제12번) Music 장르이면서, 영화길이가 60~180분 사이에 해당하는 영화의 title, description, length 를 알려주세요.
    
    - 영화 길이가 짧은 순으로 정렬해서 알려주세요.
    
    ```sql
    SELECT f.title,
           f.description,
           f.length
    FROM   film f
           JOIN film_category fc
             ON f.film_id = fc.film_id
           JOIN category c
             ON fc.category_id = c.category_id
    WHERE  c."name" = 'Music'
           AND f.length BETWEEN 60 AND 180
    ORDER  BY f.length;
    ```
    
    문제13번) actor 테이블을 이용하여,  배우의 ID, 이름, 성 컬럼에 추가로    'Angels Life' 영화에 나온 영화 배우 여부를 Y , N 으로 컬럼을 추가 표기해주세요.  해당 컬럼은 angelslife_flag로 만들어주세요.
    
    ```sql
    SELECT a.actor_id,
           a.first_name,
           a.last_name,
           CASE
             WHEN a.actor_id IN (SELECT actor_id
                                 FROM   film f
                                        INNER JOIN film_actor fa
                                                ON f.film_id = fa.film_id
                                 WHERE  f.title = 'Angels Life') THEN 'Y'
             ELSE 'N'
           end AS angelslife_flag
    FROM   actor a;
    ```
    
    문제14번) 대여일자가 2005-06-01~ 14일에 해당하는 주문 중에서 , 직원의 이름(이름 성) = 'Mike Hillyer' 이거나  고객의 이름이 (이름 성) ='Gloria Cook'  에 해당 하는 rental 의 모든 정보를 알려주세요.
    
    - 추가로 직원이름과, 고객이름에 대해서도 fullname 으로 구성해서 알려주세요.
    
    ```sql
    SELECT r.*,
           s.first_name|| ' '|| s.last_name AS staff_fullname,
           c.first_name|| ' '|| c.last_name AS cust_fullname
    FROM   rental r
           JOIN staff s
             ON r.staff_id = s.staff_id
           JOIN customer c
             ON r.customer_id = c.customer_id
    WHERE  Date(rental_date) BETWEEN '2005-06-01' AND '2005-06-14'
           AND ( s.first_name|| ' '|| s.last_name = 'Mike Hillyer'
                  OR c.first_name|| ' '|| c.last_name = 'Gloria Cook' );
    ```
    
    문제15번) 대여일자가 2005-06-01~ 14일에 해당하는 주문 중에서 , 직원의 이름(이름 성) = 'Mike Hillyer' 에 해당 하는 직원에게  구매하지 않은  rental 의 모든 정보를 알려주세요.
    
    - 추가로 직원이름과, 고객이름에 대해서도 fullname 으로 구성해서 알려주세요.
    
    ```sql
    SELECT r.*,
           s.first_name|| ' '|| s.last_name AS staff_fullname,
           c.first_name|| ' '|| c.last_name AS cust_fullname
    FROM   rental r
           JOIN staff s
             ON r.staff_id = s.staff_id
           JOIN customer c
             ON r.customer_id = c.customer_id
    WHERE  Date(rental_date) BETWEEN '2005-06-01' AND '2005-06-14'
           AND s.first_name|| ' '|| s.last_name != 'Mike Hillyer';
    ```
    
- 4
    
    문제1번) store 별로 staff는 몇명이 있는지 확인해주세요.
    
    문제2번) 영화등급(rating) 별로 몇개 영화film을 가지고 있는지 확인해주세요.
    
    문제3번) 출현한 영화배우(actor)가  10명 초과한 영화명은 무엇인가요?
    
    문제4번) 영화 배우(actor)들이 출연한 영화는 각각 몇 편인가요?
    
    - 영화 배우의 이름 , 성 과 함께 출연 영화 수를 알려주세요.
    
    문제5번) 국가(country)별 고객(customer) 는 몇명인가요?
    
    문제6번) 영화 재고 (inventory) 수량이 3개 이상인 영화(film) 는?
    
    - store는 상관 없이 확인해주세요.
    
    문제7번) dvd 대여를 제일 많이한 고객 이름은?
    
    문제8번) rental 테이블을  기준으로,   2005년 5월26일에 대여를 기록한 고객 중, 하루에 2번 이상 대여를 한 고객의 ID 값을 확인해주세요.
    
    문제9번) film_actor 테이블을 기준으로, 출현한 영화의 수가 많은  5명의 actor_id 와 , 출현한 영화 수 를 알려주세요.
    
    문제10번) payment 테이블을 기준으로,  결제일자가 2007년2월15일에 해당 하는 주문 중에서  ,  하루에 2건 이상 주문한 고객의  총 결제 금액이 10달러 이상인 고객에 대해서 알려주세요.
    (고객의 id,  주문건수 , 총 결제 금액까지 알려주세요)
    
    문제11번) 사용되는 언어별 영화 수는?
    
    문제12번) 40편 이상 출연한 영화 배우(actor) 는 누구인가요?
    
    문제13번) 고객 등급별 고객 수를 구하세요. (대여 금액 혹은 매출액  에 따라 고객 등급을 나누고 조건은 아래와 같습니다.)
    /*
    A 등급은 151 이상
    B 등급은 101 이상 150 이하
    C 등급은   51 이상 100 이하
    D 등급은   50 이하
    
    - 대여 금액의 소수점은 반올림 하세요.
    
    HINT
    반올림 하는 함수는 ROUND 입니다.	
    */
    
- 4 정답
    
    문제1번) store 별로 staff는 몇명이 있는지 확인해주세요.
    
    ```sql
    select store_id, count(*) cnt
    from staff
    group by store_id;
    ```
    
    문제2번) 영화등급(rating) 별로 몇개 영화film을 가지고 있는지 확인해주세요.
    
    ```sql
    select rating , count(*) cnt
    from film
    group by rating;
    ```
    
    문제3번) 출현한 영화배우(actor)가  10명 초과한 영화명은 무엇인가요?
    
    ```sql
    select f.title , fc.cnt
    from
    (
    select fa.film_id , count(*) cnt
    from film_actor fa
    group by fa.film_id
    having count(*) > 10
    ) fc
    inner join film f on f.film_id = fc.film_id
    ;
    ```
    
    문제4번) 영화 배우(actor)들이 출연한 영화는 각각 몇 편인가요?
    
    - 영화 배우의 이름 , 성 과 함께 출연 영화 수를 알려주세요.
    
    ```sql
    select a.first_name , a.last_name ,fa.cnt
    from
    (
    select fa.actor_id , count(*) cnt
    from film_actor fa
    group by fa.actor_id
    ) fa
    inner join actor a on fa.actor_id = a.actor_id
    ;
    ```
    
    문제5번) 국가(country)별 고객(customer) 는 몇명인가요?
    
    ```sql
    select cy.country , count(*) cnt
    from customer c
    inner join address a  on c.address_id = a.address_id
    inner join city    ct on ct.city_id   = a.city_id
    inner join country cy on ct.country_id = ct.country_id
    group by cy.country;
    ```
    
    문제6번) 영화 재고 (inventory) 수량이 3개 이상인 영화(film) 는?
    
    - store는 상관 없이 확인해주세요.
    
    ```sql
    select  f.title , i.cnt
    from
    ( select  film_id ,  count(*) cnt
    from inventory i
    group by  film_id
    having count(*) > 3
    ) i
    inner join film f on f.film_id = i.film_id;
    ```
    
    문제7번) dvd 대여를 제일 많이한 고객 이름은?
    
    ```sql
    select  c.first_name , c.last_name
    from  customer c inner join
    (
    select p.customer_id , count(p.rental_id) rental_cnt
    from payment p
    group by p.customer_id
    order by rental_cnt desc
    limit 1
    ) p
    on c.customer_id = p.customer_id ;
    ```
    
    문제8번) rental 테이블을  기준으로,   2005년 5월26일에 대여를 기록한 고객 중, 하루에 2번 이상 대여를 한 고객의 ID 값을 확인해주세요.
    
    ```sql
    select customer_id,  count(distinct rental_id) as cnt
    from rental
    where rental_date between '2005-05-26 00:00:00' and '2005-05-26 23:59:59'
    group by customer_id
    having  count(distinct rental_id)  >1
    ```
    
    문제9번) film_actor 테이블을 기준으로, 출현한 영화의 수가 많은  5명의 actor_id 와 , 출현한 영화 수 를 알려주세요.
    
    ```sql
    select actor_id , count(distinct film_id) as cnt
    from film_actor
    group by actor_id
    order by cnt desc
    limit 5
    ```
    
    문제10번) payment 테이블을 기준으로,  결제일자가 2007년2월15일에 해당 하는 주문 중에서  ,  하루에 2건 이상 주문한 고객의  총 결제 금액이 10달러 이상인 고객에 대해서 알려주세요.
    (고객의 id,  주문건수 , 총 결제 금액까지 알려주세요)
    
    ```sql
    select customer_id , count(distinct rental_id) as cnt, sum(amount) as sum_amount
    from payment
    where payment_date  between '2007-02-15 00:00:00' and '2007-02-15 23:59:59'
    group by customer_id
    having count(distinct rental_id) >=2 and  sum(amount) >=10
    ```
    
    문제11번) 사용되는 언어별 영화 수는?
    
    ```sql
    select [l.name](http://l.name/) , count(*) cnt
    from language l
    inner join film f on l.language_id = f.language_id
    group by [l.name](http://l.name/)
    ```
    
    문제12번) 40편 이상 출연한 영화 배우(actor) 는 누구인가요?
    
    ```sql
    select  a.first_name , a.last_name , fc.cnt
    from
    (
    select fc.actor_id, count(*) cnt
    from film_actor fc
    group by fc.actor_id
    having count(*) > 40
    ) fc
    inner join actor a on a.actor_id = fc.actor_id
    ;
    ```
    
    문제13번) 고객 등급별 고객 수를 구하세요. (대여 금액 혹은 매출액  에 따라 고객 등급을 나누고 조건은 아래와 같습니다.)
    /*
    A 등급은 151 이상
    B 등급은 101 이상 150 이하
    C 등급은   51 이상 100 이하
    D 등급은   50 이하
    
    - 대여 금액의 소수점은 반올림 하세요.
    
    HINT
    반올림 하는 함수는 ROUND 입니다.	
    */
    
    ```sql
    select case when rental_amount <= 50 then 'D'
    when rental_amount between 51  and 100 then 'C'
    when rental_amount between 101 and 150 then 'B'
    when rental_amount >= 151  then 'A' end customer_class
    , count(*) cnt
    from
    (
    select r.customer_id , round(sum(p.amount) ,0) rental_amount
    from rental r
    inner join payment p on p.rental_id = r.rental_id
    group by r.customer_id
    ) r
    group by case when rental_amount <= 50 then 'D'
    when rental_amount between 51  and 100 then 'C'
    when rental_amount between 101 and 150 then 'B'
    when rental_amount >= 151  then 'A' end
    ```
    
- 5
    
    문제1번) 영화 배우가,  영화 180분 이상의 길이 의 영화에 출연하거나, 영화의 rating 이 R 인 등급에 해당하는 영화에 출연한  영화 배우에 대해서,  영화 배우 ID 와 (180분이상 / R등급영화)에 대한 Flag 컬럼을 알려주세요.
    
    - film_actor 테이블와 film 테이블을 이용하세요.
    
    - union, unionall, intersect, except 중 상황에 맞게 사용해주세요.
    - actor_id 가 동일한 flag 값 이 여러개 나오지 않도록 해주세요.
    
    문제2번) R등급의 영화에 출연했던 배우이면서, 동시에, Alone Trip의 영화에 출연한  영화배우의 ID 를 확인해주세요.
    
    - film_actor 테이블와 film 테이블을 이용하세요.
    - union, unionall, intersect, except 중 상황에 맞게 사용해주세요.
    
    문제3번) G 등급에 해당하는 필름을 찍었으나,   영화를 20편이상 찍지 않은 영화배우의 ID 를 확인해주세요.
    
    - film_actor 테이블와 film 테이블을 이용하세요.
    - union, unionall, intersect, except 중 상황에 맞게 사용해주세요.
    
    문제4번) 필름 중에서,  필름 카테고리가 Action, Animation, Horror 에 해당하지 않는 필름 아이디를 알려주세요.
    
    - category 테이블을 이용해서 알려주세요.
    
    문제5번) Staff  의  id , 이름, 성 에 대한 데이터와 , Customer 의 id, 이름 , 성에 대한 데이터를  하나의  데이터셋의 형태로 보여주세요.
    
    - 컬럼 구성 : id, 이름 , 성, flag (직원/고객여부) 로 구성해주세요.
    
    문제6번) 직원과  고객의 이름이 동일한 사람이 혹시 있나요? 있다면, 해당 사람의 이름과 성을 알려주세요.
    
    문제7번) 반납이 되지 않은 대여점(store)별 영화 재고 (inventory)와 전체 영화 재고를 같이 구하세요. (union all)
    
    문제8번) 국가(country)별 도시(city)별 매출액, 국가(country)매출액 소계 그리고 전체 매출액을 구하세요. (union all)
    
- 5 정답
    
    문제1번) 영화 배우가,  영화 180분 이상의 길이 의 영화에 출연하거나, 영화의 rating 이 R 인 등급에 해당하는 영화에 출연한  영화 배우에 대해서,  영화 배우 ID 와 (180분이상 / R등급영화)에 대한 Flag 컬럼을 알려주세요.
    
    - film_actor 테이블와 film 테이블을 이용하세요.
    - union, unionall, intersect, except 중 상황에 맞게 사용해주세요.
    - actor_id 가 동일한 flag 값 이 여러개 나오지 않도록 해주세요.
    
    ```sql
    SELECT actor_id,
           'length_over_180' AS flag
    FROM   film_actor fa
    WHERE  film_id IN (SELECT film_id
                       FROM   film
                       WHERE  length >= 180)
    UNION
    SELECT actor_id,
           'rating_R' AS flag
    FROM   film_actor fa
    WHERE  film_id IN (SELECT film_id
                       FROM   film
                       WHERE  rating = 'R')
    ```
    
    문제2번) R등급의 영화에 출연했던 배우이면서, 동시에, Alone Trip의 영화에 출연한  영화배우의 ID 를 확인해주세요.
    
    - film_actor 테이블와 film 테이블을 이용하세요.
    - union, unionall, intersect, except 중 상황에 맞게 사용해주세요.
    
    ```sql
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
    ```
    
    문제3번) G 등급에 해당하는 필름을 찍었으나,   영화를 20편이상 찍지 않은 영화배우의 ID 를 확인해주세요.
    
    - film_actor 테이블와 film 테이블을 이용하세요.
    - union, unionall, intersect, except 중 상황에 맞게 사용해주세요.
    
    ```sql
    SELECT actor_id
    FROM   film_actor fa
    WHERE  film_id IN (SELECT film_id
                       FROM   film
                       WHERE  rating = 'G')
    EXCEPT
    
    SELECT actor_id
    FROM   film_actor fa
    GROUP  BY actor_id
    HAVING Count(DISTINCT film_id) >= 20
    ```
    
    ![g등급의 actor_id 및 film_id](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/0f57420e-3cc3-4ba2-8e07-4317443d012b/Untitled.png)
    
    g등급의 actor_id 및 film_id
    
    ![count film_id 포함 ](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/c04a8aa6-74e6-4e46-8847-39d4f2c1329d/Untitled.png)
    
    count film_id 포함 
    
    ```sql
    SELECT actor_id, Count( film_id)
    FROM film_actor
    GROUP BY actor_id
    HAVING Count( film_id) >= 20
    order by actor_id
    ```
    
    ![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/1a5f3bf5-5153-4753-87ab-d552739dd8f6/Untitled.png)
    
    ```sql
    SELECT actor_id, count(distinct film_id) as cnt
    FROM film_actor fa
    GROUP BY actor_id
    order by cnt
    ```
    
    문제4번) 필름 중에서,  필름 카테고리가 Action, Animation, Horror 에 해당하지 않는 필름 아이디를 알려주세요.
    
    - category 테이블을 이용해서 알려주세요.
    
    ```sql
    SELECT film_id
    FROM   film
    EXCEPT
    SELECT film_id
    FROM   film_category fc
    WHERE  category_id IN (SELECT category_id
                           FROM   category c
                           WHERE  NAME IN ( 'Action', 'Animation', 'Horror' ))
    ```
    
    문제5번) Staff  의  id , 이름, 성 에 대한 데이터와 , Customer 의 id, 이름 , 성에 대한 데이터를  하나의  데이터셋의 형태로 보여주세요.
    
    - 컬럼 구성 : id, 이름 , 성, flag (직원/고객여부) 로 구성해주세요.
    
    ```sql
    SELECT staff_id,
           first_name,
           last_name,
           'Staff' AS flag
    FROM   staff
    UNION ALL
    SELECT customer_id,
           first_name,
           last_name,
           'Customer' AS flag
    FROM   customer
    ```
    
    문제6번) 직원과  고객의 이름이 동일한 사람이 혹시 있나요? 있다면, 해당 사람의 이름과 성을 알려주세요.
    
    ```sql
    SELECT first_name,
           last_name
    FROM   customer
    INTERSECT
    SELECT first_name,
           last_name
    FROM   staff
    ```
    
    문제7번) 반납이 되지 않은 대여점(store)별 영화 재고 (inventory)와 전체 영화 재고를 같이 구하세요. (union all)
    
    ```sql
    SELECT null as null,
           Count(*) cnt
    FROM   rental r
           INNER JOIN inventory i
                   ON r.inventory_id = i.inventory_id
    WHERE  return_date IS NULL
    UNION ALL
    SELECT i.store_id,
           Count(*) cnt
    FROM   rental r
           INNER JOIN inventory i
                   ON r.inventory_id = i.inventory_id
    WHERE  return_date IS NULL
    GROUP  BY i.store_id
    ```
    
    문제8번) 국가(country)별 도시(city)별 매출액, 국가(country)매출액 소계 그리고 전체 매출액을 구하세요. (union all)
    
    ```sql
    SELECT cty.country,
           ct.city,
           Sum(p.amount) rental_amount
    FROM   payment p
           INNER JOIN customer c
                   ON p.customer_id = c.customer_id
           INNER JOIN address a
                   ON a.address_id = c.address_id
           INNER JOIN city ct
                   ON ct.city_id = a.city_id
           INNER JOIN country cty
                   ON cty.country_id = ct.country_id
    GROUP  BY cty.country,
              ct.city
    UNION ALL
    SELECT cty.country,
           NULL,
           Sum(p.amount) rental_amount
    FROM   payment p
           INNER JOIN customer c
                   ON p.customer_id = c.customer_id
           INNER JOIN address a
                   ON a.address_id = c.address_id
           INNER JOIN city ct
                   ON ct.city_id = a.city_id
           INNER JOIN country cty
                   ON cty.country_id = ct.country_id
    GROUP  BY cty.country
    UNION ALL
    SELECT NULL,
           NULL,
           Sum(p.amount) rental_amount
    FROM   payment p
           INNER JOIN customer c
                   ON p.customer_id = c.customer_id
           INNER JOIN address a
                   ON a.address_id = c.address_id
           INNER JOIN city ct
                   ON ct.city_id = a.city_id
           INNER JOIN country cty
                   ON cty.country_id = ct.country_id
    ORDER  BY 1,
              2;
    ```
    

---

### **2주차 퀴즈**

- 2주차 퀴즈
    
    ![기존 퀴즈 DB와 같음](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/7bf6c5b9-ed3c-4567-b6e5-e2f12f24632b/Untitled.png)
    
    기존 퀴즈 DB와 같음
    
    1.주문일이 2017-09-02 일에 해당 하는 주문건에 대해서,  어떤 고객이, 어떠한 상품에 대해서 얼마를 지불하여  상품을 구매했는지 확인해주세요.
    
    ```sql
    
    ```
    
    2.헬멧을 주문한 적 없는 고객을 보여주세요.
    
    - 헬맷은, Products 테이블의 productname 컬럼을 이용해서 확인해주세요.
    
    ```sql
    
    ```
    
    3.모든 제품 과 주문 일자를 나열하세요. (주문되지 않은 제품도 포함해서 보여주세요.)
    
    ```sql
    
    ```
    
    4.캘리포니아 주와 캘리포니아 주가 아닌 STATS 로 구분하여 각 주문량을 알려주세요. (CASE문 사용)
    
    ```sql
    
    ```
    
    5.공급 업체 와 판매 제품 수를 나열하세요. 단 판매 제품수가 2개 이상인 곳만 보여주세요.
    
    ```sql
    
    ```
    
    1. 가장 높은 주문 금액을 산 고객은 누구인가요?
    - 주문일자별, 고객의 아이디별로, 주문번호, 주문 금액도 함께 알려주세요.
    
    ```sql
    
    ```
    
    7.주문일자별로, 주문 갯수와,  고객수를 알려주세요.
    
    - ex) 하루에 한 고객이 주문을 2번이상했다고 가정했을때 -> 해당의 경우는 고객수는 1명으로 계산해야합니다.
    
    ```sql
    
    ```
    
    8번 생략
    
    9.타이어과 헬멧을 모두 산적이 있는 고객의 ID 를 알려주세요.
    
    - 타이어와 헬멧에 대해서는 , Products 테이블의 productname 컬럼을 이용해서 확인해주세요.
    
    ```sql
    
    ```
    
    1. 타이어는 샀지만, 헬멧을 사지 않은 고객의 ID 를 알려주세요. Except 조건을 사용하여, 풀이 해주세요.
    - 타이어, 헬멧에 대해서는, Products 테이블의 productname 컬럼을 이용해서 확인해주세요.
    
    ```sql
    
    ```
    
- 2주차 퀴즈 정답
    
    1.주문일이 2017-09-02 일에 해당 하는 주문건에 대해서,  어떤 고객이, 어떠한 상품에 대해서 얼마를 지불하여  상품을 구매했는지 확인해주세요.
    
    ```sql
    select o.orderdate, o.customerid, od.productnumber,
    
    od.quotedprice * od.quantityordered as prices
    
    from orders as o
    
    join order_details as od on o.ordernumber = od.ordernumber
    
    where orderdate between '2017-09-02' and '2017-09-02'
    
    order by o.orderdate, o.customerid
    ```
    
    2.헬멧을 주문한 적 없는 고객을 보여주세요.
    
    - 헬맷은, Products 테이블의 productname 컬럼을 이용해서 확인해주세요.
    
    ```sql
    select c.customerid
    
    - - , order_hm.customerid
    
    from customers as c
    
    left outer join (
    				
    				select o.ordernumber,o.customerid,  od.productnumber, p.productname
    				
    				from orders as o
    				
    				join order_details as od on o.ordernumber= od.ordernumber
    				
    				join products as p on od.productnumber = p.productnumber
    				
    				where p.productname like '%Helmet'
    
    ) as order_hm
    
    on c.customerid = order_hm.customerid
    
    where order_hm.customerid is null
    
    ----------------------------------------
    
    select *
    
    from products as p
    
    where p.productname like '%Helmet%'
    
    where p.productname like '%Tires'
    
    SELECT productnumber,productname FROM products
    
    WHERE productname LIKE '%Helmet%'
    
    - - not like 가 안되는 예시
    
    select distinct customer
    
    from (
    
    select  'tire'  as item, 'customer1' as customer   union all
    
    select  'helmet'  as item, 'customer1' as customer
    
    ) as db
    
    where  db.item not like 'helmet'
    ```
    
    3.모든 제품 과 주문 일자를 나열하세요. (주문되지 않은 제품도 포함해서 보여주세요.)
    
    ```sql
    select p.productnumber, p.productname, od.ordernumber, o.orderdate
    
    from products as p
    
    left outer join order_details as od on p.productnumber = od.productnumber
    
    left outer join orders as o   on od.ordernumber  = o.ordernumber
    ```
    
    4.캘리포니아 주와 캘리포니아 주가 아닌 STATS 로 구분하여 각 주문량을 알려주세요. (CASE문 사용)
    
    ```sql
    select db.ca_yn, count(distinct ordernumber) as cnt
    
    from (
    
    select c.customerid, c.custstate,
    
    case when c.custstate ='CA' then 'CA_Y'
    
    else 'CA_N'
    
    end as CA_YN,
    
    o.ordernumber
    
    from customers as c
    
    join orders as o on o.customerid = c.customerid
    
    left outer join order_details as od on o.ordernumber = od.ordernumber
    
    ) as db
    
    group by db.ca_yn
    ```
    
    5.공급 업체 와 판매 제품 수를 나열하세요. 단 판매 제품수가 2개 이상인 곳만 보여주세요.
    
    ```sql
    select  v.vendname, count(distinct pv.productnumber)
    from product_vendors as pv
    join vendors as v on pv.vendorid = v.vendorid
    group by v.vendname
    having count(distinct pv.productnumber) >= 2
    ```
    
    1. 가장 높은 주문 금액을 산 고객은 누구인가요?
    
    - 주문일자별, 고객의 아이디별로, 주문번호, 주문 금액도 함께 알려주세요.
    
    ```sql
    select orderdate, customerid, ordernumber,sum(prices) as order_price
    from (
    	select o.orderdate, o.customerid, o.ordernumber, od.productnumber,od.quotedprice * od.quantityordered as prices
    	from orders as o
    	join order_details as od 
    	on o.ordernumber = od.ordernumber	
    ) as db
    group by orderdate, customerid , ordernumber
    order by order_price desc
    limit 1
    ```
    
    7.주문일자별로, 주문 갯수와,  고객수를 알려주세요.
    
    - ex) 하루에 한 고객이 주문을 2번이상했다고 가정했을때 -> 해당의 경우는 고객수는 1명으로 계산해야합니다.
    
    ```sql
    select orderdate,  count(distinct ordernumber) as cnt_orders,
    
    count(distinct customerid) as cnt_customer
    
    from (
    
    select o.orderdate, o.customerid, o.ordernumber, od.productnumber,
    
    od.quotedprice * od.quantityordered as prices
    
    from orders as o
    
    join order_details as od on o.ordernumber = od.ordernumber
    
    ) as db
    
    group by orderdate
    
    order by orderdate asc
    ```
    
    8번 생략
    
    9.타이어과 헬멧을 모두 산적이 있는 고객의 ID 를 알려주세요.
    
    - 타이어와 헬멧에 대해서는 , Products 테이블의 productname 컬럼을 이용해서 확인해주세요.
    
    ```sql
    select o.customerid
    
    from orders as o
    
    join order_details as od
    
    on o.ordernumber = od.ordernumber
    
    join products as p
    
    on od.productnumber =p.productnumber
    
    where p.productname like '%Tires'
    
    intersect
    
    select o.customerid
    
    from orders as o
    
    join order_details as od
    
    on o.ordernumber = od.ordernumber
    
    join products as p
    
    on od.productnumber =p.productnumber
    
    where p.productname like '%Helmet'
    ```
    
    1. 타이어는 샀지만, 헬멧을 사지 않은 고객의 ID 를 알려주세요. Except 조건을 사용하여, 풀이 해주세요.
    - 타이어, 헬멧에 대해서는, Products 테이블의 productname 컬럼을 이용해서 확인해주세요.
    
    ```sql
    select o.customerid
    
    from salesordersexample.orders as o
    
    join salesordersexample.order_details as od
    
    on o.ordernumber = od.ordernumber
    
    join salesordersexample.products as p
    
    on od.productnumber =p.productnumber
    
    where p.productname like '%Tires'
    
    except
    
    ------------------------------
    
    select distinct  o.customerid
    
    from salesordersexample.orders as o
    
    join salesordersexample.order_details as od
    
    on o.ordernumber = od.ordernumber
    
    join salesordersexample.products as p
    
    on od.productnumber =p.productnumber
    
    where p.productname like '%Helmet'
    ```
    

---

### **3주차 실습문제**

---

- 6
    
    문제1번) 매출을 가장 많이 올린 dvd 고객 이름은? (subquery 활용)
    
    문제2번) 대여가 한번도이라도 된 영화 카테 고리 이름을 알려주세요. (쿼리는, Exists조건을 이용하여 풀어봅시다)
    
    문제3번) 대여가 한번도이라도 된 영화 카테 고리 이름을 알려주세요. (쿼리는, Any 조건을 이용하여 풀어봅시다)
    
    문제4번) 대여가 가장 많이 진행된 카테고리는 무엇인가요? (Any, All 조건 중 하나를 사용하여 풀어봅시다)
    
    문제5번) dvd 대여를 제일 많이한 고객 이름은? (subquery 활용)
    
    문제6번) 영화 카테고리값이 존재하지 않는 영화가 있나요?
    
- 6 정답
    
    문제1번) 매출을 가장 많이 올린 dvd 고객 이름은? (subquery 활용)
    
    ```sql
    select  first_name , last_name
    from customer c
    where  customer_id in (
    select customer_id
    from payment p
    group by customer_id
    order by sum(amount) desc
    limit 1
    )
    ```
    
    문제2번) 대여가 한번도이라도 된 영화 카테 고리 이름을 알려주세요. (쿼리는, Exists조건을 이용하여 풀어봅시다)
    
    ```sql
    select c.name
    from category as c
    where exists (
    	select fc.category_id
    	from rental as r
    	join inventory as i on r.inventory_id = i.inventory_id
    	join film_category as fc on i.film_id = fc.film_id
    	where fc.category_id = c.category_id
    )
    ```
    
    문제3번) 대여가 한번도이라도 된 영화 카테 고리 이름을 알려주세요. (쿼리는, Any 조건을 이용하여 풀어봅시다)
    
    ```sql
    select c.name
    
    from category as c
    
    where category_id = any (
    
    select fc.category_id
    
    from rental as r
    
    join inventory as i on r.inventory_id = i.inventory_id
    
    join film_category as fc on i.film_id = fc.film_id
    
    )
    ```
    
    문제4번) 대여가 가장 많이 진행된 카테고리는 무엇인가요? (Any, All 조건 중 하나를 사용하여 풀어봅시다)
    
    ```sql
    select c.*
    
    from category as c
    
    where category_id = any (
    
    	select fc.category_id
    	
    	-- ,  count(distinct r.rental_id) as cnt
    	
    	from rental as r
    	
    	join inventory as i on r.inventory_id = i.inventory_id
    	
    	join film_category as fc on i.film_id = fc.film_id
    	
    	group by  fc.category_id
    	
    	order by  count(distinct r.rental_id) desc
    	
    	limit 1
    
    )
    
    ;
    ```
    
    문제5번) dvd 대여를 제일 많이한 고객 이름은? (subquery 활용)
    
    ```sql
    select  c.first_name , c.last_name
    
    from  customer c
    
    where c.customer_id =
    
    (
    
    select p.customer_id
    
    from payment p
    
    group by p.customer_id
    
    order by count(p.rental_id) desc
    
    limit 1
    
    )
    
    ;
    ```
    
    문제6번) 영화 카테고리값이 존재하지 않는 영화가 있나요?
    
    ```sql
    select *
    
    from  film as f
    
    where not exists (
    
    select *
    
    from film_category as fc
    
    where  f.film_id   = fc.film_id
    
    );
    ```
    
    /* 참고사항 */
    
    - - IN, EXISTS 는 함수는 다르나 동일한 결과물을 내는 것이라고 생각해도 된다.
    - - 하지만 NOT IN, NOT EXISTS 는 NULL 에 의한 차이가 존재한다.
    
    ```sql
    select *
    
    from address a
    
    where a.address2 in ( select null )
    
    ;
    
    select *
    
    from address a
    
    where address2  not in (
    
    select ''
    
    )
    
    ;
    ```
    
    - -address2 != ''
    - 
    
    ```sql
    select *
    
    from address a
    
    where not exists  (
    
    select 1
    
    from (
    
    select '' as a
    
    ) as db
    
    where db.a = a.address2
    
    )
    
    ;
    ```
    
    in = exists
    
    not in != not exists   (전제조건은 null,  null 이 데이터셋에 들어있을때는 같지않음. 단 NULL이없으면 같다.)
    
    not in  + null   = not exists
    
- 7
    
    문제1번) 대여점(store)별 영화 재고(inventory) 수량과 전체 영화 재고 수량은? (grouping set)
    
    문제2번) 대여점(store)별 영화 재고(inventory) 수량과 전체 영화 재고 수량은? (rollup)
    
    문제3번) 국가(country)별 도시(city)별 매출액, 국가(country)매출액 소계 그리고 전체 매출액을 구하세요. (grouping set)
    
    문제4번) 국가(country)별 도시(city)별 매출액, 국가(country)매출액 소계 그리고 전체 매출액을 구하세요. (rollup)
    
    문제5번) 영화배우별로  출연한 영화 count 수 와,   모든 배우의 전체 출연 영화 수를 합산 해서 함께 보여주세요.
    
    문제6번) 국가 (Country)별, 도시(City)별  고객의 수와 ,  전체 국가별 고객의 수를 함께 보여주세요. (grouping sets)
    
    문제7번) 영화에서 사용한 언어와  영화 개봉 연도 에 대한 영화  갯수와  , 영화 개봉 연도에 대한 영화 갯수를 함께 보여주세요.
    
    문제8번) 연도별, 일별 결제  수량과,  연도별 결제 수량을 함께 보여주세요.
    
    - 결제수량은 결제 의 id 갯수 를 의미합니다.
    
    문제9번) 지점 별,  active 고객의 수와 ,   active 고객 수 를  함께 보여주세요.
    지점과, active 여부에 대해서는 customer 테이블을 이용하여 보여주세요.
    
    - grouping sets 를 이용해서 풀이해주세요.
    
    문제10번) 지점 별,  active 고객의 수와 ,   active 고객 수 를  함께 보여주세요.
    지점과, active 여부에 대해서는 customer 테이블을 이용하여 보여주세요.
    
    - roll up으로 풀이해보면서, grouping sets 과의 차이를 확인해보세요.
- 7 정답
    
    문제1번) 대여점(store)별 영화 재고(inventory) 수량과 전체 영화 재고 수량은? (grouping set)
    
    ```sql
    select  store_id ,  count(*) cnt
    
    from inventory i
    
    group by grouping sets ( (store_id) , () );
    ```
    
    문제2번) 대여점(store)별 영화 재고(inventory) 수량과 전체 영화 재고 수량은? (rollup)
    
    ```sql
    select store_id ,  count(*) cnt
    
    from inventory i
    
    group by rollup ( store_id );
    ```
    
    문제3번) 국가(country)별 도시(city)별 매출액, 국가(country)매출액 소계 그리고 전체 매출액을 구하세요. (grouping set)
    
    ```sql
    select cty.country , ct.city,  sum(p.amount) rental_amount
    
    from payment p
    
    inner join customer c on p.customer_id = c.customer_id
    
    inner join address  a on a.address_id  = c.address_id
    
    inner join city    ct on ct.city_id    = a.city_id
    
    inner join country cty on cty.country_id = ct.country_id
    
    group by grouping sets ( (cty.country , ct.city) , (cty.country) , ()  )
    
    order by cty.country ,  ct.city
    
    ;
    ```
    
    문제4번) 국가(country)별 도시(city)별 매출액, 국가(country)매출액 소계 그리고 전체 매출액을 구하세요. (rollup)
    
    ```sql
    select cty.country , ct.city,  sum(p.amount) rental_amount
    
    from payment p
    
    inner join customer c on p.customer_id = c.customer_id
    
    inner join address  a on a.address_id  = c.address_id
    
    inner join city    ct on ct.city_id    = a.city_id
    
    inner join country cty on cty.country_id = ct.country_id
    
    group by rollup ( cty.country , ct.city )
    
    order by cty.country ,  ct.city
    
    ;
    ```
    
    문제5번) 영화배우별로  출연한 영화 count 수 와,   모든 배우의 전체 출연 영화 수를 합산 해서 함께 보여주세요.
    
    ```sql
    select actor_id , count(*)
    
    from film_actor fa
    
    group by rollup(actor_id)
    
    ;
    ```
    
    문제6번) 국가 (Country)별, 도시(City)별  고객의 수와 ,  전체 국가별 고객의 수를 함께 보여주세요. (grouping sets)
    
    ```sql
    select cty.country , ct.city,  count(distinct customer_id) as cnt
    
    from  customer c
    
    inner join address  a on a.address_id  = c.address_id
    
    inner join city    ct on ct.city_id    = a.city_id
    
    inner join country cty on cty.country_id = ct.country_id
    
    group by grouping sets ( ( cty.country , ct.city ), ( cty.country ))
    
    order by cty.country ,  ct.city
    
    ;
    ```
    
    문제7번) 영화에서 사용한 언어와  영화 개봉 연도 에 대한 영화  갯수와  , 영화 개봉 연도에 대한 영화 갯수를 함께 보여주세요.
    
    ```sql
    select language_id , release_year , count(film_id)
    
    from film
    
    group by grouping sets ((language_id, release_year), (release_year))
    
    ;
    ```
    
    문제8번) 연도별, 일별 결제  수량과,  연도별 결제 수량을 함께 보여주세요.
    
    - 결제수량은  결제 의 id 갯수 를 의미합니다.
    
    ```sql
    select  substring(cast(payment_date as varchar), 1,4) as year ,
    
    substring(cast(payment_date as varchar), 1,10) as date
    
    , count(payment_id) as cnt
    
    from payment p
    
    group by grouping sets(( substring(cast(payment_date as varchar), 1,4), substring(cast(payment_date as varchar), 1,10)),
    
    substring(cast(payment_date as varchar), 1,4))
    
    ;
    ```
    
    문제9번) 지점 별,  active 고객의 수와 ,   active 고객 수 를  함께 보여주세요.
    
    지점과, active 여부에 대해서는 customer 테이블을 이용하여 보여주세요.
    
    ```sql
    -  grouping sets 를 이용해서 풀이해주세요.
    
    select  store_id , active , count(customer_id) as cnt
    
    from customer c
    
    group by  grouping sets((store_id, active),(active))
    
    ;
    ```
    
    문제10번) 지점 별,  active 고객의 수와 ,   active 고객 수 를  함께 보여주세요.지점과
    , active 여부에 대해서는 customer 테이블을 이용하여 보여주세요.
      roll up으로 풀이해보면서,  grouping sets 과의 차이를 확인해보세요.
    
    ```sql
    
    select  store_id , active , count(customer_id) as cnt
    
    from customer c
    
    group by rollup(store_id, active)
    
    ;
    ```
    
- 8
    
    문제1번) dvd 대여를 제일 많이한 고객 이름은? (analytic funtion 활용)
    
    문제2번) 매출을 가장 많이 올린 dvd 고객 이름은? (analytic funtion 활용)
    
    문제3번) dvd 대여가 가장 적은 도시는? (anlytic funtion)
    
    문제4번) 매출이 가장 안나오는 도시는? (anlytic funtion)
    
    문제5번) 월별 매출액을 구하고 이전 월보다 매출액이 줄어든 월을 구하세요. (일자는 payment_date 기준)
    
    문제6번) 도시별 dvd 대여 매출 순위를 구하세요.
    
    문제7번) 대여점별 매출 순위를 구하세요.
    
    문제8번) 나라별로 가장 대여를 많이한 고객 TOP 5를 구하세요.
    
    문제9번) 영화 카테고리 (Category) 별로 대여가 가장 많이 된 영화 TOP 5를 구하세요
    
    문제10번) 매출이 가장 많은 영화 카테고리와 매출이 가장 작은 영화 카테고리를 구하세요. (first_value, last_value)
    
- 8 정답
    
    ```sql
    문제1번) dvd 대여를 제일 많이한 고객 이름은? (analytic funtion 활용)
    
    select c.first_name , c.last_name
    from customer c
         inner join
    	(
    	select p.customer_id , count(p.rental_id) rental_cnt
    	      , row_number() over ( order by count(p.rental_id) desc) rnum
    	  from payment p
    	 group by p.customer_id
    	) p on c.customer_id = p.customer_id
    where p.rnum = 1
     ;
    
    -------------------------------------------------------------------------------------
    문제2번) 매출을 가장 많이 올린 dvd 고객 이름은? (analytic funtion 활용)
    
    select c.first_name , c.last_name
    from customer c
         inner join
    	(
    	select p.customer_id , sum(p.amount) rental_amount
    	      , row_number() over ( order by sum(p.amount) desc) rnum
    	  from payment p
    	 group by p.customer_id
    	) p on c.customer_id = p.customer_id
    where p.rnum = 1
     ;
    
    -------------------------------------------------------------------------------------
    문제3번) dvd 대여가 가장 적은 도시는? (anlytic funtion)
    
    select ct.city
      from city ct inner join
    (
    select a.city_id , count(p.rental_id) rental_cnt
           ,row_number() over ( order by count(p.rental_id) ) rnum
      from payment p
           inner join customer c on p.customer_id = c.customer_id
           inner join address  a on a.address_id  = c.address_id
     group by a.city_id
    )  p on ct.city_id = p.city_id
    where p.rnum = 1
    ;
    
    -------------------------------------------------------------------------------------
    문제4번) 매출이 가장 안나오는 도시는? (anlytic funtion)
    
    select ct.city
      from city ct inner join
    (
    select a.city_id , sum(p.amount) rental_amount
           ,row_number() over ( order by  sum(p.amount) asc ) rnum
      from payment p
           inner join customer c on p.customer_id = c.customer_id
           inner join address  a on a.address_id  = c.address_id
     group by a.city_id
    )  p on ct.city_id = p.city_id
    where p.rnum = 1
    ;
    
    -------------------------------------------------------------------------------------
    문제5번) 월별 매출액을 구하고 이전 월보다 매출액이 줄어든 월을 구하세요. (일자는 payment_date 기준)
    
    select *
    from
    (
    select extract( year from date(p.payment_date)) yr
         , extract(month from date(p.payment_date)) mon
         , sum(amount) amt
         , lag(sum(amount)) over (order by extract(month from date(p.payment_date))) pre_amt
         , sum(amount) - lag(sum(amount)) over (order by extract(month from date(p.payment_date))) gap
      from payment p
     group by extract( year from date(p.payment_date))
            , extract(month from date(p.payment_date))
    ) p
    where gap < 0
     ;
    
    -------------------------------------------------------------------------------------
    문제6번) 도시별 dvd 대여 매출 순위를 구하세요.
    
    select ct.city , sum(p.amount) rental_amount
           ,row_number() over ( order by  sum(p.amount) desc ) rnum
           ,rank()       over ( order by  sum(p.amount) desc ) rnk
           ,dense_rank() over ( order by  sum(p.amount) desc ) drnk
      from payment p
           inner join customer c on p.customer_id = c.customer_id
           inner join address  a on a.address_id  = c.address_id
           inner join city    ct on ct.city_id    = a.city_id
      group by ct.city
    ;
    
    -------------------------------------------------------------------------------------
    문제7번) 대여점별 매출 순위를 구하세요.
    
    select i.store_id , sum(p.amount) rental_amount
           ,row_number() over ( order by  sum(p.amount) desc ) rnum
           ,rank()       over ( order by  sum(p.amount) desc ) rnk
           ,dense_rank() over ( order by  sum(p.amount) desc ) drnk
      from payment p
           inner join rental r    on r.rental_id = p.rental_id
           inner join inventory i on i.inventory_id = r.inventory_id
      group by i.store_id
    ;
    
    -------------------------------------------------------------------------------------
    문제8번) 나라별로 가장 대여를 많이한 고객 TOP 5를 구하세요.
    
    select *
    from
    (
    select cty.country , c.first_name, c.last_name , d.customer_id , count(d.rental_id) rental_cnt
           ,row_number() over ( partition by cty.country order by  count(d.rental_id) desc ) rnum
           ,rank()       over ( partition by cty.country order by  count(d.rental_id) desc ) rnk
           ,dense_rank() over ( partition by cty.country order by  count(d.rental_id) desc ) drnk
      from rental  d
           inner join customer c on d.customer_id = c.customer_id
           inner join address  a on a.address_id  = c.address_id
           inner join city    ct on ct.city_id    = a.city_id
           inner join country cty on cty.country_id = ct.country_id
     group by cty.country , c.first_name, c.last_name , d.customer_id
    ) p
    where rnum <= 5
    ;
    
    -------------------------------------------------------------------------------------
    문제9번) 영화 카테고리 (Category) 별로 대여가 가장 많이 된 영화 TOP 5를 구하세요
    
    select *
    from
    (
    select c.name , f.title , count(d.rental_id) rental_cnt
           ,row_number() over ( partition by c.name order by  count(d.rental_id) desc ) rnum
           ,rank()       over ( partition by c.name order by  count(d.rental_id) desc ) rnk
           ,dense_rank() over ( partition by c.name order by  count(d.rental_id) desc ) drnk
      from rental  d
           inner join inventory i on d.inventory_id = i.inventory_id
           inner join film f      on f.film_id = i.film_id
           inner join film_category fc on fc.film_id = f.film_id
           inner join category      c  on c.category_id = fc.category_id
      group by c.name , f.title
    ) p
    where rnum <= 5
    ;
    
    -------------------------------------------------------------------------------------
    
    문제10번) 매출이 가장 많은 영화 카테고리와 매출이 가장 작은 영화 카테고리를 구하세요. (first_value, last_value)
    
    select *
    from
    (
    select c.name as category_name  , sum(p.amount) rental_aoumnt ,
              first_value( c.name ) over (order by sum(p.amount) ) min_rental_amount_catagory ,
              last_value( c.name)   over (order by sum(p.amount) range between unbounded preceding  and unbounded following ) max_rental_amount_catagory
    from rental  r
           inner join payment p on r.rental_id = p.rental_id
           inner join inventory i on i.inventory_id = r.inventory_id
           inner join film_category fc on fc.film_id = i.film_id
           inner join category      c  on c.category_id = fc.category_id
    group by c.name
    ) c
    where c.category_name in ( min_rental_amount_catagory , max_rental_amount_catagory )
    ;
    ```
    
- 9
    
    문제1번) dvd 대여를 제일 많이한 고객 이름은?   (with 문 활용)
    
    문제2번) 영화 시간 유형 (length_type)에 대한 영화 수를 구하세요.
    영화 상영 시간 유형의 정의는 다음과 같습니다.
    영화 길이 (length) 은 60분 이하 short , 61분 이상 120분 이하 middle , 121 분이상 long 으로 한다.
    
    문제3번) 약어로 표현되어 있는 영화등급(rating) 을 영문명, 한글명과 같이 표현해 주세요. (with 문 활용)
    
    G        ? General Audiences (모든 연령대 시청가능)
    PG      ? Parental Guidance Suggested. (모든 연령대 시청가능하나, 부모의 지도가 필요)
    PG-13 ? Parents Strongly Cautioned (13세 미만의 아동에게 부적절 할 수 있으며, 부모의 주의를 요함)
    R         ? Restricted. (17세 또는 그이상의 성인)
    NC-17 ? No One 17 and Under Admitted.  (17세 이하 시청 불가)
    
    문제4번) 고객 등급별 고객 수를 구하세요. (대여 횟수에 따라 고객 등급을 나누고 조건은 아래와 같습니다.)
    
    A 등급은 31회 이상
    B 등급은 21회 이상 30회 이하
    C 등급은 11회 이상 20회 이하
    D 등급은 10회 이하
    
    문제5번) 고객 이름 별로 , flag  를 붙여서 보여주세요.
    
    - 고객의 first_name 이름의 첫번째 글자가, A, B,C 에 해당 하는 사람은 각 A,B,C 로 flag 를 붙여주시고
    A,B,C 에 해당하지 않는 인원에 대해서는 Others 라는 flag 로 붙여주세요.
    
    문제6번) payment 테이블을 기준으로,  2007년 1월~ 3월 까지의 결제일에 해당하며,  staff2번 인원에게 결제를 진행한  결제건에 대해서는, Y 로
    그 외에 대해서는 N 으로 표기해주세요. with 절을 이용해주세요.
    
    문제7번) Payement 테이블을 기준으로,  결제에 대한 Quarter 분기를 함께 표기해주세요.
    with 절을 활용해서 풀이해주세요.
    1~월의 경우 Q1
    4~6월 의 경우 Q2
    7~9월의 경우 Q3
    10~12월의 경우 Q4
    
    문제8번) Rental 테이블을 기준으로,  회수일자에 대한 Quater 분기를 함께 표기해주세요.
    with 절을 활용해서 풀이해주세요.
    1~월의 경우 Q1
    4~6월 의 경우 Q2
    7~9월의 경우 Q3
    10~12월의 경우 Q4 로 함께 보여주세요.
    
    문제9번) 직원이이  월별  대여를 진행 한  대여 갯수가 어떻게 되는 지 알려주세요.
    대여 수량이   아래에 해당 하는 경우에 대해서, 각 flag 를 알려주세요 .
    
    0~ 500개 의 경우  under_500
    501~ 3000 개의 경우  under_3000
    3001 ~ 99999 개의 경우  over_3001
    
    문제10번) 직원의 현재 패스워드에 대해서, 새로이  패스워드를 지정하려고 합니다.
    직원1의 새로운 패스워드는 12345  ,  직원2의 새로운 패스워드는 54321입니다.
    해당의 경우, 직원별로 과거 패스워드와 현재 새로이 업데이트할 패스워드를
    함께 보여주세요.
    with 절을 활용하여  새로운 패스워드 정보를 저장 후 , 알려주세요.
    
- 9 정답
    
    ```sql
    문제1번) dvd 대여를 제일 많이한 고객 이름은?   (with 문 활용)
    
    with rental_customer_rank as  (
                select  r.customer_id , count(*) rental_cnt
                     from rental r
                 group by r.customer_id
    )
    select concat(c.first_name , ' ' , c.last_name) customer_name ,  r.rental_cnt
     from  customer c
               inner join
                    (
                    select r.customer_id , rental_cnt
                          ,row_number() over (order by rental_cnt desc ) rnum
                      from rental_customer_rank r
                    ) r  on c.customer_id = r.customer_id
    where r.rnum = 1
    ;
    
    문제2번) 영화 시간 유형 (length_type)에 대한 영화 수를 구하세요.
    영화 상영 시간 유형의 정의는 다음과 같습니다.
    영화 길이 (length) 은 60분 이하 short , 61분 이상 120분 이하 middle , 121 분이상 long 으로 한다.
    
    with  category_flag as (
    
    select 0 as chk1,   60  as chk2 , 'short'  as length_flag  union all
    select 61 as chk1,  120 as chk2, 'middle'  as length_flag  union all
    select 121 as chk1, 999 as chk2, 'long'  as length_flag
    
    )
    
    select f.film_id , f.length ,  cf.length_flag
    from film f
    	 left outer join category_flag as cf  on f.length  between  cf.chk1 and cf.chk2
    ;
    
    문제3번) 약어로 표현되어 있는 영화등급(rating) 을 영문명, 한글명과 같이 표현해 주세요. (with 문 활용)
    
    G        ? General Audiences (모든 연령대 시청가능)
    PG      ? Parental Guidance Suggested. (모든 연령대 시청가능하나, 부모의 지도가 필요)
    PG-13 ? Parents Strongly Cautioned (13세 미만의 아동에게 부적절 할 수 있으며, 부모의 주의를 요함)
    R         ? Restricted. (17세 또는 그이상의 성인)
    NC-17 ? No One 17 and Under Admitted.  (17세 이하 시청 불가)
    
    with tbl as (
    
    select 'G' as rating, 'General Audiences' as text  union all
    select 'PG' as rating, 'Parental Guidance Suggested' as text  union all
    select 'PG-13' as rating, 'Parents Strongly Cautioned' as text  union all
    select 'R' as rating, 'Restricted' as text  union all
    select 'NC-17' as rating, 'No One 17 and Under Admitted' as text
    )
    
    select f.film_id , f.title , f.rating , t.text
    from film as f
     left outer join tbl as t on cast(f.rating as text) = t.rating
     ;
    
    문제4번) 고객 등급별 고객 수를 구하세요. (대여 횟수에 따라 고객 등급을 나누고 조건은 아래와 같습니다.)
    
    A 등급은 31회 이상
    B 등급은 21회 이상 30회 이하
    C 등급은 11회 이상 20회 이하
    D 등급은 10회 이하
    
    with  tbl as (
    select 0  as chk1 , 10 as chk2   , 'D' as grade union all
    select 11 as chk1 , 20 as chk2   , 'C' as grade union all
    select 21 as chk1 , 30 as chk2   , 'B' as grade union all
    select 31 as chk1 , 99 as chk2   , 'A' as grade
    
    )
    
    select tbl.grade,  count(customer_id) as  cnt
    from
            (
             select customer_id , count(*) rental_cnt
               from rental r
              group by customer_id
              order by rental_cnt desc
            ) r
            left outer join tbl on r.rental_cnt between  tbl.chk1 and tbl.chk2
    group by tbl.grade
    ;
    
    문제5번) 고객 이름 별로 , flag  를 붙여서 보여주세요.
    - 고객의 first_name 이름의 첫번째 글자가, A, B,C 에 해당 하는 사람은  각 A,B,C 로 flag 를 붙여주시고
       A,B,C 에 해당하지 않는 인원에 대해서는 Others 라는 flag 로  붙여주세요.
    
    with tbl as (
    
    select  'A' as first_name  union all
    select  'B' as first_name  union all
    select  'C' as first_name
    )
    
    select c.*, coalesce(tbl.first_name ,'Others') as flag
    from customer c
    	 left outer join tbl  on substring(c.first_name,1,1) = tbl.first_name
    ;
    
    문제6번) payment 테이블을 기준으로,  2007년 1월~ 3월 까지의 결제일에 해당하며,  staff2번 인원에게 결제를 진행한  결제건에 대해서는, Y 로
    그 외에 대해서는 N 으로 표기해주세요. with 절을 이용해주세요.
    
    with  tbl as (
    
    select 2 as staff_id, cast('2007-01-01 00:00:00' as timestamp) as chk1 , cast('2007-03-31 23:59:59' as timestamp) as chk2
    )
    
    select p.*,
    		case  when tbl.staff_id is not null then 'Y'  else 'N' end flag
    from payment p
    	 left outer join tbl  on p.payment_date  between  tbl.chk1 and tbl.chk2
    	 						and p.staff_id  = tbl.staff_id
    ;
    
    문제7번) Payement 테이블을 기준으로,  결제에 대한 Quarter 분기를 함께 표기해주세요.
    with 절을 활용해서 풀이해주세요.
    1~월의 경우 Q1
    4~6월 의 경우 Q2
    7~9월의 경우 Q3
    10~12월의 경우 Q4
    
    with  tbl as (
    
    select cast('2007-01-01 00:00:00' as timestamp) as chk1 , cast('2007-03-31 23:59:59' as timestamp) as chk2 , 'Q1' as quarter union all
    select cast('2007-04-01 00:00:00' as timestamp) as chk1 , cast('2007-06-30 23:59:59' as timestamp) as chk2 , 'Q2' as quarter union all
    select cast('2007-07-01 00:00:00' as timestamp) as chk1 , cast('2007-09-30 23:59:59' as timestamp) as chk2 , 'Q3' as quarter union all
    select cast('2007-10-01 00:00:00' as timestamp) as chk1 , cast('2007-12-31 23:59:59' as timestamp) as chk2 , 'Q4' as quarter
    )
    
    select p.*,
    		tbl.quarter
    from payment p
    	 left outer join tbl  on p.payment_date  between  tbl.chk1 and tbl.chk2
    ;
    
    문제8번) Rental 테이블을 기준으로,  회수일자에 대한 Quater 분기를 함께 표기해주세요.
    with 절을 활용해서 풀이해주세요.
    1~월의 경우 Q1
    4~6월 의 경우 Q2
    7~9월의 경우 Q3
    10~12월의 경우 Q4 로 함께 보여주세요.
    
    with  tbl as (
    
    select cast('2007-01-01 00:00:00' as timestamp) as chk1 , cast('2007-03-31 23:59:59' as timestamp) as chk2 , 'Q1' as quarter union all
    select cast('2007-04-01 00:00:00' as timestamp) as chk1 , cast('2007-06-30 23:59:59' as timestamp) as chk2 , 'Q2' as quarter union all
    select cast('2007-07-01 00:00:00' as timestamp) as chk1 , cast('2007-09-30 23:59:59' as timestamp) as chk2 , 'Q3' as quarter union all
    select cast('2007-10-01 00:00:00' as timestamp) as chk1 , cast('2007-12-31 23:59:59' as timestamp) as chk2 , 'Q4' as quarter
    )
    
    select r.*,  tbl.quarter
    from rental r
             left outer join tbl  on r.return_date  between  tbl.chk1 and tbl.chk2
    ;
    
    문제9번) 직원이이  월별  대여를 진행 한  대여 갯수가 어떻게 되는 지 알려주세요.
    대여 수량이   아래에 해당 하는 경우에 대해서, 각 flag 를 알려주세요 .
    
    0~ 500개 의 경우  under_500
    501~ 3000 개의 경우  under_3000
    3001 ~ 99999 개의 경우  over_3001
    
    with tbl as (
    
    select   0 as chk1,  500 as chk2  , 'under_500' as flag union all
    select   501 as chk1,  3000 as chk2  , 'under_3000' as flag union all
    select   3001 as chk1,  99999 as chk2  , 'over_3001' as flag
    )
    
    select db.*, tbl.flag
    from (
                            select substring(cast(rental_date as varchar),1,7) as rental_mon,
                                            staff_id , count(rental_id) as cnt
                            from rental r
                            group by  substring(cast(rental_date as varchar),1,7),
                                            staff_id
            ) as db
            left outer join tbl  on db.cnt between tbl.chk1 and tbl.chk2
    ;
    
    문제10번) 직원의 현재 패스워드에 대해서, 새로이  패스워드를 지정하려고 합니다.
    직원1의 새로운 패스워드는 12345  ,  직원2의 새로운 패스워드는 54321입니다.
    해당의 경우, 직원별로 과거 패스워드와 현재 새로이 업데이트할 패스워드를
    함께 보여주세요.
    with 절을 활용하여  새로운 패스워드 정보를 저장 후 , 알려주세요.
    
    with new_password as (
    
    select 1 as staff_id  , '12345' as new_pwd union all
    select 2 as staff_id  , '54321' as new_pwd
    
    )
    
    select s.staff_id , s.password ,    np.new_pwd
    from staff s
             join  new_password as np on s.staff_id  = np.staff_id
    ;
    ```
    

---

### 3주차 퀴즈

- 3주차 퀴즈
    
    ```sql
    문제1번) 4개이상의 업체에서 판매하는 상품번호가 무엇인지 알려주세요.
    
    문제2번) 주문일자별, 고객의 아이디별로, 주문번호에 해당하는 주문 금액은 얼마인가요?
    
    문제3번) 고객의 이름과, 직원의 정보를 하나의 이름 정보로 보여주세요.
    - 단 이름과 타입으로 컬럼을 구성하여 타입은 고객/직원의 타입에 따라 각각 customer, staff으로 값을 넣어주세요.
    
    문제4번) 1번 주문 번호에 대해서, 상품명, 주문 금액과 1번 주문 금액에 대한 총 구매금액을 함께 보여주세요.
    
    문제5번) 헬멧을 주문한 모든 고객과 자전거를 주문한 모든 고객을 나열하세요. (Union 활용) 헬멧과 자전거는 Products 테이블의 productname 컬럼을 이용해서 확인해주세요.
    
    문제6번) 고객이 구매 제품의 가격이, 평균 제품 소매 가격보다 높은 제품의 이름과 번호를 알려주세요.
    
    문제7번) 주문일자가 2017/09/01 ~ 2017/09/30 일에 해당하는 주문에 대해서
    주문일자와 고객별로 주문 수를 확인해주세요.
    또한 고객별 주문 수도 함께 알려주세요.
    
    문제8번) 주문일자가 2017/09/01 ~ 2017/09/30일에 해당하는 주문에 대해서,
    주문일자와 고객별로 주문 수를 확인해주세요.
    또한 주문일자별 주문 수도 함께 알려주시고, 전체 주문 수도 함께 알려주세요.
    
    문제9번) 2017년도의 주문일 별 주문 금액과, 월별 주문 총 금액을 함께 보여주세요.
    동시에 일별 주문 금액이 월별 주문 금액에 해당하는 비율을 같이 보여주세요. (analytic function 활용)
    
    문제10번) 주문을 많이 한 고객 순서 대로 순위를 매겨 나열하세요. (analytic function 활용)
    - 같은 주문 수치 일 때, 같은 등수로 보여주세요.
    
    ```
    
- 3주차 퀴즈 정답
    
    ```sql
    문제1번) 4개이상의 업체에서 판매하는 상품번호가 무엇인지 알려주세요.
    
    select productnumber , count(distinct vendorid) as cnt_vendor
    from product_vendors pv 
    group by productnumber 
    having count(distinct vendorid) >3
    
    문제2번) 주문일자별, 고객의 아이디별로, 주문번호에 해당하는 주문 금액은 얼마인가요?
    
    select orderdate, customerid, ordernumber,sum(prices) as order_price
    from (
            select o.orderdate, o.customerid, o.ordernumber, od.productnumber,
                            od.quotedprice * od.quantityordered as prices
            from orders as o
                 join order_details as od on o.ordernumber = od.ordernumber
    ) as db  
    group by orderdate, customerid , ordernumber
    
    문제3번) 고객의 이름과, 직원의 정보를 하나의 이름 정보로 보여주세요. 
    - 단 이름과 타입으로 컬럼을 구성하여 타입은 고객/직원의 타입에 따라 각각 customer, staff으로 값을 넣어주세요.
    
    select custfirstname ||', '|| custlastname  as  customer , 'Customer' as type
    from customers 
    union all -- (또는  union )
    select  empfirstname ||', '|| emplastname  as  staff , 'Staff' as type 
    from employees e 
    
    문제4번) 1번 주문 번호에 대해서, 상품명, 주문 금액과 1번 주문 금액에 대한 총 구매금액을 함께 보여주세요. 
    
    select ordernumber , customerid , null as productnumber , sum(prices) as price 
    from (
            select o.orderdate, o.customerid, o.ordernumber, od.productnumber,
                            od.quotedprice * od.quantityordered as prices
            from orders as o
                 join order_details as od on o.ordernumber = od.ordernumber
            where o.ordernumber =1 
    ) as db 
    group by ordernumber , customerid , ordernumber
    
    union all 
    
    select  ordernumber , customerid  , productnumber ,prices 
    from (
            select o.orderdate, o.customerid, o.ordernumber, od.productnumber,
                            od.quotedprice * od.quantityordered as prices
            from orders as o
                 join order_details as od on o.ordernumber = od.ordernumber
            where o.ordernumber =1 
    ) as db 
    
    문제5번) 헬멧을 주문한 모든 고객과 자전거를 주문한 모든 고객을 나열하세요. (Union 활용) 헬멧과 자전거는 Products 테이블의 productname 컬럼을 이용해서 확인해주세요.
    
    select o.customerid
            from orders as o 
                 join order_details as od
     on o.ordernumber = od.ordernumber
                 join products as p 
    on od.productnumber =p.productnumber
            where p.productname like '%Bike'
    union 
    select o.customerid
            from orders as o 
                 join order_details as od 
    on o.ordernumber = od.ordernumber
                 join products as p 
    on od.productnumber =p.productnumber
            where p.productname like '%Helmet'
    
    --27개 ROW         
            
            
            
            
            
            
            
            
            
            
            
    문제6번) 고객이 구매 제품의 가격이, 평균 제품 소매 가격보다 높은 제품의 이름과 번호를 알려주세요.
    
    select distinct od.productnumber, p.productname , od.quotedprice
    from order_details as od 
          join products as p on od.productnumber = p.productnumber
    where od.quotedprice >= (select avg(p.retailprice) as avg_p
                                    from products  as p )
                                    
                         
     1,2,6,11                         
                                      
                                
     
     select productnumber ,retailprice,  avg(retailprice) 
     from products p 
     group by productnumber ,retailprice
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
    
    문제7번) 주문일자가 2017/09/01 ~ 2017/09/30 일에 해당하는 주문에 대해서
    주문일자와 고객별로 주문 수를 확인해주세요. 
    또한 고객별 주문 수도 함께 알려주세요.
    
    select orderdate , customerid , count(distinct ordernumber) as cnt 
    from orders o 
    where orderdate  between '2017-09-01' and '2017-09-30'
    group by grouping sets ((orderdate,customerid), (customerid))
    
    --168개 
    
    문제8번) 주문일자가 2017/09/01 ~ 2017/09/30일에 해당하는 주문에 대해서, 
    주문일자와 고객별로 주문 수를 확인해주세요. 
    또한 주문일자별 주문 수도 함께 알려주시고, 전체 주문 수도 함께 알려주세요.
    
    select orderdate , customerid , count(distinct ordernumber) as cnt 
    from orders o 
    where orderdate  between '2017-09-01' and '2017-09-30'
    group by rollup (orderdate,customerid)
    
    --172개 
    
    문제9번) 2017년도의 주문일 별 주문 금액과, 월별 주문 총 금액을 함께 보여주세요. 
    동시에 일별 주문 금액이 월별 주문 금액에 해당하는 비율을 같이 보여주세요. (analytic function 활용)
    
    select orderdate, 
               sum(product_price) over (partition by orderdate ) as day_price ,
               sum(product_price) over (partition by mm ) as monthly_price,
               sum(product_price) over (partition by orderdate )  / 
               sum(product_price) over (partition by mm )  as perc
    from (
           select mm , orderdate , sum(product_price) product_price
           from 
                   (
                            select o.ordernumber, orderdate, EXTRACT(month from o.orderdate) as mm, 
                                       od.productnumber, od.quotedprice * od.quantityordered as product_price
                            from orders as o 
                                 join order_details as od  on o.ordernumber= od.ordernumber 
                            where o.orderdate between '2017-01-01' and '2017-12-31'
                       ) dt  
                    group by mm , orderdate
    ) as dt 
    
    --120
    
    문제10번) 주문을 많이 한 고객 순서 대로 순위를 매겨 나열하세요. (analytic function 활용) 
    - 같은 주문 수치 일 때, 같은 등수로 보여주세요.
    
    select  c.custfirstname || c.custlastname as cust_name  , o.customerid , order_cnt , 
                    DENSE_RANK() over(order by order_cnt  desc) drnk ,
                    rank () over(order by order_cnt  desc) rnk ,
                    row_number () over(order by order_cnt  desc) rnum 
    from 
    (
      select o.customerid  , count(*) order_cnt 
        from orders as o 
       group by o.customerid 
    ) o inner join customers as c on c.customerid = o.customerid
    ```
    

---

### 추가문제

1. [해커랭크](https://www.hackerrank.com/domains/sql)  → 쭉 풀어보시면 됩니다 !
    
    [Hacker Rank 정답](https://www.notion.so/Hacker-Rank-2c41d6b89feb4fde98b3a113c5582fa6)
    
2. [Datacamp](https://app.datacamp.com/learn) - 유료,,,, 
3. [leetcode](https://leetcode.com/problemset/database/) - 유료, 무료
4. [stratascratch에서 제공하는 freemium SQL 인터뷰 문제 25개를 풀고 답을 정리](https://www.qu3vipon.com/stratascratch-sql-interviews) - 무료

---

---

- 쿼리문 (이쁘게) 정렬 해주는 사이트
    
    - Format SQL click
    
    [https://www.dpriver.com/pp/sqlformat.htm](https://www.dpriver.com/pp/sqlformat.htm)
    

#
