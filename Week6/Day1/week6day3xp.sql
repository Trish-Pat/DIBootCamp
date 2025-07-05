SELECT * FROM language;

SELECT film.title,film.description,language.name
      AS language_name FROM film INNER JOIN language ON film.language_id=1;
	  
SELECT film.title,film.description,language.name 
      AS language_name FROM language LEFT JOIN film ON language.language_id=1;

CREATE TABLE new_film(id INT PRIMARY KEY  ,name VARCHAR (100));

INSERT INTO new_film (id,name) VALUES( 1, 'Person of interest'),(2, 'Bat man'),(3, 'The Avengers');

SELECT * FROM new_film;

CREATE TABLE customer_review (
    review_id SERIAL PRIMARY KEY,                       
    film_id INT NOT NULL,                               
    language_id INT NOT NULL,                           
    title VARCHAR(255),                                 
    score INT CHECK (score BETWEEN 1 AND 10),           
    review_text TEXT,                                  
    last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP,    
    FOREIGN KEY (film_id) REFERENCES new_film(id) ON DELETE CASCADE,
    FOREIGN KEY (language_id) REFERENCES language(language_id)
);

SELECT * FROM new_film;
SELECT * FROM language;

INSERT INTO customer_review (film_id, language_id, title, score, review_text)
VALUES 
  (1, 1, 'Person of interest', 9, 'Great pacing and story, loved every moment.'),
  (2, 1, 'Bat man', 7, 'Fun watch but a bit too many characters.')
  ;


SELECT * FROM customer_review;

SELECT * FROM customer_review WHERE film_id = 2;


DELETE FROM new_film WHERE id = 2;

SELECT * FROM customer_review WHERE film_id = 2;



