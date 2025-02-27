
show databases;
use capstone_project;
show tables;
select * from football_data_merged_cleaned;

-- 1)a
SELECT 
    name, 
    SUM(goals) AS total_goals, 
    SUM(assists) AS total_assists, 
    SUM(yellow_cards) AS total_yellow_cards, 
    SUM(red_cards) AS total_red_cards, 
    SUM(minutes_played) AS total_minutes_played
FROM football_data_merged_cleaned
GROUP BY name
ORDER BY total_goals DESC, total_assists DESC
LIMIT 10;

-- 1)b
SELECT 
    home_club_name AS club,
    home_club_manager_name AS manager,
    SUM(home_club_goals) AS total_home_goals,
    SUM(away_club_goals) AS total_away_goals,
    SUM(home_club_goals + away_club_goals) AS total_goals,
    AVG(home_club_position) AS avg_home_position,
    AVG(away_club_position) AS avg_away_position
FROM football_data_merged_cleaned
GROUP BY home_club_name, home_club_manager_name
ORDER BY total_goals DESC, avg_home_position ASC;



-- 1.c
SELECT 
name,SUM(yellow_cards) AS total_yellow_cards,SUM(red_cards) AS total_red_cards
 FROM football_data_merged_cleaned 
 GROUP BY name 
 ORDER BY total_red_cards DESC, total_yellow_cards DESC LIMIT 10;




-- team comparison
-- 1.
SELECT 
    home_club_name AS team,
    SUM(home_club_goals) AS home_goals,
    SUM(away_club_goals) AS away_goals,
    SUM(home_club_goals + away_club_goals) AS total_goals
FROM football_data_merged_cleaned
GROUP BY home_club_name
ORDER BY total_goals DESC;

-- 3. 
SELECT 
    home_club_name AS team,
    SUM(yellow_cards) AS total_yellow_cards,
    SUM(red_cards) AS total_red_cards
FROM football_data_merged_cleaned
GROUP BY home_club_name
ORDER BY total_yellow_cards DESC;



-- attendance
SELECT stadium, AVG(attendance) AS avg_attendance
FROM football_data_merged_cleaned
GROUP BY stadium
ORDER BY avg_attendance DESC;



SELECT season, AVG(attendance) AS avg_attendance
FROM football_data_merged_cleaned
GROUP BY season
ORDER BY season;



-- refree
	SELECT referee, COUNT(competition_id_x) AS total_matches
	FROM football_data_merged_cleaned
	GROUP BY referee
	ORDER BY total_matches DESC
	LIMIT 10;


SELECT referee, AVG(yellow_cards) AS avg_yellow_cards, AVG(red_cards) AS avg_red_cards
FROM football_data_merged_cleaned
GROUP BY referee
ORDER BY avg_yellow_cards DESC;



SELECT referee, AVG(penalty_calls) AS avg_penalty_calls
FROM football_data_merged_cleaned
GROUP BY referee
ORDER BY avg_penalty_calls DESC
LIMIT 10;

	
SELECT team_name, AVG(substitutions) AS avg_substitutions
FROM football_data_merged_cleaned
GROUP BY team_name
ORDER BY avg_substitutions DESC
LIMIT 10;


-- Event Analysis
SELECT minute, COUNT(*) AS goal_count
FROM football_data_merged_cleaned
GROUP BY minute
ORDER BY goal_count DESC
LIMIT 10;
