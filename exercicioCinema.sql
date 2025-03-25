SELECT COUNT(*)
FROM MOVIES; -- = 5

SELECT COUNT(*)
FROM directors; -- = 5
-- Junção Natural
SELECT * 
FROM movies as m, directors as d  
WHERE d.id = m.director_id
AND m.director_id = 1;


SELECT *
FROM movies as m JOIN directors as d 
 ON d.id = m.director_id
 WHERE m.director_id = 1;
 -- Exemplo LEFT JOIN (puxa valores nulos)
SELECT *
FROM movies as m 
LEFT JOIN directors as d ON d.id = m.director_id
-- Exemplo RIGHT JOIN
SELECT *
FROM movies as m 
RIGHT JOIN directors as d ON d.id = m.director_id

-- 1)Liste todos os diretores e os filmes que eles dirigiram 
SELECT *
FROM directors as d JOIN movies as m
ON d.id = m.director_id;
-- 2)Liste todos os filmes e seus tickets vendidos
SELECT * 
FROM movies as m JOIN tickets as t
ON m.id = movie_id;
-- 3) List todos os filmes, seus diretores e os tickets vendidos
SELECT * 
FROM movies as m
JOIN directors as d ON d.id = m.director_id 
JOIN tickets as t ON m.id = t.movie_id;
-- 4) Liste todos os diretores, incluindo aqueles que não dirigiram nenhum filme 
SELECT *
FROM directors as d 
left join movies as m on d.id=m.director_id;
-- 5) Liste todos os filmes, incluindo aqueles que não têm um diretor associado
SELECT *
FROM directors as d 
right join movies as m on d.id=m.director_id;
