-- ========================================
-- SCRIPT COMPLETO DE CRUD EM MYSQL
-- ========================================

-- 1️⃣ Criar o banco de dados
CREATE DATABASE IF NOT EXISTS crud_exemplo;
USE crud_exemplo;

-- 2️⃣ Criar a tabela
CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    idade INT,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ========================================
-- C R E A T E  (Inserir registros)
-- ========================================
INSERT INTO usuarios (nome, email, idade) VALUES
('João Silva', 'joao@email.com', 30),
('Maria Oliveira', 'maria@email.com', 25),
('Carlos Souza', 'carlos@email.com', 40);

-- ========================================
-- R E A D  (Consultar registros)
-- ========================================

-- Ler todos os usuários
SELECT * FROM usuarios;

-- Ler um usuário específico (por ID)
SELECT * FROM usuarios WHERE id = 1;

-- Buscar por nome (usando LIKE)
SELECT * FROM usuarios WHERE nome LIKE '%Maria%';

-- ========================================
-- U P D A T E  (Atualizar registros)
-- ========================================

-- Atualizar o e-mail de um usuário
UPDATE usuarios
SET email = 'novo_email_joao@email.com'
WHERE id = 1;

-- Atualizar múltiplos campos
UPDATE usuarios
SET nome = 'Maria de Oliveira', idade = 26
WHERE email = 'maria@email.com';

-- ========================================
-- D E L E T E  (Excluir registros)
-- ========================================

-- Deletar um usuário pelo ID
DELETE FROM usuarios WHERE id = 3;

-- Deletar todos os registros (⚠️ Cuidado!)
-- DELETE FROM usuarios;

-- ========================================
-- EXTRA: Exibir tabela após as alterações
-- ========================================
SELECT * FROM usuarios;
