 -- 1. select with where condition:
 select * from payment where mode='Cash';
 select * from payment where amount >=30;
 select * from payment where payment_date>'2020-09-24';
 select customer_id,payment_date from payment where mode ='Netbanking';
 -- 2. find of sum amount :
 select sum(amount) from payment;
 select avg(amount) from payment;
 -- 3. find max value :
 select max(amount) from payment;
 select min(amount) from payment;
 -- 4. date in correct format:
 desc payment;
ALTER TABLE payment
MODIFY COLUMN payment_date DATE;

SELECT DATE_FORMAT(payment_date, '%d-%m-%Y') AS formatted_payment_date
FROM payment;

select * from payment;
-- join two table :

select customer.customer_id,customer.first_name,payment.amount,payment.mode,payment.payment_date from customer
inner join payment on customer.customer_id= payment.customer_id;

-- left join :

select customer.customer_id,customer.first_name,payment.amount,payment.mode,payment.payment_date from payment
left join customer on customer.customer_id= payment.customer_id;

-- right join:

select customer.customer_id,customer.first_name,payment.amount,payment.mode,payment.payment_date from customer
right join payment on customer.customer_id= payment.customer_id;

select * from customer inner join payment on customer.customer_id=payment.customer_id;

select * from payment inner join customer on customer.customer_id=payment.customer_id;

select * from customer left join payment on customer.customer_id=payment.customer_id;

select * from payment left join customer on customer.customer_id=payment.customer_id;

select * from customer right join payment on customer.customer_id=payment.customer_id;

select * from payment right join customer on customer.customer_id=payment.customer_id;

-- union :
select customer_id from customer
union
select customer_id from payment;

-- group by:

select customer_id ,sum(amount) from payment group by customer_id;

-- having :

select customer_id, sum(amount) from payment group by customer_id having sum(amount)>50; 

-- exist:

select first_name , last_name from customer 
where exists(select * from payment where customer.customer_id=payment.customer_id);
 
 -- ALL:
 select All first_name,last_name from customer;
 
  
SELECT customer_id, first_name, last_name
INTO customerBarbara
FROM customer
WHERE first_name = 'Barbara';

 -- top 10 product:
 select pr.Product, sum(s.amount) as 'Total Amount'
 from sales s 
 join products pr on pr.pid = s.pid
 group by pr.Product
 order by 'Total Amount' desc; 
