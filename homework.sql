--1. list all customers who live in TX (use joins)
select * from customer;
select * from address;
select * from city;
select * from country;

select first_name, last_name, address.district 
from customer
join address
on customer.address_id = address.address_id
where district = 'Texas';


--Answer-Jennifer	Davis	Texas
--Kim	Cruz	Texas
--Richard	Mccrary	Texas
--Bryan	Hardison	Texas
--Ian	Still	Texas




--2. Get all payments above $6.99 with the customers full name
select first_name, last_name 
from customer
where customer_id in (
	select customer_id
	from payment
	where amount > 6.99
);


select customer_id, payment_id, amount
from payment
where amount > 6.99;

select * from payment;

--  OK, took this to mean individual payments above 6.99 returned with cust name.  As I see there are 1514 of those I'm guessing we're looking for a particular customers'
select * from customer;
select * from payment;

select first_name, last_name, 




--3. show all customers' names who have made payments over $175(use subqueries)

select * from customer
where customer_id in (
	select customer_id 
	from payment 
	group by customer_id 
	having sum(amount) > 175
);

select first_name, last_name  
from customer
where customer_id in (
	select customer_id 
	from payment 
	group by customer_id 
	having sum(amount) > 175
);


--Answer- this is copy/pasted from class since it's exactly what we're trying to accomplish.  2nd one is a little more specific

--4.  List all customers that live in Nepal (use the city table)

select * from customer;
select * from address;
select * from city;
select * from country;

select first_name, last_name, country.country 
from customer
join address
on customer.address_id = address.address_id
join city
on city.city_id = address.city_id 
join country
on country.country_id = city.country_id 
where country.country = 'Nepal';

--Answer-  Kevin Schuler

--5.  Which staff member had the most transactions?

select * from staff;							-- staff_id
select * from payment;

select staff_id, sum(distinct payment_id)
from payment
group by staff_id;


--Answer      staff_id #2

--6.  How many movies of each rating are there?

select * from film;

select rating, count(film_id)
from film
group by rating;

--Answer   PG-13	223
--NC-17	210
--G	178
--PG	194
--R	195


--7.  Show all customers who have made a single payment above 6.99 (use subqueries)

select first_name, last_name
from customer
where customer_id in (
	select customer_id 
	from payment 
	group by customer_id, amount
	having amount = 6.99
);
 --Answer, once again there is something I'm misunderstanding here.  Otherwise, here's a list of 599 customers who have made payments over 6.99 or 483 who made a 6.99 payment


--8.  How many free rentals did our stores give away?

select * from payment
order by amount;

select count(amount)
from payment
where amount = 0;


--Answer - 24.
