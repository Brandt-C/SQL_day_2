-- Let's make some stuff!

create table dif_join_customer(
	customer_id serial primary key,
	first_name varchar(200),
	last_name varchar(200),
	email varchar (225),
	address varchar (150),
	city varchar (100),
	customer_state varchar(100),
	zipcode varchar(10)
);

create table dif_join_order(
	order_id serial primary key,
	order_date date default current_date,
	amount numeric(6, 2), 
	customer_id integer,
	foreign key(customer_id) references dif_join_customer(customer_id)
);

select * from dif_join_order;

insert into dif_join_customer(first_name, last_name, email, address, city, customer_state, zipcode)
values('Bill', 'Smith', 'noemail@noemail.com', '1234 Nowhere Rd', 'Chi-Town', 'IL', '6089452');

select * from dif_join_customer;

-- delete from dif_join_customer where customer_id = 2;



insert into dif_join_customer(first_name, last_name, email, address, city, customer_state, zipcode)
values('Will', 'Smith', 'noemail@noemail.com', '4321 Nowhere Rd', 'Baltimore', 'MD', '7089452');

insert into dif_join_customer(first_name, last_name, email, address, city, customer_state, zipcode)
values('Jedidah', 'Jones', 'noemail@noemail.com', '1234 Nowhere Rd', 'Austin', 'TX', '8064452');

insert into dif_join_customer(first_name, last_name, email, address, city, customer_state, zipcode)
values('Joe', 'Burke', 'jb@noemail.com', '1221 Blank Ln', 'Portland', 'OR', '9000452');


select * from dif_join_customer ;


insert into dif_join_order(amount, customer_id)
values(767.02, 1);

insert into dif_join_order(amount, customer_id)
values(53.68, 2);

insert into dif_join_order(amount, customer_id)
values(108.0, 3);

insert into dif_join_order(amount, customer_id)
values(531.65, 3);


-- let's talk about joins!

select * from dif_join_order ;

select * from dif_join_customer ;


-- dif_join_customer table is A for below, B is dif_join_order 
-- inner join only takes data w/ matching data in both tables
select order_id, dif_join_customer.customer_id, first_name, last_name, email, amount 
from dif_join_customer 
join dif_join_order 
on dif_join_customer .customer_id = dif_join_order.customer_id ;


--FULL JOIN

select order_id, dif_join_customer.customer_id, first_name, last_name, email, amount 
from dif_join_customer 
full join dif_join_order 
on dif_join_customer .customer_id = dif_join_order.customer_id ;


-- OUTER JOIN  -All non-matching data 
-- same as a full join but throwing in a where clause to filter 

select order_id, dif_join_customer.customer_id, first_name, last_name, email, amount 
from dif_join_customer 
full join dif_join_order 
on dif_join_customer .customer_id = dif_join_order.customer_id 
where order_id is null or dif_join_customer.customer_id is null;

-- LEFT JOIN 
select order_id, dif_join_customer.customer_id, first_name, last_name, email, amount 
from dif_join_customer 
left join dif_join_order 
on dif_join_customer.customer_id = dif_join_order.customer_id;

-- LEFT OUTER JOIN -same as left join but filtered with where clause 

select order_id, dif_join_customer.customer_id, first_name, last_name, email, amount 
from dif_join_customer 
left join dif_join_order 
on dif_join_customer.customer_id = dif_join_order.customer_id
where order_id is null;

--Right Join- same as left but in reverse. . .  is this even necessary?  probably not.

select order_id, dif_join_customer.customer_id, first_name, last_name, email, amount 
from dif_join_customer 
right join dif_join_order 
on dif_join_customer.customer_id = dif_join_order.customer_id;


--RIGHT OUTER JOIN:
select order_id, dif_join_customer.customer_id, first_name, last_name, email, amount 
from dif_join_customer 
right join dif_join_order 
on dif_join_customer.customer_id = dif_join_order.customer_id
where email is null;




