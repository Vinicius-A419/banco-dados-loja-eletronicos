# TecnoMax – Sistema de Gerenciamento de Loja de Eletrônicos

Banco de dados relacional para uma loja fictícia de eletrônicos, a **TecnoMax**. O projeto organiza produtos, estoque, clientes, telefones e pedidos.

Foi desenvolvido como **atividade acadêmica** do curso de Análise e Desenvolvimento de Sistemas, para praticar SQL, modelagem de dados, chaves primárias e estrangeiras e relacionamentos entre tabelas.

> **Status:** em desenvolvimento. Todos os dados são fictícios.

## Tecnologias

| Ferramenta | Uso |
|---|---|
| MySQL / MariaDB | Gerenciamento do banco de dados |
| XAMPP | Ambiente local |
| phpMyAdmin | Criação das tabelas e execução dos comandos SQL |
| SQL | Criar, inserir e consultar informações |

## Estrutura do banco

O banco tem **7 tabelas**:

| Tabela | Função |
|---|---|
| `marca` | Nomes das marcas dos produtos |
| `produtos` | Nome, preço, descrição e marca de cada produto |
| `estoque` | Quantidade disponível de cada produto |
| `clientes` | Dados dos clientes |
| `telefone` | Telefones dos clientes |
| `pedido` | Compras realizadas pelos clientes |
| `itens_pedido` | Produtos, quantidades e preços de cada pedido |

### Campos

- **marca:** `id_marca` (PK), `nome_marca`
- **produtos:** `id_produto` (PK), `nome`, `preco`, `descricao`, `id_marca` (FK)
- **estoque:** `id_estoque` (PK), `id_produto` (FK, UNIQUE), `quantidade`
- **clientes:** `id_cliente` (PK), `nome`, `cpf` (UNIQUE), `email`
- **telefone:** `id_telefone` (PK), `id_cliente` (FK), `ddd`, `numero`
- **pedido:** `id_pedido` (PK), `id_cliente` (FK), `data_pedido`
- **itens_pedido:** `id_item` (PK), `id_pedido` (FK), `id_produto` (FK), `quantidade`, `preco_unitario`

## Relacionamentos

- `marca` → `produtos`: uma marca possui vários produtos (1:N)
- `produtos` → `estoque`: cada produto possui um registro de estoque (1:1)
- `clientes` → `telefone`: um cliente pode ter vários telefones (1:N)
- `clientes` → `pedido`: um cliente pode fazer vários pedidos (1:N)
- `pedido` → `itens_pedido`: um pedido possui vários itens (1:N)
- `produtos` → `itens_pedido`: um produto pode aparecer em vários pedidos (1:N)

**Muitos-para-muitos:** pedidos e produtos têm relação N:N. Um pedido pode ter vários produtos e um produto pode estar em vários pedidos. Por isso foi criada a tabela intermediária `itens_pedido`, que também guarda a quantidade e o preço unitário no momento da compra.

## Como executar

1. Abra o XAMPP e inicie o **Apache** e o **MySQL**.
2. Acesse o **phpMyAdmin** (`http://localhost/phpmyadmin`).
3. Na aba **SQL**, execute os arquivos desta pasta, nesta ordem:
   1. `sql/01_estrutura.sql`: cria o banco `tecnomax` e as tabelas
   2. `sql/02_dados.sql`: insere os dados fictícios
   3. `sql/03_consultas.sql`: consultas de exemplo

## Conceitos SQL praticados

`CREATE TABLE`, `INSERT INTO`, `SELECT`, `INNER JOIN`, `PRIMARY KEY`, `FOREIGN KEY` (com `ON DELETE RESTRICT` e `ON UPDATE CASCADE`), `AUTO_INCREMENT`, `UNIQUE`, tipos de dados (`INT`, `VARCHAR`, `CHAR`, `DECIMAL`, `DATETIME`) e apelidos (aliases) de tabelas.

## Consultas de exemplo

**Produtos e marcas**
```sql
SELECT p.nome, p.preco, m.nome_marca
FROM produtos p
INNER JOIN marca m ON p.id_marca = m.id_marca;
```

**Produtos e estoque**
```sql
SELECT p.nome, p.preco, e.quantidade
FROM produtos p
INNER JOIN estoque e ON p.id_produto = e.id_produto;
```

## Problema encontrado na configuração do ambiente

Ao iniciar o XAMPP, houve conflito na **porta 3306**, porque o serviço **MySQL80** do Windows já a utilizava. A solução foi interromper o serviço MySQL80 no gerenciador de serviços do Windows e então iniciar o MySQL do XAMPP, além do Apache para acessar o phpMyAdmin.

## Próximos passos

- [ ] Adicionar consultas com filtros (`WHERE`) e ordenação (`ORDER BY`)
- [ ] Consultas envolvendo clientes, pedidos e itens dos pedidos
- [ ] Adicionar o diagrama do banco (DER) e capturas de tela na pasta `imagens/`

## Autor

Vinicius Alves de Oliveira Finati – estudante de Análise e Desenvolvimento de Sistemas.
