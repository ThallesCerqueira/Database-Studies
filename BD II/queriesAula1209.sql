-- Criação da base de dados BD_Thalles
CREATE DATABASE BD1;

-- Seleção da base de dados BD_Thalles
USE BD1;

-- Criação da tabela CARGO
CREATE TABLE CARGO (
    codigo INT NOT NULL PRIMARY KEY,
    nome VARCHAR(40) NOT NULL,
	simbolo CHAR(1)
);

-- Criação da tabela Empregado
CREATE TABLE Empregado (
    codigo INT IDENTITY NOT NULL PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    sexo CHAR(1) DEFAULT 'F',
    RG INT UNIQUE NOT NULL,
    cpf BIGINT UNIQUE NOT NULL,
    datanasc SMALLDATETIME NOT NULL,
    codcargo INT,
    telefone VARCHAR(10),
    dataatualizacao SMALLDATETIME DEFAULT GETDATE(),
	cod_funcao INT
    FOREIGN KEY (codcargo) REFERENCES CARGO(codigo) ON DELETE SET NULL ON UPDATE CASCADE,
    CHECK (sexo IN ('F', 'M'))
);

-- Criação da tabela Funcao
CREATE TABLE Funcao (
    codigo INT NOT NULL PRIMARY KEY,
    nome VARCHAR(40) NOT NULL
);

-- Adição da restrição de chave estrangeira cod_funcao
ALTER TABLE Empregado ADD CONSTRAINT fk_cod_funcao FOREIGN KEY (cod_funcao) REFERENCES Funcao(codigo);

-- Inserção de dados na tabela CARGO
INSERT INTO CARGO VALUES (1, 'Desenvolvedor', 'A');
INSERT INTO CARGO VALUES (2, 'Testador', 'A');
INSERT INTO CARGO VALUES (3, 'Techlead', 'B');
INSERT INTO CARGO VALUES (4, 'Coordenador', 'B');
INSERT INTO CARGO VALUES (5, 'Diretor', 'B');
INSERT INTO CARGO VALUES (6, 'Faxineiro', 'A');
INSERT INTO CARGO VALUES (7, 'Vendedor', 'A');
INSERT INTO CARGO VALUES (8, 'Frentista', 'B');
INSERT INTO CARGO VALUES (9, 'Caminhoneiro', 'B');
INSERT INTO CARGO VALUES (10, 'Advogado', 'B');

-- Inserção de dados na tabela Funcao
INSERT INTO Funcao VALUES (1, 'Analisar');
INSERT INTO Funcao VALUES (2, 'Coordenar');
INSERT INTO Funcao VALUES (3, 'Liderar');
INSERT INTO Funcao VALUES (4, 'Reger');
INSERT INTO Funcao VALUES (5, 'Planejar');
INSERT INTO Funcao VALUES (6, 'Dirigir');
INSERT INTO Funcao VALUES (7, 'Limpar');
INSERT INTO Funcao VALUES (8, 'Vender');
INSERT INTO Funcao VALUES (9, 'Abastecer');
INSERT INTO Funcao VALUES (10, 'Pleitear');

-- Criação da tabela EmpregadoNovo
CREATE TABLE EmpregadoNovo (
    codigo INT IDENTITY NOT NULL PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    sexo CHAR(1) DEFAULT 'F',
    RG INT UNIQUE NOT NULL,
    cpf BIGINT UNIQUE NOT NULL,
    datanasc SMALLDATETIME NOT NULL,
    codcargo INT,
    telefone VARCHAR(10),
    dataatualizacao SMALLDATETIME DEFAULT GETDATE(),
    cod_funcao INT,
    salario_mensal MONEY,
    FOREIGN KEY (codcargo) REFERENCES CARGO(codigo) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (cod_funcao) REFERENCES Funcao(codigo),
    CHECK (sexo IN ('F', 'M'))
);

-- FALHA NA INSERÇÃO DE EMPREGADO
-- Inserção de dados na tabela Empregado
INSERT INTO Empregado
VALUES 
('Thalles', 'M', 2091, 1234, '2001-10-10', 2, '7398843', '2024-09-12', 1),
('Paulo', 'M', 2090, 1235, '2001-10-10', 2, '7398843', '2024-09-12', 2),
('Mateus', 'M', 2092, 1236, '2001-10-10', 2, '7398843', '2024-09-12', 3),
('Marcos', 'M', 2093, 1237, '2001-10-10', 2, '7398843', '2024-09-12', 4),
('João', 'M', 412, 1238, '2001-10-10', 3, '7398843', '2024-09-12', 5),
('Paulo', 'M', 521, 1239, '2001-10-10', 3, '7398843', '2024-09-12', 6),
('Mateus', 'M', 2314, 1231, '2001-10-10', 4, '7398843', '2024-09-12', 7),
('Pedro', 'M', 5321, 1232, '2001-10-10', 1, '7398843', '2024-09-12', 8),
('Ana', 'F', 5678, 1233, '2001-11-11', 3, '7398843', '2024-11-11', 9),
('Beatriz', 'F', 1211, 12345678910, '2002-12-12', 4, '7398843', '2024-12-12', 10),
('Carla', 'F', 1221, 12345678911, '2003-01-13', 5, '7398843', '2024-01-13', 1),
('Marta', 'F', 1241, 12345678912, '2004-02-14', 6, '7398843', '2024-02-14', 2),
('Jaqueline', 'F', 1251, 12345678913, '2005-03-15', 7, '7398843', '2024-03-15', 3),
('Penelope', 'F', 1261, 12345678914, '2006-04-16', 8, '7398843', '2024-04-16', 4),
('Milena', 'F', 1271, 12345678915, '2007-05-17', 9, '7398843', '2024-05-17', 5),
('Paula', 'F', 1281, 12345678916, '2008-06-18', 10, '7398843', '2024-06-18', 6);

-- Inserção de dados na tabela EmpregadoNovo
INSERT INTO EmpregadoNovo (nome, sexo, RG, cpf, datanasc, codcargo, telefone, dataatualizacao, cod_funcao, salario_mensal)
VALUES 
('Thalles', 'M', 7654, 123456789, '2001-10-10', 2, '7398843', '2024-09-12', 1, 10000),
('Paulo', 'M', 2090, 123456789, '2001-10-10', 2, '7398843', '2024-09-12', 2, 21000),
('Mateus', 'M', 2092, 123456789, '2001-10-10', 2, '7398843', '2024-09-12', 3, 31000),
('Marcos', 'M', 2093, 123456789, '2001-10-10', 2, '7398843', '2024-09-12', 4, 41000),
('João', 'M', 412, 123456789, '2001-10-10', 3, '7398843', '2024-09-12', 5, 51000),
('Paulo', 'M', 521, 123456782, '2001-10-10', 3, '7398843', '2024-09-12', 6, 61000),
('Mateus', 'M', 2314, 123456789, '2001-10-10', 4, '7398843', '2024-09-12', 7, 71000),
('Pedro', 'M', 5321, 123456789, '2001-10-10', 1, '7398843', '2024-09-12', 8, 81000),
('Ana', 'F', 5678, 123456789, '2001-11-11', 3, '7398843', '2024-11-11', 9, 91000),
('Beatriz', 'F', 6789, 123456789, '2002-12-12', 4, '7398843', '2024-12-12', 10, 11000),
('Carla', 'F', 5432, 123456789, '2003-01-13', 5, '7398843', '2024-01-13', 1, 21000),
('Marta', 'F', 9614, 123456789, '2004-02-14', 6, '7398843', '2024-02-14', 2, 31000),
('Jaqueline', 'F', 7573, 123456789, '2005-03-15', 7, '7398843', '2024-03-15', 3, 41000),
('Penelope', 'F', 6754, 12345678930, '2006-04-16', 8, '7398843', '2024-04-16', 4, 51000),
('Milena', 'F', 9647, 12345678931, '2007-05-17', 9, '7398843', '2024-05-17', 5, 61000),
('Paula', 'F', 2378, 12345678932, '2008-06-18', 10, '7398843', '2024-06-18', 6, 71000);

-- Consultas
SELECT * FROM Empregado;
SELECT * FROM EmpregadoNovo;
SELECT nome, salario_mensal AS salario, codcargo AS cargo FROM EmpregadoNovo;
SELECT nome, salario_mensal * 12 AS salario_anual FROM EmpregadoNovo;
select count(*) from empregado;
select count(distinct sexo) from empregado;
select sexo, AVG(salario_mensal) from empregado group by sexo;

select codcargo, sexo, avg(salario)
from empregado
group by codcargo, sexo
having codcargo > 2;

select nome from empregado where nome like 'Maria%';

select nome from empregado where nome like '_a%';

select nome from empregado where nome like '[C-H]%';

SELECT NOME FROM EMPREGADO WHERE NOME LIKE '[^C-H]%';

ALTER TABLE Empregado add logradouro varchar(30);
ALTER TABLE Empregado add complemento varchar(30);
ALTER TABLE Empregado add bairro varchar(30);
ALTER TABLE Empregado add numero int;

SELECT (logradouro + ',' + complemento + ',' + bairro) as endereço from empregado;

SELECT NOME, SALARIO FROM EMPREGADO WHERE (SALARIO BETWEEN 3000 AND 4000);

