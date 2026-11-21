use sakila;

select payment_id, customer_id, amount
from payment
join customer using(customer_id)
where amount > all (
	select avg(amount)
	from payment
)
order by amount desc, payment_id;

select distinct actor_id, first_name, last_name
from (
	select actor_id, first_name, last_name
    from actor
    join film_actor using(actor_id)
    join film_category using(film_id)
    join category using(category_id)
    where name = 'Action'
) as action_actor
where actor_id not in (
	select actor_id
    from actor
    join film_actor using(actor_id)
    join film_category using(film_id)
    join category using(category_id)
    where name = 'Horror'
)
order by last_name;

select customer_id, first_name, last_name
from customer c
where exists (
	select 1
    from rental r
    join inventory using(inventory_id)
    join film using(film_id)
    where r.customer_id = c.customer_id
    and rating = 'PG-13'
) and not exists (
	select 1
    from rental r
    join inventory using(inventory_id)
    join film using(film_id)
    where r.customer_id = c.customer_id
    and rating = 'R'
);

select film_id, title, rental_rate
from film
where rental_rate < any (
	select rental_rate
    from film
    where rating = 'R'
)
group by film_id, title, rental_rate
order by rental_rate;

select film_id, title, 
count(inventory_id) as total_copy,
	case 
		when count(inventory_id) >= 5 then 'Well Stocked'
        when count(inventory_id) >= 3 then 'Available'
        when count(inventory_id) >= 1 then 'Low Stock'
        when count(inventory_id) = 0 then 'Out of Stock'
        else 'Unknown'
	end as status
from film
left join inventory using(film_id)
group by film_id, title
order by title;

select store_id, 
count(distinct customer_id) as total_customer,
sum(case when active = 1 then 1 else 0 end) as total_active,
sum(case when active = 0 then 1 else 0 end) as total_inactive,
truncate((sum(case when active = 1 then 1 else 0 end) / 
nullif(count(distinct customer_id), 0)) * 100, 2) as active_percent
from (
	select distinct customer_id, active, store_id
    from customer
    left join rental using(customer_id)
) as customer_list
group by store_id
order by store_id;

with amount_customer as (
	select customer.customer_id, 
    first_name, last_name,
    sum(amount) as amount
    from customer
    join rental using(customer_id)
    join payment using(rental_id)
    where year(payment_date) = 2005
    group by customer.customer_id
),
avg_amount as (
	select avg(amount)
    from amount_customer
)
select customer_id, first_name, 
last_name, amount,
amount - (select * from avg_amount) as diff
from amount_customer
where amount > (select * from avg_amount)
order by amount desc
limit 10;

with recursive prereq_chain as (
	select prereq_id as course_id,
    1 as lvl
    from prereq
    where course_id = 'CS-315'
    union all
    select p.prereq_id,
    pc.lvl + 1
    from prereq as p
    join prereq_chain as pc
    on p.course_id = pc.course_id
    where pc.lvl < 10
)
select course_id, lvl
from prereq_chain
order by lvl, course_id;

create index idx_customer_payment on lab_payment(customer_id, payment_date);
create index idx_payment_customer on lab_payment(payment_date, customer_id);

explain format=traditional
select * 
from lab_payment
force index (idx_customer_payment)
where customer_id = 1
and payment_date >= '2005-07-01';

explain format=traditional
select * 
from lab_payment
force index (idx_payment_customer)
where customer_id = 1
and payment_date >= '2005-07-01';

-- แบบแรกเหมาะสมกว่า เพราะ query นี้ค้นหาโดยการใช้ customer_id เป็นลำดับแรก ซึ่งเหมาะกับ index แบบแรกที่นำ customer_id มาไว้ใน leftmost

create view active_customer_info as
select customer_id, first_name, last_name, store_id, active
from customer
where active = 1
with check option;

create view store1_active_customers as 
select * from active_customer_info
where store_id = 1;

update store1_active_customers
set active = 0
where customer_id = 588;
-- อัพเดตไม่ได้เพราะ view ถูกกำหนดเป็น with check option ซึ่ง non updateable
