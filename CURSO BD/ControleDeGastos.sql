CREATE DATABASE ControleDeGastos;
USE ControleDeGastos;

-- DROP DATABASE ControleDeGastos;

CREATE TABLE Usuario (
    codUsuario INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nomePessoa VARCHAR(50) NOT NULL
);

CREATE TABLE Categoria (
    codCategoria SMALLINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nomeCategoria VARCHAR(15) NOT NULL,
    descricaoCategoria VARCHAR(100)
);

CREATE TABLE Despesa (
    codDespesa INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    descricaoDespesa VARCHAR(100),
    valorDespesa DECIMAL(10, 2) NOT NULL,
    dataDespesa DATE NOT NULL,
    codUsuarioFk INT NULL,
    codCategoriaFk SMALLINT NULL,
    FOREIGN KEY (codUsuarioFk) REFERENCES Usuario(codUsuario)
    ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (codCategoriaFk) REFERENCES Categoria(codCategoria)
    ON UPDATE CASCADE ON DELETE SET NULL
);

-- ==== INSERT ====

-- Insert na tabela Usuario
INSERT INTO Usuario (nomePessoa) 
VALUES ('Mulan Souza'), 
       ('Alice Santos'), 
       ('Carla Pereira'), 
       ('João Ferreira'), 
       ('Bruno Silva'),
       ('Bruno Guedes');
SELECT * FROM Usuario;

-- Insert na tabela Categoria
INSERT INTO Categoria (nomeCategoria, descricaoCategoria) 
VALUES ('Alimentação', 'Despesas com alimentos e restaurantes'), 
       ('Transporte', 'Despesas com transporte público e combustível'), 
       ('Educação', 'Despesas com cursos e materiais escolares');
SELECT * FROM Categoria;

-- Insert na tabela Despesa
INSERT INTO Despesa (descricaoDespesa, valorDespesa, dataDespesa, codUsuarioFk, codCategoriaFk) 
VALUES ('Compra no supermercado', 150.00, '2024-04-12', 1, 1), 
       ('Passagem de ônibus', 4.50, '2024-01-01', 3, 2),
       ('Passagem de avião', 3.50, '2024-05-20', 3, 2), 
       ('Curso de inglês', 100.00, '2024-02-12', 5, 3),
       ('Curso de culinária', 300.00, '2024-03-19', 5, 3),
       ('Compra de doce', 3.50, '2024-05-27', 1, 1);
SELECT * FROM Despesa;

-- ==== UPDATE ====

-- Atualizar nomePessoa na tabela Usuario
UPDATE Usuario
SET nomePessoa = 'Tadeu Torres'
WHERE codUsuario = 3;

-- Atualizar descricaoDespesa na tabela Despesa
UPDATE Despesa
SET descricaoDespesa = 'Curso de Informática'
WHERE codDespesa = 5;

-- ==== SELECT ====

-- SELECT Simples
SELECT * FROM Usuario;
SELECT * FROM Categoria;
SELECT * FROM Despesa;

-- SELECT com junção de 2 tabelas relacionadas (1:N)
SELECT nomePessoa, descricaoDespesa
FROM Usuario, Despesa
WHERE codUsuario = codUsuarioFk
AND valorDespesa > 1;    

-- SELECT com ORDER BY 
SELECT * FROM Categoria 
ORDER BY nomeCategoria DESC;

-- SELECT com GROUP BY e COUNT
SELECT descricaoDespesa, COUNT(codUsuarioFk) AS TotalUsuarios
FROM Despesa
GROUP BY descricaoDespesa;
 
-- SELECT com HAVING e com COUNT()
SELECT descricaoDespesa, COUNT(codUsuarioFk) AS TotalUsuarios
FROM Despesa
GROUP BY descricaoDespesa
HAVING COUNT(codUsuarioFk) > 1;

-- SELECT com ROLLUP e com SUM() 
SELECT codCategoriaFk AS Categoria, SUM(valorDespesa) AS TotalDespesas
FROM Despesa
GROUP BY codCategoriaFk WITH ROLLUP;

-- SELECT com LEFT JOIN
SELECT nomePessoa, descricaoDespesa AS TipoDespesa
FROM Usuario
LEFT JOIN Despesa 
ON Usuario.codUsuario = Despesa.codUsuarioFk;

-- SELECT com RIGHT JOIN
SELECT nomePessoa, descricaoDespesa AS TipoDespesa
FROM Usuario
RIGHT JOIN Despesa 
ON Usuario.codUsuario = Despesa.codUsuarioFk;    

-- SELECT com MIN() e MAX()
SELECT MIN(valorDespesa) AS valorDespesa_minimo, MAX(valorDespesa) AS valorDespesa_maxima
FROM Despesa;

SELECT nomePessoa, nomeCategoria, descricaoDespesa, valorDespesa, dataDespesa
FROM Usuario 
INNER JOIN Despesa
INNER JOIN Categoria
ON codUsuario = codUsuarioFk
AND codCategoria = codCategoriaFk;

-- ==== DELETE ====

-- Deletar dados da tabela Usuario
DELETE FROM Usuario
WHERE codUsuario = 6;

-- Deletar dados da tabela Categoria
DELETE FROM Categoria
WHERE codCategoria = 1;

-- Deletar dados da tabela Despesa
DELETE FROM Despesa
WHERE codDespesa = 3;