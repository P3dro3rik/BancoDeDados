use clinica;
-----------------------------------------------------
select distinct especialidade
from medicos;
-----------------------------------------------------
SELECT count(*)
FROM medicos;
-----------------------------------------------------
SELECT count(*)
FROM medicos
WHERE especialidade = 'ortopedia';
-----------------------------------------------------
SELECT max(idade)
FROM medicos;
-----------------------------------------------------
SELECT min(idade)
FROM medicos;
-----------------------------------------------------
SELECT avg(idade)
FROM medicos;
-----------------------------------------------------
SELECT nome, idade
FROM medicos;
-----------------------------------------------------
SELECT nome, idade
FROM medicos
ORDER BY idade;
------------------------------------------------------
SELECT nome, idade
FROM medicos
ORDER BY idade desc;
------------------------------------------------------
SELECT nome, idade
FROM medicos
ORDER BY nome;
------------------------------------------------------
SELECT nome
FROM medicos
WHERE nome like 'm%';
-------------------------------------------------------
-- EXEMPLO DE BETWEEM
 SELECT *
 FROM medicos
 WHERE idade between 30 and 40;
-------------------------------------------------------
SELECT * 
FROM medicos
WHERE idade >= 30 and idade <= 40;
-------------------------------------------------------
SELECT *
FROM medicos
WHERE especialidade IN ('ortopedia', 'neurologia'); 
-------------------------------------------------------

 
 
 
 
 

 
 
 