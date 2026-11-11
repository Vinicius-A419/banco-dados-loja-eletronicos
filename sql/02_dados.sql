-- TecnoMax - Passo 2: inserção de dados fictícios
-- Execute depois do 01_estrutura.sql

USE tecnomax;

INSERT INTO marca (nome_marca) VALUES
('Logitech'), ('Samsung'), ('HyperX'), ('Razer'), ('Kingston');

INSERT INTO produtos (nome, preco, descricao, id_marca) VALUES
('Teclado G213', 249.90, 'Teclado gamer Logitech', 1),
('Galaxy Buds FE', 399.90, 'Fone Bluetooth Samsung', 2),
('Headset Cloud II', 449.90, 'Headset gamer HyperX', 3),
('Mouse DeathAdder V2', 199.90, 'Mouse gamer Razer', 4),
('SSD NV2 1TB', 429.90, 'SSD Kingston NVMe', 5),
('Mouse G502 Hero', 299.90, 'Mouse gamer Logitech', 1),
('Memoria Fury 16GB', 289.90, 'Memoria RAM Kingston', 5);

INSERT INTO estoque (id_produto, quantidade) VALUES
(1, 25), (2, 18), (3, 12), (4, 30), (5, 15), (6, 20), (7, 10);

INSERT INTO clientes (nome, cpf, email) VALUES
('Carlos Mendes', '12345678901', 'carlos@email.com'),
('Mariana Souza', '23456789012', 'mariana@email.com'),
('Pedro Oliveira', '34567890123', 'pedro@email.com'),
('Ana Costa', '45678901234', 'ana@email.com'),
('Lucas Ferreira', '56789012345', 'lucas@email.com');

INSERT INTO telefone (id_cliente, ddd, numero) VALUES
(1, '11', '987654321'),
(1, '11', '912345678'),
(2, '11', '998877665'),
(3, '11', '976543210'),
(4, '11', '934567890'),
(5, '11', '945678123');

INSERT INTO pedido (id_cliente, data_pedido) VALUES
(1, '2026-11-01 10:30:00'),
(2, '2026-11-02 14:15:00'),
(3, '2026-11-03 11:00:00'),
(1, '2026-11-04 16:20:00'),
(4, '2026-11-05 09:45:00');

INSERT INTO itens_pedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES
(1, 1, 1, 249.90),
(1, 4, 1, 199.90),
(2, 2, 1, 399.90),
(2, 5, 1, 429.90),
(3, 3, 1, 449.90),
(3, 7, 2, 289.90),
(4, 6, 1, 299.90),
(5, 1, 2, 249.90),
(5, 5, 1, 429.90);
