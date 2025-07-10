-- CREATE TABLE customer
-- (
-- id SERIAL PRIMARY KEY,
-- first_name varchar(50) NOT NULL,
-- last_name varchar(100) NOT NULL
-- )

-- CREATE TABLE customer_profile
-- (
-- id SERIAL PRIMARY KEY,
-- isLoggedIn BOOLEAN DEFAULT false NOT NULL,
-- customer_id INTEGER UNIQUE REFERENCES customer(id)
-- )

-- INSERT INTO Customer (first_name, last_name) VALUES
-- ('John', 'Doe'),
-- ('Jerome', 'Lalu'),
-- ('Lea', 'Rive');


-- John is logged in
-- INSERT INTO CustomerProfile (isLoggedIn, customer_id)
-- VALUES (TRUE, (SELECT id FROM Customer WHERE first_name = 'John'));

-- Jerome is not logged in
-- INSERT INTO CustomerProfile (isLoggedIn, customer_id)
-- VALUES (FALSE, (SELECT id FROM Customer WHERE first_name = 'Jerome'));

--First names of logged-in customers
-- SELECT c.first_name
-- FROM Customer c
-- JOIN CustomerProfile cp ON c.id = cp.customer_id
-- WHERE cp.isLoggedIn = TRUE;


-- All customers and their isLoggedIn status (even without a profile)

-- SELECT c.first_name, cp.isLoggedIn
-- FROM Customer c
-- LEFT JOIN CustomerProfile cp ON c.id = cp.customer_id;


-- Number of customers that are not logged in

-- SELECT COUNT(*) AS not_logged_in_customers
-- FROM Customer c
-- JOIN CustomerProfile cp ON c.id = cp.customer_id
-- WHERE cp.isLoggedIn = FALSE;