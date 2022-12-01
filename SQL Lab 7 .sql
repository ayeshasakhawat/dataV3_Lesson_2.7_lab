-- 2.7 Lab | SQL Join (Part I)


-- 1. How many films are there for each of the categories in the category table. Use appropriate join to write this query.
SELECT  count(f.title) as number_of_films, c.name
FROM sakila.film as f
JOIN sakila.film_category as fcat
ON f.film_id = fcat.film_id
JOIN sakila.category as c
ON c.category_id = fcat.category_id
GROUP BY fcat.category_id;

-- ************************************************************
SELECT c.name as category , COUNT(DISTINCT f.film_id) as num_films
FROM sakila.category c
JOIN sakila.film_category f
ON c.category_id = f.category_id
GROUP BY c.name
ORDER BY num_films DESC;

-- 2. Display the total amount rung up by each staff member in August of 2005.

SELECT staff_id as member, sum(amount) as amount
FROM sakila.payment
WHERE MONTH(payment_date) IN (8) AND YEAR(payment_date) IN (2005)
GROUP BY staff_id
ORDER BY amount DESC;


-- 3. Which actor has appeared in the most films?

SELECT a.first_name as name, a.last_name as last_name, COUNT(DISTINCT(f.film_id)) as amount
FROM sakila.film_actor f
JOIN sakila.actor a
ON f.actor_id = a.actor_id
GROUP BY a.actor_id
ORDER BY amount DESC;


-- 4.Most active customer (the customer that has rented the most number of films)


SELECT c.customer_id as customer, count(distinct(r.rental_id)) as amount_rentals
FROM sakila.rental r
JOIN sakila.customer c
ON r.customer_id = c.customer_id
WHERE c.active >0
GROUP BY c.customer_id
ORDER BY amount_rentals DESC;


-- 5. Display the first and last names, as well as the address, of each staff member.

SELECT * FROM staff;
SELECT * FROM address;


SELECT s.first_name as firstname, s.last_name as lastname, a.address 
FROM sakila.staff s
JOIN sakila.address a
ON s.address_id = a.address_id
GROUP BY a.address_id, s.first_name, s.last_name;


-- 6. List each film and the number of actors who are listed for that film.

SELECT * FROM film_actor;
SELECT * FROM actor;
SELECT * FROM film;


SELECT f.title, count(fa.actor_id) as number_actors
FROM sakila.film_actor fa
JOIN sakila.film f 
ON fa.film_id = f.film_id
GROUP BY f.film_id
ORDER BY number_actors DESC;


-- 7. Using the tables payment and customer and the JOIN command, list the total paid by each customer.
-- List the customers alphabetically by last name.

SELECT c.last_name as customer_name, sum(p.payment_id) as total_paid
FROM sakila.payment p
JOIN sakila.customer c
ON p.customer_id = c.customer_id
GROUP BY c.customer_id
ORDER BY c.last_name ASC;


-- 8. List number of films per category.

SELECT c.name as category_name, COUNT(fcat.film_id) as num_films
FROM sakila.film_category as fcat
JOIN sakila.category as c
ON fcat.category_id = c.category_id 
GROUP BY c.name
ORDER BY num_films;