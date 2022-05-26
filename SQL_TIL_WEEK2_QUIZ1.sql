-- 1.주문일이 2017-09-02 일에 해당 하는 주문건에 대해서,  어떤 고객이, 어떠한 상품에 대해서 얼마를 지불하여  상품을 구매했는지 확인해주세요.
select o.orderdate, o.customerid , concat(c.custfirstname, ' ',c.custlastname) custfullname, p.productname, od.quantityordered * od.quotedprice as total_prices  from orders o 
left join order_details od on o.ordernumber = od.ordernumber 
join customers c on o.customerid = c.customerid 
left join products p  on od.productnumber = p.productnumber 
where date(orderdate) = '2017-09-02';


-- 2.헬멧을 주문한 적 없는 고객을 보여주세요. 헬맷은, Products 테이블의 productname 컬럼을 이용해서 확인해주세요.
select * from customers c 
left join (
			select o.customerid from orders o 
			left join order_details od on o.ordernumber = od.ordernumber 
			left join products p  on od.productnumber = p.productnumber 
			where p.productname like '%Helmet'
			) as order_helmet
	on c.customerid = order_helmet.customerid
where order_helmet.customerid is null;

-- 3.모든 제품 과 주문 일자를 나열하세요. (주문되지 않은 제품도 포함해서 보여주세요.)

