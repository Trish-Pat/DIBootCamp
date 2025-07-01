CREATE TABLE items(item_id SERIAL PRIMARY KEY, item_name VARCHAR(50),price decimal);

INSERT INTO items(item_name,price) values
('small desk',100.00),
('large desk',300.00),
('fan' ,80.00);

CREATE TABLE customer(customer_id SERIAL PRIMARY KEY,first_name VARCHAR(50),last_name VARCHAR(100));
INSERT INTO customer(first_name,last_name)values
('Greg','Jones'),('Sandra','Jones'),('Scott','Scott'),('Trevor','Green'),('Melanie','Johnson');

SELECT*from items;
SELECT*from items where price >80;
SELECT*from items where price<300;
SELECT* from customer where last_name = 'Smith'; 
SELECT*from customer where last_name= 'Jones';
SELECT* from customer where first_name !='Scott';


