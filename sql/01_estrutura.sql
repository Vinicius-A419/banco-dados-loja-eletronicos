-- TecnoMax - Sistema de Gerenciamento de Loja de Eletrônicos
-- Passo 1: criação do banco e das tabelas

CREATE DATABASE IF NOT EXISTS tecnomax;
USE tecnomax;

CREATE TABLE marca (
    id_marca INT PRIMARY KEY AUTO_INCREMENT,
    nome_marca VARCHAR(100)
);

CREATE TABLE produtos (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    preco DECIMAL(10,2),
    descricao VARCHAR(255),
    id_marca INT,
    FOREIGN KEY (id_marca) REFERENCES marca(id_marca)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE estoque (
    id_estoque INT PRIMARY KEY AUTO_INCREMENT,
    id_produto INT UNIQUE,
    quantidade INT,
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    cpf CHAR(11) UNIQUE,
    email VARCHAR(100)
);

CREATE TABLE telefone (
    id_telefone INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    ddd CHAR(2),
    numero VARCHAR(10),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE pedido (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    data_pedido DATETIME,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE itens_pedido (
    id_item INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT,
    id_produto INT,
    quantidade INT,
    preco_unitario DECIMAL(10,2),
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
        ON DELETE RESTRICT ON UPDATE CASCADE
);
