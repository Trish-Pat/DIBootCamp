-- -- Task 1: Find the average age of competitors who have won at least one medal, 
-- -- grouped by the type of medal they won. Use a correlated subquery to achieve this.
-- SELECT
--     com_ev.medal_id,
--     avg(ga_com.age)
-- FROM games_competitor as ga_com
-- LEFT JOIN competitor_event as com_ev
-- 	on ga_com.id = com_ev.competitor_id
-- WHERE 0 = 0
-- 	AND com_ev.medal_id <> 4
-- GROUP BY
--     com_ev.medal_id;

-- -- Task 2: Identify the top 5 regions with the highest number of unique competitors 
-- -- who have participated in more than 3 different events. Use nested subqueries to 
-- -- filter and aggregate the data.
-- WITH region_person AS
-- (
-- SELECT
-- 	person_region.person_id,
--     person_region.region_id
-- FROM person_region
-- LEFT JOIN person
-- 	ON	person_region.person_id = person.id
-- LEFT JOIN games_competitor
-- 	ON	person.id = games_competitor.person_id
-- GROUP BY 
-- 	person_region.person_id,
--     person_region.region_id
-- HAVING COUNT(*)>3
-- )

-- SELECT 
-- 	noc_region.region_name,
--     COUNT(*) AS amount_unique_competitors
-- from region_person 
-- LEFT JOIN noc_region
-- 	ON	region_person.region_id = noc_region.id
-- GROUP BY
-- 	noc_region.id
-- ORDER BY COUNT(*) DESC
-- LIMIT 5;

-- -- Task 3: Create a temporary table to store the total number 
-- -- of medals won by each competitor and filter to show only those 
-- -- who have won more than 2 medals. Use subqueries to aggregate the data.

-- --DROP TABLE temporary_table;
-- CREATE TEMP TABLE temporary_table AS
-- select
-- 	games_competitor.person_id as person_id,
--     COUNT(*) as amount_medal
-- from games_competitor
-- LEFT JOIN competitor_event
-- 	ON	games_competitor.id = competitor_event.competitor_id
-- WHERE competitor_event.medal_id <> 4
-- GROUP by 
-- 	games_competitor.person_id
-- HAVING COUNT(*)>2;

-- SELECT 
-- 	* 
-- from temporary_table;

-- -- Task 4: Use a subquery within a DELETE statement to remove 
-- -- records of competitors who have not won any medals from a temporary table created for analysis.

-- --DROP TABLE competitor_for_del;
-- CREATE TEMP TABLE competitor_for_del AS
-- with competitor_and_medal AS
-- (
-- SELECT 
-- 	games_competitor.person_id as person_id ,
--     competitor_event.medal_id as medal_id,
--     COUNT(*) as amount_medal,
--     SUM(count(*)) OVER(partition by games_competitor.person_id) as all_medal
-- from games_competitor
-- LEFT JOIN competitor_event
-- on games_competitor.id = competitor_event.competitor_id
-- GROUP BY
-- 	games_competitor.person_id,
--     competitor_event.medal_id
-- )

-- SELECT
-- 	*
-- from competitor_and_medal
-- WHERE 
-- 	0=0
--     AND amount_medal = all_medal
--     and medal_id = 4;

-- --DROP TABLE all_competitors;
-- CREATE TEMP TABLE all_competitors AS
-- SELECT * from person;

-- DELETE FROM all_competitors where id in (SELECT person_id from competitor_for_del);

-- -----------------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------------
-- CREATE TEMP TABLE avg_height AS
-- SELECT
-- 	person_region.region_id,
--     avg(person.height) as avg_height
-- FROM person
-- LEFT JOIN person_region
-- 	on person.id = person_region.person_id
-- group BY person_region.region_id;

-- CREATE TEMP TABLE person_temp AS
-- select * from person;

-- CREATE TEMP TABLE person_to_update AS
-- SELECT
--     pr.person_id AS id,
--     ah.avg_height
-- FROM person_region pr
-- JOIN avg_height ah ON pr.region_id = ah.region_id;

-- UPDATE person_temp
-- SET height = (
--     SELECT ptu.avg_height
--     FROM person_to_update ptu
--     WHERE ptu.id = person_temp.id
-- )
-- WHERE id IN (SELECT id FROM person_to_update);

-- -----------------------------------------------------------------------------------------------

-- CREATE TEMP TABLE competitor_distinct AS
-- SELECT
-- 	DISTINCT competitor_event.competitor_id
-- FROM competitor_event
-- LEFT JOIN event
-- 	ON	competitor_event.event_id = event.id
-- GROUP BY
-- 	competitor_event.competitor_id,
--     event.sport_id
-- HAVING
-- 	COUNT(*)>1;
    
-- CREATE TEMP TABLE competitor_event_amount AS
-- SELECT
-- 	competitor_distinct.competitor_id,
--     COUNT(*) as games_amount
-- from competitor_distinct
-- LEFT JOIN competitor_event
-- 	on	competitor_distinct.competitor_id = competitor_event.competitor_id
-- GROUP BY
-- 	competitor_distinct.competitor_id;

-- INSERT INTO competitor_event_amount (competitor_id, games_amount)
-- VALUES (10000, 100);

-- -----------------------------------------------------------------------------------------------

-- CREATE TEMP TABLE region_avg_medal AS
-- SELECT
--     distinct person_region.region_id,
--     avg(COUNT(*)) OVER(partition by person_region.region_id),
--     avg(COUNT(*)) OVER(),
--     CASE
--     	WHEN avg(COUNT(*)) OVER(partition by person_region.region_id) < avg(COUNT(*)) OVER() then 0
--         ELSE 1
--         END as flag
-- from competitor_event
-- LEFT JOIN games_competitor
-- 	ON	competitor_event.competitor_id = games_competitor.id
-- LEFT JOIN person_region
-- 	ON	games_competitor.person_id = person_region.person_id
-- WHERE
-- 	0=0
--     and competitor_event.medal_id <> 4
-- GROUP BY
-- 	person_region.region_id,
--     person_region.person_id;

-- SELECT
-- 	region_avg_medal.region_id
-- FROM region_avg_medal
-- where flag = 1;

-- -----------------------------------------------------------------------------------------------

-- CREATE TEMP TABLE competitors_season AS
-- SELECT
-- 	games_competitor.person_id,
--     max(case WHEN games.season = 'Summer' THEN 1 ELSE 0 end) as summer,
--     max(case WHEN games.season = 'Winter' THEN 1 ELSE 0 end) as winter
-- FROM games_competitor
-- LEFT JOIN games
-- 	ON	games_competitor.games_id = games.id
-- GROUP BY
-- 	games_competitor.person_id;


-- SELECT
-- 	*
-- FROM competitors_season
-- WHERE 0=0
-- 	AND summer = 1
--     AND winter = 1;