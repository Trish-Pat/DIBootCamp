
-- We will use the newly installed dvdrental database.

-- In the dvdrental database write a query to select all the columns from the “customer” table.
SELECT * FROM customer;

-- Write a query to display the names (first_name, last_name) using an alias named “full_name”.
SELECT first_name || ' ' || last_name AS full_name FROM customer;
-- Lets get all the dates that accounts were created. Write a query to select all the create_date from the “customer” table (there should be no duplicates).
--SELECT  create_date from customer;
SELECT DISTINCT create_date from customer;

-- Write a query to get all the customer details from the customer table, it should be displayed in descending order by their first name.
SELECT * FROM customer ORDER by first_name desc;
-- Write a query to get the film ID, title, description, year of release and rental rate in ascending order according to their rental rate.
SELECT film_id,title,description,release_year,rental_rate from film order by rental_rate asc;
-- Write a query to get the address, and the phone number of all customers living in the Texas district, these details can be found in the “address” table.
SELECT address,phone FROM address where district='Texas';
-- Write a query to retrieve all movie details where the movie id is either 15 or 150.
SELECT * FROM film where film_id=15 or film_id=150;
-- Write a query which should check if your favorite movie exists in the database. Have your query get the film ID, title, description, length and the rental rate, these details can be found in the “film” table.
SELECT film_id,title,description,length,rental_rate from film where title='Basic Easy';
-- No luck finding your movie? Maybe you made a mistake spelling the name. Write a query to get the film ID, title, description, length and the rental rate of all the movies starting with the two first letters of your favorite movie.
SELECT film_id,title,description,length,rental_rate from film where title ilike 'Ba%';

-- Write a query which will find the 10 cheapest movies.
SELECT film_id,title,description,rental_rate from film ORDER by rental_rate asc limit 10;
-- Not satisfied with the results. Write a query which will find the next 10 cheapest movies.
SELECT film_id,title,description,rental_rate from film ORDER by rental_rate asc offset 10 limit 10;
-- Bonus: Try to not use LIMIT.

-- Write a query which will join the data in the customer table and the payment table. You want to get the first name and last name from the curstomer table, as well as the amount and the date of every payment made by a customer, ordered by their id (from 1 to…).
SELECT customer.first_name,customer.last_name,payment.amount,payment.payment_date from customer
join payment on payment.customer_id= customer.customer_id;
-- You need to check your inventory. Write a query to get all the movies which are not in inventory.
SELECT *FROM film where not exists (SELECT 1 FROM inventory where film.film_id=inventory.film_id);
-- Write a query to find which city is in which country.
SElECT city.city,country.country from country join city on city.country_id=country.country_id;

-- Bonus You want to be able to see how your sellers have been doing? Write a query to get the customer’s id, names (first and last), the amount and the date of payment ordered by the id of the staff member who sold them the dvd.
