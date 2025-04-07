-- Acessa o banco de dados
use loja;
-----------------------------------------------------------------------------------------------------------------------------------------------
--  Contar o número total de clientes
SELECT COUNT(*)
FROM clientes;
-----------------------------------------------------------------------------------------------------------------------------------------------
-- Contar o número total de pedidos
SELECT COUNT(*)
FROM pedidos;
-----------------------------------------------------------------------------------------------------------------------------------------------
--  Calcular o valor total de todos os pedidos
SELECT SUM(pedidos.quantidade * produtos.preco) AS valor_total
FROM pedidos
JOIN produtos ON pedidos.produto_id = produtos.id;

-----------------------------------------------------------------------------------------------------------------------------------------------
--  Calcular a média de preço dos produtos
SELECT AVG(preco)
FROM produtos;
-----------------------------------------------------------------------------------------------------------------------------------------------
--  Listar todos os clientes e seus pedidos
SELECT clientes.nome, pedidos.id AS id_pedido, pedidos.data_pedido
FROM clientes 
LEFT JOIN pedidos ON clientes.id = pedidos.cliente_id;
-----------------------------------------------------------------------------------------------------------------------------------------------
--  Listar todos os pedidos e seus produtos, incluindo pedidos sem produtos
SELECT 
    pedidos.id AS id_pedido,
    produtos.nome AS produto,
    pedidos.quantidade
FROM pedidos
LEFT JOIN produtos ON pedidos.produto_id = produtos.id;
-----------------------------------------------------------------------------------------------------------------------------------------------
--  Listar os produtos mais caros primeiro
SELECT nome, preco
FROM produtos
ORDER BY preco DESC;
-----------------------------------------------------------------------------------------------------------------------------------------------
--  Listar os produtos com menor estoque
SELECT nome, estoque
FROM produtos
ORDER BY estoque ASC;
-----------------------------------------------------------------------------------------------------------------------------------------------
--  Contar quantos pedidos foram feitos por cliente
SELECT c.nome, COUNT(p.id) AS total_pedidos
FROM clientes c
LEFT JOIN pedidos p ON c.id = p.cliente_id
GROUP BY c.id, c.nome;
-----------------------------------------------------------------------------------------------------------------------------------------------
--  Contar quantos produtos diferentes foram vendidos
SELECT COUNT(DISTINCT produto_id) AS total_produtos_vendidos
FROM pedidos
WHERE produto_id IS NOT NULL;
-----------------------------------------------------------------------------------------------------------------------------------------------
--  Mostrar os clientes que não realizaram pedidos
SELECT c.nome
FROM clientes c
LEFT JOIN pedidos p ON c.id = p.cliente_id
WHERE p.id IS NULL;
-----------------------------------------------------------------------------------------------------------------------------------------------
--  Mostrar os produtos que nunca foram vendidos
SELECT pr.nome
FROM produtos pr
LEFT JOIN pedidos p ON pr.id = p.produto_id
WHERE p.id IS NULL;
-----------------------------------------------------------------------------------------------------------------------------------------------
--  Contar o número de pedidos feitos por dia
SELECT DATE(data_pedido) AS data, COUNT(id) AS total_pedidos
FROM pedidos
GROUP BY DATE(data_pedido)
ORDER BY data DESC;
-----------------------------------------------------------------------------------------------------------------------------------------------
--  Listar os produtos mais vendidos
SELECT pr.nome, SUM(p.quantidade) AS total_vendas
FROM pedidos p
JOIN produtos pr ON p.produto_id = pr.id
GROUP BY pr.id, pr.nome
ORDER BY total_vendas DESC;
-----------------------------------------------------------------------------------------------------------------------------------------------
--  Encontrar o cliente que mais fez pedidos
SELECT c.nome, COUNT(p.id) AS total_pedidos
FROM clientes c
JOIN pedidos p ON c.id = p.cliente_id
GROUP BY c.id, c.nome
ORDER BY total_pedidos DESC
LIMIT 1;
-----------------------------------------------------------------------------------------------------------------------------------------------
--  Listar os pedidos e os clientes que os fizeram, incluindo pedidos sem clientes
SELECT p.id AS id_pedido, c.nome AS cliente
FROM pedidos p
LEFT JOIN clientes c ON p.cliente_id = c.id;
-----------------------------------------------------------------------------------------------------------------------------------------------
--  Listar os produtos e o total de vendas por produto
SELECT pr.nome, SUM(p.quantidade) AS total_vendas
FROM pedidos p
JOIN produtos pr ON p.produto_id = pr.id
GROUP BY pr.id, pr.nome
ORDER BY total_vendas DESC;
-----------------------------------------------------------------------------------------------------------------------------------------------
--  Calcular a média de quantidade de produtos por pedido
SELECT AVG(quantidade) AS media_produtos_por_pedido
FROM pedidos
WHERE quantidade IS NOT NULL;
-----------------------------------------------------------------------------------------------------------------------------------------------
--  Listar os pedidos ordenados por data (mais recentes primeiro)
SELECT id AS id_pedido, data_pedido
FROM pedidos
ORDER BY data_pedido DESC;
-----------------------------------------------------------------------------------------------------------------------------------------------
--  Contar quantos clientes possuem telefone cadastrado
SELECT COUNT(*) AS total_clientes_com_telefone
FROM clientes
WHERE telefone IS NOT NULL;
-----------------------------------------------------------------------------------------------------------------------------------------------
--  Encontrar o cliente que gastou mais dinheiro em pedidos.
SELECT c.nome, SUM(p.quantidade * pr.preco) AS total_gasto
FROM clientes c
JOIN pedidos p ON c.id = p.cliente_id
JOIN produtos pr ON p.produto_id = pr.id
GROUP BY c.id, c.nome
ORDER BY total_gasto DESC
-----------------------------------------------------------------------------------------------------------------------------------------------
-- Listar os 5 produtos mais vendidos.
SELECT pr.nome, SUM(p.quantidade) AS total_vendas
FROM pedidos p
JOIN produtos pr ON p.produto_id = pr.id
GROUP BY pr.id, pr.nome
ORDER BY total_vendas DESC
LIMIT 5;
-----------------------------------------------------------------------------------------------------------------------------------------------
-- Listar os clientes que já fizeram pedidos e o número de pedidos de cada um.
SELECT c.nome, COUNT(p.id) AS total_pedidos
FROM clientes c
JOIN pedidos p ON c.id = p.cliente_id
GROUP BY c.id, c.nome;
-----------------------------------------------------------------------------------------------------------------------------------------------
-- Encontrar a data com mais pedidos realizados
SELECT DATE(data_pedido) AS data, COUNT(id) AS total_pedidos
FROM pedidos
GROUP BY DATE(data_pedido)
ORDER BY total_pedidos DESC
LIMIT 1;
-----------------------------------------------------------------------------------------------------------------------------------------------
-- Calcular a média de valor gasto por pedido
SELECT AVG(p.quantidade * pr.preco) AS media_valor_pedido
FROM pedidos p 
JOIN produtos pr ON p.produto_id = pr.id;
-- valor arredondado
SELECT ROUND(AVG(p.quantidade * pr.preco), 2) AS media_valor_pedido
FROM pedidos p 
JOIN produtos pr ON p.produto_id = pr.id;





