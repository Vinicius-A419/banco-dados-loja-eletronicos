-- TecnoMax - Passo 3: consultas SQL
-- Execute depois do 02_dados.sql

USE tecnomax;

-- 1) Produtos com o nome da marca (INNER JOIN + aliases)
SELECT p.nome, p.preco, m.nome_marca
FROM produtos p
INNER JOIN marca m ON p.id_marca = m.id_marca;

-- 2) Produtos com a quantidade em estoque
SELECT p.nome, p.preco, e.quantidade
FROM produtos p
INNER JOIN estoque e ON p.id_produto = e.id_produto;
