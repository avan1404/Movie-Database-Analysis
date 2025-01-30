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

 3. List all movies with their respective genres, directors, and release years.
    SELECT 
    genre.genre_name, 
    YEAR(movie.release_date) AS release_year, 
    person.person_name
FROM 
    movie
JOIN 
    movie_genre ON movie.movie_id = movie_genre.movie_id
JOIN 
    genre ON genre.genre_id = movie_genre.genre_id
JOIN 
    movie_crew ON movie.movie_id = movie_crew.movie_id
JOIN 
    person ON person.person_id = movie_crew.person_id
WHERE 
    movie_crew.job = 'Director';



