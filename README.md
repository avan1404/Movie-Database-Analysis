# Movie-Database-Analysis

SQL Query 
1. List all movies that have a rating above the average rating of all movies.
SELECT m.title
FROM movie m
WHERE m.votes_avg > (SELECT AVG(votes_avg) FROM movie);
