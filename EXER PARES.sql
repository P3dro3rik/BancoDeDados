-- 2)
use clinica;
--------------------------------------------------------
-- 2)
SELECT * 
FROM consultas 
WHERE data < '2006-06-14' and hora >= '12:00:00';
--------------------------------------------------------
-- 4)
SELECT *
FROM consultas
WHERE data <= '2006-06-14' and data >= '2006-06-20';
---------------------------------------------------------
-- 6) 
SELECT cidade
FROM funcionarios;
---------------------------------------------------------
-- 10)
SELECT max(hora)
FROM consultas
WHERE data = 13-06-2006
---------------------------------------------------------
-- 12)
SELECT codf, nome, salario - (salario * 0.20)
FROM funcionarios;
---------------------------------------------------------
-- 14)
SELECT * 
FROM funcionarios
WHERE CPF not like '00000'
---------------------------------------------------------
-- 16)
SELECT codp, nome 
FROM pacientes
WHERE idade > '25' and doenca in ('tendinite', 'fratura', 'gripe', 'sarampo')
