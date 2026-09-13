use sakila;

select film_id, title, count(rental_id)
from film
join inventory using(film_id)
join rental using(inventory_id)
group by film_id, title
order by count(rental_id) desc
limit 5;

select customer_id, first_name, last_name, count(rental_id)
from customer
join rental using(customer_id)
group by customer_id, first_name, last_name
having count(rental_id) >= 40;

select first_name, last_name, sum(amount)
from staff
left join payment using(staff_id)
group by staff_id;

select title, rental_date
from film
join inventory using(film_id)
join rental using(inventory_id)
order by rental_date
limit 1;

select sum(amount)
from payment
where payment_date >= '2005-08-01' and payment_date < '2005-09-01';

select avg(datediff(return_date, rental_date))
from rental;

select month(payment_date), avg(amount)
from payment
where year(payment_date) = 2005
group by month(payment_date)
order by month(payment_date);

select customer_id, first_name, last_name, count(rental_id)
from customer
join rental using(customer_id)
where month(rental_date) = 7 and year(rental_date) = 2005
group by customer_id, first_name, last_name
order by count(rental_id) desc
limit 1;

use university;

select dept_name, count(distinct ID)
from department
left join student using(dept_name)
group by dept_name;

select ID, name, count(distinct course_id)
from instructor
join teaches using(ID)
where teaches.year = 2009
group by ID, name
order by count(distinct course_id) desc
limit 1;

select student.dept_name, sum(credits) / count(distinct ID) 
from student
join takes using(ID)
join course using(course_id)
where year = 2010
group by student.dept_name
order by sum(credits) / count(distinct ID) desc
limit 1;

select year, count(distinct course_id)
from section
group by year
order by count(distinct course_id) desc
limit 1;

select ID, name, semester, year, count(distinct course_id)
from instructor
join teaches using(ID)
group by ID, name, semester, year
having count(distinct course_id) > 3;