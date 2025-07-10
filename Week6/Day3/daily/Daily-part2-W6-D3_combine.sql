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

-- Part 2

-- CREATE TABLE Book (
--     book_id SERIAL PRIMARY KEY,
--     title VARCHAR(100) NOT NULL,
--     author VARCHAR(100) NOT NULL
-- );


-- INSERT INTO Book (title, author) VALUES
-- ('Alice In Wonderland', 'Lewis Carroll'),
-- ('Harry Potter', 'J.K Rowling'),
-- ('To kill a mockingbird', 'Harper Lee');


-- CREATE TABLE Student (
--     student_id SERIAL PRIMARY KEY,
--     name VARCHAR(50) NOT NULL UNIQUE,
--     age INTEGER CHECK (age <= 15)
-- );


-- INSERT INTO Student (name, age) VALUES
-- ('John', 12),
-- ('Lera', 11),
-- ('Patrick', 10),
-- ('Bob', 14);


-- CREATE TABLE Library (
--     book_fk_id INTEGER REFERENCES Book(book_id) ON DELETE CASCADE ON UPDATE CASCADE,
--     student_fk_id INTEGER REFERENCES Student(student_id) ON DELETE CASCADE ON UPDATE CASCADE,
--     borrowed_date DATE,
--     PRIMARY KEY (book_fk_id, student_fk_id, borrowed_date)
-- );

-- INSERT INTO Library (book_fk_id, student_fk_id, borrowed_date)
-- VALUES
-- (
--   (SELECT book_id FROM Book WHERE title = 'Alice In Wonderland'),
--   (SELECT student_id FROM Student WHERE name = 'John'),
--   '2022-02-15'
-- ),
-- (
--   (SELECT book_id FROM Book WHERE title = 'To kill a mockingbird'),
--   (SELECT student_id FROM Student WHERE name = 'Bob'),
--   '2021-03-03'
-- ),
-- (
--   (SELECT book_id FROM Book WHERE title = 'Alice In Wonderland'),
--   (SELECT student_id FROM Student WHERE name = 'Lera'),
--   '2021-05-23'
-- ),
-- (
--   (SELECT book_id FROM Book WHERE title = 'Harry Potter'),
--   (SELECT student_id FROM Student WHERE name = 'Bob'),
--   '2021-08-12'
-- );



-- SELECT * FROM Library;


-- SELECT s.name AS student, b.title AS book
-- FROM Library l
-- JOIN Student s ON l.student_fk_id = s.student_id
-- JOIN Book b ON l.book_fk_id = b.book_id;


-- SELECT AVG(s.age) AS average_age
-- FROM Library l
-- JOIN Student s ON l.student_fk_id = s.student_id
-- JOIN Book b ON l.book_fk_id = b.book_id
-- WHERE b.title = 'Alice In Wonderland';


-- DELETE FROM Student WHERE name = 'Bob';