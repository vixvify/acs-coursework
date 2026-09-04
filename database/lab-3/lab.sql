use sakila;

SELECT film.*, name 
FROM film 
JOIN language USING(language_id);

SELECT first_name, last_name, city 
FROM customer 
JOIN address using(address_id)
JOIN city using(city_id);

SELECT title, first_name, last_name 
FROM film 
JOIN film_actor using(film_id)
JOIN actor using(actor_id);

SELECT film.*, first_name, last_name 
FROM customer
JOIN rental USING(customer_id)
JOIN inventory USING(inventory_id)
JOIN film USING(film_id)
WHERE first_name = "Mary" AND last_name = "Smith";

SELECT staff.*, district, address FROM staff
JOIN store USING(store_id)
JOIN address ON store.address_id = address.address_id;

SELECT first_name, last_name, rental_id FROM customer
LEFT JOIN rental using(customer_id);

use university;

SELECT ID, name, sec_id
FROM teaches 
JOIN instructor USING(ID);

SELECT title, section.sec_id, name
FROM instructor
JOIN teaches USING(ID)
JOIN course USING(course_id)
JOIN section USING (course_id, sec_id, semester, year)
WHERE section.semester = "Spring" AND section.year = 2010;

SELECT dept_name , COUNT(ID) FROM department
LEFT JOIN instructor USING(dept_name)
GROUP BY dept_name;