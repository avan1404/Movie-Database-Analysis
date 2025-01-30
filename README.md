# Movie-Database-Analysis

SQL Query 
1. List all movies that have a rating above the average rating of all movies.
SELECT m.title
FROM movie m
WHERE m.votes_avg > (SELECT AVG(votes_avg) FROM movie);

2. Find the actors who have worked with the highest number of directors and list their names.
SELECT p.person_name, COUNT(DISTINCT mcr.person_id) AS num_of_directors
FROM movie_cast mca
JOIN movie m ON mca.movie_id = m.movie_id
JOIN movie_crew mcr ON m.movie_id = mcr.movie_id
JOIN person p ON mca.person_id = p.person_id
WHERE mcr.job = 'Director'
GROUP BY p.person_name
ORDER BY num_of_directors DESC;
