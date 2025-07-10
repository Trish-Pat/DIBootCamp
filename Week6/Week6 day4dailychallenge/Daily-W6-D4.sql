-----------------------------------------------------------------------------------------------
-- 🌟 Exercise 1: Detailed Medal Analysis
-----------------------------------------------------------------------------------------------

CREATE TEMP TABLE competitor_seasons AS
SELECT
    games_competitor.person_id,
    sum(case WHEN games.season = 'Summer' and competitor_event.medal_id <> 4 THEN 1 ELSE 0 end) as summer_medal,
    sum(case WHEN games.season = 'Winter'  and competitor_event.medal_id <> 4 THEN 1 ELSE 0 end) as winter_medal
FROM competitor_event
LEFT JOIN games_competitor
	ON	competitor_event.competitor_id = games_competitor.id
LEFT JOIN games
	ON	games_competitor.games_id = games.id
GROUP BY
	games_competitor.person_id
HAVING
	sum(case WHEn competitor_event.medal_id = 4 THEN 0 ELSE 1 END) > 0;

SELECT * from competitor_seasons;

-----------------------------------------------------------------------------------------------
-- drop TABLE competitor_two_sport
CREATE TEMP TABLE competitor_two_sport AS
with new_one AS
(
SELECT
    games_competitor.person_id,
	event.sport_id,
    COUNT(*) over(partition by games_competitor.person_id) as different_sport
from competitor_event
LEFT JOIN event
	ON	competitor_event.event_id = event.id
LEFT JOIN games_competitor
	ON	competitor_event.competitor_id = games_competitor.id
WHERE competitor_event.medal_id <> 4
GROUP BY
	games_competitor.person_id,
	event.sport_id
)

SELECT DISTINCT person_id from new_one WHERE different_sport = 2;

SELECT
	competitor_two_sport.person_id,
    COUNT(*)
from competitor_two_sport
LEFT JOIN games_competitor
	ON	competitor_two_sport.person_id = games_competitor.person_id
LEFT JOIN competitor_event
	ON	games_competitor.id = competitor_event.competitor_id
WHERE 0=0
	and competitor_event.medal_id <> 4
GROUP BY
	competitor_two_sport.person_id
ORDER BY COUNT(*) DESC
LIMIT 3;

-----------------------------------------------------------------------------------------------
-- 🌟 Exercise 2: Region and Competitor Performance
-----------------------------------------------------------------------------------------------

CREATE TEMP TABLE region_medals AS
SELECT
	person_region.region_id,
    games_competitor.person_id,
    competitor_event.event_id,
    COUNT(*) as amount_of_medal
FROM competitor_event
LEFT JOIN games_competitor
	ON	competitor_event.competitor_id = games_competitor.id
LEFT JOIN person_region
	ON	games_competitor.person_id = person_region.person_id
where 0=0
	AND competitor_event.medal_id <> 4
GROUP BY
	person_region.region_id,
    games_competitor.person_id,
    competitor_event.event_id
ORDER BY
	COUNT(*) DESC;

SELECT
	region_id,
    event_id,
    sum(amount_of_medal)
from region_medals
GROUP BY
	region_id,
    event_id
ORDER BY
	sum(amount_of_medal) DESC
LIMIT 5;

-----------------------------------------------------------------------------------------------

--DROP TABLE competitor_no_medal
CREATE TEMP TABLE competitor_no_medal AS
WITH medal_flg_table AS
(
SELECT 
	person.id as person_id,
  	person.full_name as full_name,
    games_competitor.games_id,
  	COUNT(*) as amount_participated,
    max(case WHEN competitor_event.medal_id = 4 THEN 0 ELSE 1 END) AS medal_flg
FROM competitor_event
LEFT JOIN games_competitor
	ON	competitor_event.competitor_id = games_competitor.id
LEFT JOIN person
	ON	games_competitor.person_id = person.id
GROUP BY
	person.full_name,
    person.id,
    games_competitor.games_id
)

SELECT
	person_id,
    full_name,
    COUNT(*) as amount_games
FROM medal_flg_table
GROUP BY
	person_id,
    full_name
HAVING 0=0
	AND sum(medal_flg) = 0
    AND COUNT(*) > 3

SELECT * from competitor_no_medal