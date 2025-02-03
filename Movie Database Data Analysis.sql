--- Retrieve the 5 lowest revenue-generating movies
SELECT movie_id, title, revenue 
FROM movie 
ORDER BY revenue 
LIMIT 5;

--- Retrieve all movies along with their genres and average votes, grouped by genre
SELECT m.movie_id, m.title, g.genre_name, m.vote_average
FROM movie m
JOIN movie_genres mg ON m.movie_id = mg.movie_id
JOIN genre g ON mg.genre_id = g.genre_id;

--- Retrieve all the movies that have a rating higher than 7.5, including their names,
--ratings, and genre
SELECT m.movie_id, m.title, m.vote_average, g.genre_name 
FROM movie m 
JOIN movie_genres mg ON m.movie_id = mg.movie_id 
JOIN genre g ON mg.genre_id = g.genre_id 
WHERE vote_average > 7.5;

--- Retrieve the movie that has the highest number of actors
SELECT m.movie_id, m.title, COUNT(mc.person_id) AS total_actors
FROM movie m
JOIN movie_cast mc ON m.movie_id = mc.movie_id
GROUP BY m.movie_id, m.title
ORDER BY total_actors DESC
LIMIT 1;

--- Retrieve the genres with movies that have an average rating above 8
SELECT m.title , g.genre_name, m.vote_average AS Ratings 
FROM movie m 
JOIN movie_genres mg ON m.movie_id = mg.movie_id 
JOIN genre g ON mg.genre_id = g.genre_id 
WHERE vote_average > 8 
GROUP BY genre_name, vote_average, title ;

--- Retrieve the movies that have the lowest and highest ratings, along with their genres
(SELECT m.title, g.genre_name, m.vote_average 
FROM movie m 
JOIN movie_genres mg ON m.movie_id = mg.movie_id 
JOIN genre g ON mg.genre_id = g.genre_id 
ORDER BY m.vote_average DESC 
LIMIT 1)
UNION ALL
(SELECT m.title, g.genre_name, m.vote_average 
FROM movie m 
JOIN movie_genres mg ON m.movie_id = mg.movie_id 
JOIN genre g ON mg.genre_id = g.genre_id 
ORDER BY m.vote_average ASC 
LIMIT 1);

--- Find the actors who have worked with the highest number of directors and list their names
SELECT p.person_name, COUNT(DISTINCT mcr.person_id) AS num_of_directors
FROM movie_cast mca
JOIN movie m ON mca.movie_id = m.movie_id
JOIN movie_crew mcr ON m.movie_id = mcr.movie_id
JOIN person p ON mca.person_id = p.person_id
WHERE mcr.job = 'Director'
GROUP BY p.person_name
ORDER BY num_of_directors DESC;

--- Retrieve the most common genre in the dataset based on the number of movies
SELECT g.genre_name, COUNT(mg.movie_id) AS movie_count  
FROM genre g  
JOIN movie_genres mg ON g.genre_id = mg.genre_id  
GROUP BY g.genre_name  
ORDER BY movie_count DESC  
LIMIT 1;












