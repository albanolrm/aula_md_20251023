-- Criar banco de dados
CREATE DATABASE IF NOT EXISTS loja_exemplo_sem_join;
USE loja_exemplo_sem_join;

-- ========================================
-- 1️⃣ TABELA USUÁRIOS
-- ========================================
CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    idade INT,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- CREATE (inserindo registros)
INSERT INTO usuarios (nome, email, idade) VALUES
('João Silva', 'joao@email.com', 30),
('Maria Oliveira', 'maria@email.com', 25),
('Carlos Souza', 'carlos@email.com', 40),
('Ana Costa', 'ana@email.com', 22);

-- READ (consultando dados)
SELECT * FROM usuarios;                          -- Todos os usuários
SELECT * FROM usuarios WHERE idade > 25;         -- Usuários com mais de 25 anos
SELECT * FROM usuarios WHERE nome LIKE '%a%';    -- Usuários com a letra 'a' no nome

-- UPDATE (atualizando dados)
UPDATE usuarios SET idade = 31 WHERE nome = 'João Silva';
UPDATE usuarios SET email = 'nova_maria@email.com' WHERE id = 2;

-- DELETE (removendo dados)
DELETE FROM usuarios WHERE nome = 'Carlos Souza';

-- SELECT final para conferir as alterações
SELECT * FROM usuarios;


-- ========================================
-- 2️⃣ TABELA PRODUTOS
-- ========================================
CREATE TABLE IF NOT EXISTS produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    estoque INT NOT NULL DEFAULT 0,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- CREATE (inserindo produtos)
INSERT INTO produtos (nome, preco, estoque) VALUES
('Notebook Dell', 4500.00, 10),
('Mouse Logitech', 150.00, 50),
('Teclado Mecânico', 300.00, 30),
('Monitor LG 24"', 900.00, 15);

-- READ (consultando produtos)
SELECT * FROM produtos;                                  -- Todos os produtos
SELECT nome, preco FROM produtos WHERE preco > 200;      -- Produtos acima de R$200
SELECT * FROM produtos ORDER BY preco DESC;              -- Produtos do mais caro ao mais barato

-- UPDATE (atualizando produtos)
UPDATE produtos SET preco = 4000.00 WHERE nome = 'Notebook Dell';
UPDATE produtos SET estoque = estoque - 1 WHERE nome = 'Mouse Logitech';

-- DELETE (removendo produtos)
DELETE FROM produtos WHERE nome = 'Monitor LG 24"';

-- SELECT final para conferir
SELECT * FROM produtos;


-- ========================================
-- 3️⃣ TABELA PEDIDOS
-- ========================================
CREATE TABLE IF NOT EXISTS pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    total DECIMAL(10,2),
    data_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    -- Removemos as FOREIGN KEYS para este exemplo sem JOIN
);

-- CREATE (inserindo pedidos)
INSERT INTO pedidos (id_usuario, id_produto, quantidade, total) VALUES
(1, 1, 1, 4000.00),
(2, 2, 2, 300.00),
(4, 3, 1, 300.00);

-- READ (consultando pedidos)
SELECT * FROM pedidos;                          -- Todos os pedidos
SELECT * FROM pedidos WHERE id_usuario = 1;     -- Pedidos feitos pelo usuário com ID 1
SELECT * FROM pedidos WHERE total > 500;        -- Pedidos com valor acima de 500

-- UPDATE (atualizando pedidos)
UPDATE pedidos SET quantidade = 2, total = 8000.00 WHERE id = 1;

-- DELETE (removendo pedidos)
DELETE FROM pedidos WHERE id = 2;

-- SELECT final para conferir
SELECT * FROM pedidos;


-- ========================================
-- 4️⃣ EXTRAS — CONSULTAS SIMPLES ENTRE TABELAS SEM JOIN
-- ========================================

-- Buscar nome do cliente manualmente com base no ID do pedido
SELECT id_usuario FROM pedidos WHERE id = 1;   -- Passo 1: descobre qual usuário fez o pedido
SELECT nome FROM usuarios WHERE id = 1;        -- Passo 2: busca o nome do usuário

-- Buscar nome do produto manualmente com base no ID do pedido
SELECT id_produto FROM pedidos WHERE id = 1;   -- Passo 1: descobre qual produto foi comprado
SELECT nome FROM produtos WHERE id = 1;        -- Passo 2: busca o nome do produto

-- Essas consultas simulam o comportamento de um JOIN, mas de forma manual.
