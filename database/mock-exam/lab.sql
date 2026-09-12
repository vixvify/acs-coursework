use sakila;

select store_id, max(length) - min(length)
from film
join inventory using(film_id)
group by store_id;

select store_id, 
date_format(min(rental_date), '%W %D %M %Y') as first_date, 
date_format(max(rental_date), '%W %D %M %Y') as last_date, 
datediff( max(rental_date), min(rental_date)) as date_between
from film
join inventory using(film_id)
join rental using(inventory_id)
group by store_id;

select s.staff_id, count(rental_id), 
sum(amount), month(payment_date), year(payment_date)
from staff as s
join payment using(staff_id)
group by s.staff_id, month(payment_date), year(payment_date)
order by year(payment_date), month(payment_date), sum(amount) desc;

select concat(release_year, ' ', substr(title, 1, 5), ' ', rating) as top_3_film
from film
join inventory using(film_id)
join rental using(inventory_id)
join payment using(rental_id)
group by film_id, title
order by sum(amount) desc
limit 3;

select country, count(distinct customer_list.ID)
from customer_list
left join rental on customer_list.ID = rental.customer_id
where rental_id is null
group by country
order by count(distinct customer_list.ID) desc;

use university;

select dept_name, 
count(distinct a.i_ID) as total_advisor, 
count(distinct a.s_ID) as total_student
from department
left join instructor i using(dept_name)
left join advisor a on i.ID = a.i_ID
group by dept_name;

select ID, name, semester, year, 
count(sec_id) as total_section, 
sum(credits) as total_credits
from instructor
left join teaches using(ID)
left join course using(course_id)
group by ID, name, semester, year;

