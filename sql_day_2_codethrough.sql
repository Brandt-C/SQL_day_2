--joins, multijoins, and subqueries

--inner join on the actor and film_actor tables 

select actor.actor_id, first_name, last_name, film_id
from actor
join film_actor
on actor.actor_id = film_actor.actor_id ;

select * from film;

--Inner join film table and film_actor table 
select film.film_id, title, description, rating, actor_id 
from film_actor
join film 
on film.film_id = film_actor.film_id;

select * from film;

select * from film_actor; 

-- we now have two separate joins above.  Both are involving film_actor table and share columns  
-- because all 3 are related (involved in the many to many relationship b/w films and actors)
-- so we can perform a multijoin to have information from both tables in our resulting jioned tables 

select actor.actor_id, first_name, last_name , film.film_id , title, description , rating 
from actor
join film_actor
on actor.actor_id = film_actor.actor_id 
join film
on film.film_id = film_actor.film_id ;


--trying to find fname, lname, and email of customers living in Angola.


select first_name , last_name , email


select * from customer;         -- customer has address_id fkey


select * from address;			--address has city_id fkey 

select * from city;				-- has a country_id fkey 

select * from country;

--so. . . .  we need to do a multi-join until we can access the data we're looking for.


select customer_id, first_name , last_name , email, address.address, address.district, city.city, country.country 
from customer
join address
on customer.address_id = address.address_id
join city
on city.city_id = address.city_id
join country
on country.country_id = city.country_id 
where country.country = 'Angola';


-- subquery

--we can make the condition of a where clause an entire separate query
--this let's us filter a table by another table or by results of an aggregate while still selecting just normal columns


--looking for customer info- (fname, lname, etc.)
--for customers who spent more than $175
-- we'rea sking for info from customer table 
	--only if it meets criteria from payment table 
--this can be done with a join 
		--payment table sum(amount) group by cus_id then join customer table on that cus_id 
--it could be done with 2 separate queries
select * from customer;


select customer_id, sum(amount) 
from payment 
group by customer_id 
having sum(amount) > 175
order by sum(amount) desc;

--or it can be done using one query as a subquery

select * from customer
where customer_id in (
	select customer_id 
	from payment 
	group by customer_id 
	having sum(amount) > 175
);


--key diff b/w a join and subquery
	--the join's result will have only data from both tables 
	--the subquery result will only have data from the outer query's table

--random specific:
	--a subquery can only select a single column which is specified right before the subquery
		--so example above, see customer_id in where and select. . . this is the only possibility.

--another basic ex:
--select all eng lang films

select * from film;

select * from "language" l 
where name like 'E%';

select *
from film
where language_id in (
	select language_id  from "language" l 
	where name <> 'E%'
);


--let's make this really confusing and do a supquery in a multijoin!

-- I want to know the name, email, any customers who spent more than 175 and live in country start with a
select customer_id, first_name , last_name , email, address.address, city.city, country.country 
from customer
join address
on customer.address_id = address.address_id
join city
on city.city_id = address.city_id
join country
on country.country_id = city.country_id 
where customer_id in 
(
	select customer_id 
	from payment 
	group by customer_id 
	having sum(amount) > 175
)
order by customer.customer_id;

select * from customer
where customer_id in (
	select customer_id 
	from payment 
	group by customer_id 
	having sum(amount) > 175
);

--brief intro into DML- changing a value
select * from country;

--update command
update country
set  , , , country = 'blahblah', country_id = 'blahblah'
where country = 'blahblah';

