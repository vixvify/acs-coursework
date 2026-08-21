use sakila;

SELECT title, rating, length 
FROM film 
WHERE rating in('PG','G') AND length >= 90 order by length desc, title 
limit 10;

SELECT payment_id , customer_id , amount , payment_date 
FROM payment 
WHERE payment_date >= '2005-06-15' and payment_date < '2005-06-21' and amount >= 5.00
ORDER BY payment_date desc;

SELECT * 
FROM actor 
WHERE last_name LIKE '_____';

SELECT * 
FROM actor 
WHERE CHAR_LENGTH(last_name) = 5; 

SELECT title
FROM film
WHERE title LIKE '% % %' AND title NOT LIKE '% % % %'
ORDER BY title;

SELECT DISTINCT rating, rental_duration 
FROM film
ORDER BY rating, rental_duration;

SELECT * FROM payment WHERE amount IS NULL;

SELECT DISTINCT rental_duration 
FROM film
WHERE rental_duration IS NOT NULL;

SELECT title, length 
FROM film
WHERE length BETWEEN 60 AND 100;

SELECT city 
FROM city
WHERE city LIKE 'G%' OR city LIKE '%Z%';

SELECT actor_id, first_name, last_name 
FROM actor
WHERE last_name IN('Williams','Davis');

SELECT * 
FROM film
ORDER BY rental_rate DESC
LIMIT 15;

SELECT COUNT(*)
FROM rental
WHERE rental_date >= '2005-07-01' AND rental_date < '2005-08-01';

