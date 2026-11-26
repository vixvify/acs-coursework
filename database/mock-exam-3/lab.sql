use sakila;

select payment_id, customer_id, first_name, last_name, amount,
truncate((	
	select avg(amount) 
    from payment p 
    where c.customer_id = p.customer_id
    and active = 1
    group by customer_id
), 2) as avg_amount
from payment
join customer c using(customer_id)
where amount > (	
	select avg(amount) 
    from payment p 
    where c.customer_id = p.customer_id
    group by customer_id
) and active = 1
group by payment_id, customer_id
order by amount desc, payment_id;


select distinct customer_id, first_name, last_name
from customer
where customer_id in (
	select customer_id
    from rental
    join inventory using(inventory_id)
    join film_category using(film_id)
    join category using(category_id)
    where name = 'Action'
) and customer_id in (
	select customer_id
    from rental
    join inventory using(inventory_id)
    join film_category using(film_id)
    join category using(category_id)
    where name = 'Comedy'
) and customer_id not in (
	select customer_id
    from rental
    join inventory using(inventory_id)
    join film_category using(film_id)
    join category using(category_id)
    where name = 'Horror'
) order by last_name, first_name, customer_id;


select film_id, title, rating, length, rental_rate
from film
where length > all (
	select length 
    from film
    join film_category using(film_id)
    join category using(category_id)
    where name = 'Horror' and rating = 'G'
) and rental_rate < some (
	select rental_rate 
    from film
    join film_category using(film_id)
    join category using(category_id)
    where name = 'Action' 
) and rating = 'PG-13'
order by length desc, film_id;


select customer_id, first_name, 
last_name, sum(amount) as total_payment,
	case 
		when sum(amount) = 0 then 'No Payment'
        when sum(amount) > 0 and sum(amount) < 50 then 'Bronze'
        when sum(amount) >= 50 and sum(amount) < 100 then 'Silver'
        when sum(amount) >= 100 and sum(amount) < 150 then 'Gold'
        when sum(amount) >= 150 then 'Platinum'
	end as customer_level
from customer
left join payment using(customer_id)
group by customer_id
order by 
	case 
		when sum(amount) >= 150 then 1
        when sum(amount) >= 100 and sum(amount) < 150 then 2
        when sum(amount) >= 50 and sum(amount) < 100 then 3
        when sum(amount) > 0 and sum(amount) < 50 then 4
        when sum(amount) = 0 then 5
end, sum(amount) desc, customer_id;


select category_id, name category_name,
count(film_id) total_films,
sum(case when rating = 'G' then 1 else 0 end) as g_count,
sum(case when rating = 'PG' then 1 else 0 end) as pg_count,
sum(case when rating = 'PG-13' then 1 else 0 end) as pg13_count,
sum(case when rating = 'R' then 1 else 0 end) as r_count,
sum(case when rating = 'NC-17' then 1 else 0 end) as nc17_count,
truncate((sum(case when rating = 'R' then 1 else 0 end) + sum(case when rating = 'NC-17' then 1 else 0 end)
/ nullif(count(film_id), 0)) * 100, 2) as adult_percentage
from category
left join film_category using(category_id)
left join film using(film_id)
group by category_id
order by adult_percentage desc, category_id;

show index from labtest_customer;

explain format=traditional
select * from labtest_customer where last_name = 'SMITH';

explain analyze format=tree
select * from labtest_customer where last_name = 'SMITH';

create index idx_customer_last_name on labtest_customer(last_name);

explain format=traditional
select * from labtest_customer where last_name = 'SMITH';

explain analyze format=tree
select * from labtest_customer where last_name = 'SMITH';

alter table labtest_customer
alter index idx_customer_last_name invisible;

explain format=traditional
select * from labtest_customer where last_name = 'SMITH';

explain analyze format=tree
select * from labtest_customer where last_name = 'SMITH';

alter table labtest_customer
alter index idx_customer_last_name visible;

-- แบบใช้ index จะมีจำนวนแถวที่ต้องตรวจสอบน้อยกว่า  และมี cost ตำกว่า โดยแบบไม่ใช้ index ใช้ cost 61.2 แต่การใช้ index ใช้ cost เพียง 0.65
-- บางทีที่ SQL เลือกใช้ full table scan เพราะอาจะประเมินว่า query นั้นมี selectivity สูง ซึ่งการใช้ table scan จะประหยัดกว่า


select * from labtest_payment where customer_id = 100;

select * from labtest_payment where payment_date >= '2005-07-01'
and payment_date < '2005-08-01';

select * from labtest_payment
where customer_id = 100
and payment_date >= '2005-07-01'
and payment_date < '2005-08-01';

create index idx_customer_date on labtest_payment(customer_id, payment_date);
create index idx_date_customer on labtest_payment(payment_date, customer_id);

drop index idx_customer_date on labtest_payment;

explain format=traditional
select * from labtest_payment where customer_id = 100;

explain format=traditional
select * from labtest_payment where payment_date >= '2005-07-01'
and payment_date < '2005-08-01';

explain format=traditional
select * from labtest_payment
where customer_id = 100
and payment_date >= '2005-07-01'
and payment_date < '2005-08-01';

-- index ตัวแรกเหมาะกับ Query A / C เพราะมีการใช้ where กับ customer_id ซึ่งเป็น prefix ของ index ตัวแรกทำให้ประสิทธิภาพดี
-- index ตัวที่สองเหมาะกับ query ที่ค้นหาข้อมูลผ่าน payment date เป็นอันดัยแรก และมี selectivity ไม่สูง
-- ระบบควรเรียกใช้ index 9ัวแรกมากที่สุดเพราะ เป็น query ที่ค้นหา customer_id ก่อน ซึ่งตรงกับ leftmost prefix rule กับ index ตัวแรก


with customer_payments as (
	select customer_id, first_name, last_name, 
    truncate(sum(amount), 2) as total_payment, count(payment_id) as count_payment
    from customer
    left join payment using(customer_id)
    where year(payment_date) = 2005
    group by customer_id
), average_payment as (
	select truncate(avg(total_payment), 2)
    from customer_payments
), customer_rentals as (
	select customer_id, first_name, last_name, total_payment, 
    (select * from average_payment) as average_payment,
    count(rental_id) as rental_count
    from customer_payments
    join rental using(customer_id)
    where year(rental_date) = 2005
    group by customer_id
)
select customer_id,
concat(upper(first_name), ' ', upper(last_name)) as customer_name,
total_payment, average_payment, rental_count, 
truncate(total_payment / nullif(rental_count, 0), 2) as payment_per_rental
from customer_rentals
where total_payment > average_payment
order by total_payment desc, customer_id
limit 10;


with recursive date_recursive as (
	select date('2005-05-24') as n
    union all
    select date_add(n, interval 1 day)
    from date_recursive
    where date(n) < '2005-06-07'
), rental_report as (
	select date_recursive.n as report_date, count(rental_id) as rental_count,
    case
		when count(rental_id) = 0 then 'No Activity'
        when count(rental_id) > 0 and count(rental_id) <= 100 then 'Normal'
        when count(rental_id) > 100 then 'Busy'
	end as activity_status
    from rental
    join date_recursive on date(rental_date) = date_recursive.n
    group by date_recursive.n
), payment_report as (
	select date_recursive.n as report_date, count(payment_id) as payment_count,
    sum(amount) as total_payment
    from payment
    join date_recursive on date(payment_date) = date_recursive.n
    group by date_recursive.n
)
select *
from payment_report
join rental_report using(report_date);


create view customer_privacy_report as 
select customer_id, first_name, last_name,
ifnull(concat(substr(email, 1, 3), '*****'), 'Unknown') as email,
ifnull(concat(substr(address, 1, 3), '*****'), 'Unknown') as address,
city, country
from customer
join address using(address_id)
join city using(city_id)
join country using(country_id);

create view store_1_customers as
select customer_id, first_name, last_name, store_id, active
from customer
where store_id = 1
with check option;

update store_1_customers
set first_name = "Sam"
where first_name = 'AMY';

update store_1_customers
set store_id = 2
where first_name = 'Sam';

select * from store_1_customers;

-- WITH CHECK OPTION บังคับให้ข้อมูลที่ถูก INSERT หรือ UPDATE ผ่าน View ยังคงตรงตามเงื่อนไขของ View

create view store_1_active_customers as
select customer_id, first_name, last_name
from store_1_customers
where active = 1;

select * from store_1_active_customers;

drop view customer_privacy_report;
drop view store_1_customers;
drop view store_1_active_customers;