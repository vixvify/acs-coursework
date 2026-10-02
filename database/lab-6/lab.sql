use sakila;

select name,
	case 
		when name in ('English', 'Italian', 'French', 'German') then 'latin1'
        when name in ('Japanese', 'Mandarin') then 'utf8'
        else 'Unknown'
	end character_set
from language;

select payment_id, customer_id, amount,
	case 
		when amount < 2.00 then 'Low'
		when amount < 5.00 then 'Medium'
		when amount < 8.00 then 'High'
        when amount >= 8.00 then 'Very High'
        else 'Unknown'
	end 'payment_level'
from payment;

select customer_id, first_name, last_name,
coalesce(concat(last_name, ', ', first_name), first_name, last_name, 'Unknown Customer') as display_name
from customer;

select
    sum(case when amount < 2.00 then 1 else 0 end) as under_2,
    sum(case when amount >= 2.00 and amount < 5.00 then 1 else 0 end) as from_2_to_5,
    sum(case when amount >= 5.00 and amount < 8.00 then 1 else 0 end) as from_5_to_8,
    sum(case when amount >= 8.00 then 1 else 0 end) as over_8
from payment;

select customer.customer_id, 
count(distinct rental_id) as number_of_rentals,
count(distinct payment_id) as number_of_payments,
count(distinct payment_id) / nullif(count(distinct rental_id), 0) as payment_per_rental,
	case 
		when count(distinct rental_id) = 0 then 'No Activity'
        when count(distinct rental_id) <= 10 then 'Light'
        when count(distinct rental_id) <= 25 then 'Moderate'
        when count(distinct rental_id) > 25 then 'Frequent'
        else 'Unknown'
	end 'rental_usage'
from customer
left join rental using(customer_id)
left join payment using(rental_id)
group by customer.customer_id;