use sakila;

create view address_customer as
select customer_id, first_name, last_name, 
concat(left(address, 3), '*****') from customer
join address using(address_id);

create view category_sale as
select date_format(payment_date, '%Y-%m') as sale_month,
category_id, name,  sum(amount)
from payment
join rental using(rental_id)
join inventory using(inventory_id)
join film_category using(film_id)
join category using(category_id)
group by sale_month, category_id;

create view film_report as
select film_id, title, name, 
count(distinct actor_id) as actor_total, 
count(distinct inventory_id) as inventory_copies, 
count(distinct rental_id) as rental_total
from film
left join film_category using(film_id)
left join category using(category_id)
left join film_actor using(film_id)
left join inventory using(film_id)
left join rental using(inventory_id)
group by film_id, name;
