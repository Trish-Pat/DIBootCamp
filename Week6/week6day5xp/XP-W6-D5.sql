----------------------------------------------
--🌟 Exercise 1: Movie Rankings and Analysis
----------------------------------------------

----------------------------------------------
--Task 1: Rank Movies by Popularity within Each Genre
----------------------------------------------

-- SELECT 
--   g.genre_name,
--   m.title,
--   RANK() OVER (PARTITION BY g.genre_name ORDER BY m.popularity DESC) AS rank
-- FROM movie m
-- JOIN movie_genres mg ON m.movie_id = mg.movie_id
-- JOIN genre g ON mg.genre_id = g.genre_id

----------------------------------------------
--Task 2: Identify the Top 3 Movies by Revenue within Each Production Company
----------------------------------------------

-- SELECT pc.company_name, m.title
-- FROM movie m
-- JOIN movie_company mc ON m.movie_id = mc.movie_id
-- JOIN production_company pc ON mc.company_id = pc.company_id

----------------------------------------------
--Task 3: Calculate the Running Total of Movie Budgets for Each Genre
----------------------------------------------

-- SELECT
--   g.genre_name,
--   m.title,
--   m.budget,
--   SUM(m.budget) OVER (
--     PARTITION BY g.genre_name
--     ORDER BY m.budget
--   ) AS running_total
-- FROM
--   movie m
--   JOIN movie_genres mg ON m.movie_id = mg.movie_id
--   JOIN genre g ON mg.genre_id = g.genre_id

----------------------------------------------
--Task 4: Identify the Most Recent Movie for Each Genre
----------------------------------------------

-- WITH genre_ranked AS (
--   SELECT 
--     g.genre_name,
--     m.title,
--     m.release_date,
--     ROW_NUMBER() OVER (PARTITION BY g.genre_name ORDER BY m.release_date DESC) AS rn
--   FROM movie m
--   JOIN movie_genres mg ON m.movie_id = mg.movie_id
--   JOIN genre g ON mg.genre_id = g.genre_id
-- )
-- SELECT genre_name, title, release_date
-- FROM genre_ranked
-- WHERE rn = 1


----------------------------------------------
--🌟 Exercise 2: Cast and Crew Performance Analysis

----------------------------------------------

----------------------------------------------
--Task 1: Rank Actors by Their Appearance in Movies
----------------------------------------------

-- SELECT 
--   p.person_name,
--   COUNT(mc.movie_id) AS movie_count,
--   DENSE_RANK() OVER (ORDER BY COUNT(mc.movie_id) DESC) AS dense_rank
-- FROM person p
-- JOIN movie_cast mc ON p.person_id = mc.person_id
-- GROUP BY p.person_name


----------------------------------------------
--Task 2: Identify the Top Director by Average Movie Rating
----------------------------------------------

-- SELECT 
-- 	person_name,
-- 	avg_vote,
-- 	RANK() OVER (ORDER BY avg_vote DESC) AS rank
-- FROM(
-- 	SELECT DISTINCT 
-- 		p.person_name,
-- 		AVG(m.vote_average) AS avg_vote
-- 	FROM movie m
-- 	JOIN movie_crew mc ON m.movie_id = mc.movie_id
-- 	JOIN person p ON mc.person_id = p.person_id
-- 	WHERE job = 'Director'
-- 	GROUP BY p.person_name
-- )director_avg


----------------------------------------------
--Task 3: Calculate the Cumulative Revenue of Movies Acted by Each Actor
----------------------------------------------

-- SELECT 
--     p.person_name,
--     SUM(m.revenue) AS cumulat_rev
-- FROM 
--     person p
-- JOIN 
--     movie_cast mc ON p.person_id = mc.person_id
-- JOIN 
--     movie m ON mc.movie_id = m.movie_id
-- GROUP BY 
--     p.person_name
-- ORDER BY 
--     cumulat_rev DESC;

----------------------------------------------
-- Task 4: Identify the Director Whose Movies Have the Highest Total Budget
----------------------------------------------


WITH directors_budget AS (
    SELECT
        p.person_name,
        SUM(m.budget) AS total_budget
    FROM
        person p
        JOIN movie_crew mc ON p.person_id = mc.person_id
        JOIN movie m ON mc.movie_id = m.movie_id
    WHERE
        mc.job = 'Director'
    GROUP BY
        p.person_name
)
SELECT *
FROM (
    SELECT
        person_name,
        total_budget,
        RANK() OVER (ORDER BY total_budget DESC) AS rank
    FROM
        directors_budget
) t
WHERE rank = 1;