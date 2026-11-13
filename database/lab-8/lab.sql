use sakila;

with rental_window as (
	select store_id, rental_id
	from inventory
	join rental using(inventory_id)
	where rental_date >= '2005-04-01'
	and rental_date < '2005-07-01'
)

select store_id, count(rental_id) as rental_count
from rental_window
group by store_id
order by count(rental_id) desc
limit 1;


with action_film as (
	select actor_id, first_name, last_name, film_id
	from actor
	join film_actor using(actor_id)
	join film_category using(film_id)
	join category using(category_id)
	where category.name = 'Action'
)

select first_name, last_name, count(distinct film_id) as film_count
from action_film
group by actor_id
order by count(distinct film_id) desc
limit 5;


with recursive prereq_chain AS (
	select
	prereq_id as course_id,
	1 as lvl
	from prereq
	where course_id = 'CS-315'
	union all
	select
	p.prereq_id,
	pc.lvl + 1
	from prereq as p
	join prereq_chain as pc
	on p.course_id = pc.course_id
	where pc.lvl < 10
)
select course_id, lvl
from prereq_chain
order by lvl, course_id;


with recursive numbers as (
 select 1 as n, 0 as is_even
 union all
 select n + 1, if((n+1) % 2 = 0, 1, 0) as is_even
 from numbers
 where n < 20
)
select * from numbers;