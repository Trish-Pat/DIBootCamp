--🌟 Exercise 2 : DVD Rental

--1

-- UPDATE film
-- SET language_id = 2
-- WHERE title = 'Chamber Italian'

-- UPDATE film
-- SET language_id = 3
-- WHERE title = 'Japanese Run'

--2
--for cuctomer table defined are 'store_id','address_id'

--When you INSERT a row into a table with a FOREIGN KEY, 
--the referenced value must already exist in the parent table.
--If not, the insert will fail with an error.

--3
-- drop table customer_review
-- this table is easy deleted, because we used cascade function
-- select * from customer_review

--4
-- SELECT
-- 	COUNT(*) AS not_returned
-- FROM
-- 	rental
-- WHERE
-- 	return_date IS NULL

--5

-- SELECT
--     film.title,
--     film.rental_rate
-- FROM film
-- JOIN inventory ON film.film_id = inventory.film_id
-- JOIN rental ON inventory.inventory_id = rental.inventory_id
-- WHERE rental.return_date IS NULL
-- GROUP BY
--     film.film_id, film.title, film.rental_rate
-- ORDER BY
--     film.rental_rate DESC
-- LIMIT 30


--**6**

--1
-- SELECT title FROM film
-- 	JOIN film_actor ON film.film_id = film_actor.film_id
-- 	JOIN actor ON film_actor.actor_id = actor.actor_id
-- WHERE
-- 	actor.first_name = 'Penelope'
-- 	AND actor.last_name = 'Monroe'
	
--2
-- SELECT
-- 	title,
-- 	rating,
-- 	c.name AS category
-- FROM film
-- 	JOIN film_category fc ON film.film_id = fc.film_id
-- 	JOIN category c ON fc.category_id = c.category_id
-- WHERE c.name = 'Documentary' AND rating = 'R'

--3

-- SELECT
-- 	first_name,
-- 	last_name,
-- 	amount,
-- 	rental.return_date
-- FROM
-- 	customer
-- 	JOIN payment ON customer.customer_id = payment.customer_id
-- 	JOIN rental ON payment.rental_id = rental.rental_id
-- WHERE
-- 	first_name = 'Matthew'
-- 	AND last_name = 'Mahan'
-- 	AND return_date BETWEEN '2005-07-28' AND '2005-08-01';

-- if use this parametrs, there is no 4.00$ values.

--4


-- SELECT
-- 	title,
-- 	description,
-- 	first_name,
-- 	last_name,
-- 	amount,
-- 	rental.return_date
-- FROM
-- 	customer
-- 	JOIN payment ON customer.customer_id = payment.customer_id
-- 	JOIN rental ON payment.rental_id = rental.rental_id
-- 	JOIN inventory i ON rental.inventory_id = i.inventory_id
-- 	JOIN film ON i.film_id = film.film_id

-- WHERE
-- 	first_name = 'Matthew'
-- 	AND last_name = 'Mahan'
-- 	AND description ILIKE '%boat%'
-- 	OR title ILIKE '%boat%'