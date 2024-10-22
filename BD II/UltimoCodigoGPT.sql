-- Criação da base de dados BD_Thalles
CREATE DATABASE BD;

-- Seleção da base de dados BD_Thalles
USE BD;

-- Criação da tabela CARGO
CREATE TABLE CARGO (
    codigo INT NOT NULL PRIMARY KEY,
    nome VARCHAR(40) NOT NULL,
    simbolo CHAR(1)
);

CREATE TABLE CARGO_UM (
    codigo INT NOT NULL PRIMARY KEY,
    nome VARCHAR(40) NOT NULL,
    simbolo CHAR(1)
);

CREATE TABLE CARGO_NOVO(
	codigo INT NOT NULL PRIMARY KEY IDENTITY,
    nome VARCHAR(40) NOT NULL
);

-- Criação da tabela Funcao
CREATE TABLE Funcao (
    codigo INT NOT NULL PRIMARY KEY,
    nome VARCHAR(40) NOT NULL
);

-- Criação da tabela Empregado
CREATE TABLE Empregado (
    codigo INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    sexo CHAR(1) DEFAULT 'F' CHECK (sexo IN ('F', 'M')),
    RG INT UNIQUE NOT NULL,
    cpf BIGINT UNIQUE NOT NULL,
    datanasc SMALLDATETIME NOT NULL,
    codcargo INT,
    telefone VARCHAR(10),
    dataatualizacao SMALLDATETIME DEFAULT GETDATE(),
    cod_funcao INT,
    FOREIGN KEY (codcargo) REFERENCES CARGO(codigo) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (cod_funcao) REFERENCES Funcao(codigo)
);

-- Criação da tabela EmpregadoNovo
CREATE TABLE EmpregadoNovo (
    codigo INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    sexo CHAR(1) DEFAULT 'F' CHECK (sexo IN ('F', 'M')),
    RG INT UNIQUE NOT NULL,
    cpf BIGINT UNIQUE NOT NULL,
    datanasc SMALLDATETIME NOT NULL,
    codcargo INT,
    telefone VARCHAR(10),
    dataatualizacao SMALLDATETIME DEFAULT GETDATE(),
    cod_funcao INT,
    salario_mensal MONEY,
    FOREIGN KEY (codcargo) REFERENCES CARGO(codigo) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (cod_funcao) REFERENCES Funcao(codigo)
);

-- Inserção de dados na tabela CARGO
INSERT INTO CARGO (codigo, nome, simbolo) VALUES
(1, 'Desenvolvedora', 'A'),
(2, 'Testadoa', 'A'),
(3, 'Techlea', 'B'),
(4, 'Coordenadora', 'B'),
(5, 'Diretora', 'B'),
(6, 'Faxineira', 'A'),
(7, 'Vendedora', 'A'),
(8, 'Frentista', 'B'),
(9, 'Caminhoneira', 'B'),
(10, 'Advogada', 'B'),
(11, 'Advogado', 'B');

-- Inserção de dados na tabela CARGO
INSERT INTO CARGO_UM (codigo, nome, simbolo) VALUES
(1, 'Desenvolvedor', 'A'),
(2, 'Testador', 'A'),
(3, 'Techlead', 'B'),
(4, 'Coordenador', 'B'),
(5, 'Diretor', 'B'),
(6, 'Faxineiro', 'A'),
(7, 'Vendedor', 'A'),
(8, 'Frentista', 'B'),
(9, 'Caminhoneiro', 'B'),
(11, 'Advogado', 'B');

-- Inserção de dados na tabela Funcao
INSERT INTO Funcao (codigo, nome) VALUES
(1, 'Analisar'),
(2, 'Coordenar'),
(3, 'Liderar'),
(4, 'Reger'),
(5, 'Planejar'),
(6, 'Dirigir'),
(7, 'Limpar'),
(8, 'Vender'),
(9, 'Abastecer'),
(10, 'Pleitear');

-- Inserção de dados na tabela Empregado
INSERT INTO Empregado (nome, sexo, RG, cpf, datanasc, codcargo, telefone, dataatualizacao, cod_funcao) VALUES
('Thalles', 'M', 2091, 1234, '2001-10-10', 2, '7398843', '2024-09-12', 1),
('Paulo', 'M', 2090, 1235, '2001-10-10', 2, '7398843', '2024-09-12', 2),
('Mateus', 'M', 2092, 1236, '2001-10-10', 2, '7398843', '2024-09-12', 3),
('Marcos', 'M', 2093, 1237, '2001-10-10', 2, '7398843', '2024-09-12', 4),
('João', 'M', 412, 1238, '2001-10-10', 3, '7398843', '2024-09-12', 5),
('Paulo', 'M', 521, 1239, '2001-10-10', 3, '7398843', '2024-09-12', 6),
('Mateus', 'M', 2314, 1231, '2001-10-10', 4, '7398843', '2024-09-12', 7),
('Pedro', 'M', 5321, 1232, '2001-10-10', 1, '7398843', '2024-09-12', 8),
('Ana', 'F', 5678, 1233, '2001-11-11', 3, '7398843', '2024-11-11', 9),
('Beatriz', 'F', 1211, 12345678910, '2002-12-12', 4, '7398843', '2024-12-12', 10);

-- Inserção de dados na tabela EmpregadoNovo
INSERT INTO EmpregadoNovo (nome, sexo, RG, cpf, datanasc, codcargo, telefone, dataatualizacao, cod_funcao, salario_mensal) VALUES
('Thalles', 'M', 7654321, 2462109, '2001-10-10', 2, '7398843', '2024-09-12', 1, 10000),
('Paulo', 'M', 1234567, 866295, '2001-10-10', 2, '7398843', '2024-09-12', 2, 21000),
('Mateus', 'M', 98512, 482740, '2001-10-10', 2, '7398843', '2024-09-12', 3, 31000),
('Marcos', 'M', 1467345, 472842, '2001-10-10', 2, '7398843', '2024-09-12', 4, 41000),
('João', 'M', 185927, 038582, '2001-10-10', 3, '7398843', '2024-09-12', 5, 51000),
('Ana', 'F', 37294, 101020, '2001-11-11', 3, '7398843', '2024-11-11', 9, 91000);

-- Consultas
SELECT * FROM Empregado;
SELECT * FROM EmpregadoNovo;
SELECT nome, salario_mensal AS salario, codcargo AS cargo FROM EmpregadoNovo;
SELECT nome, salario_mensal * 12 AS salario_anual FROM EmpregadoNovo;
SELECT COUNT(*) FROM Empregado;
SELECT COUNT(DISTINCT sexo) FROM Empregado;
SELECT sexo, AVG(salario_mensal) FROM EmpregadoNovo GROUP BY sexo;

SELECT codcargo, sexo, AVG(salario_mensal) AS media_salarial
FROM EmpregadoNovo
GROUP BY codcargo, sexo
HAVING codcargo > 2;

SELECT nome FROM Empregado WHERE nome LIKE 'Maria%';
SELECT nome FROM Empregado WHERE nome LIKE '_a%';
SELECT nome FROM Empregado WHERE nome LIKE '[C-H]%';
SELECT nome FROM Empregado WHERE nome LIKE '[^C-H]%';

-- Alterações nas tabelas
ALTER TABLE Empregado ADD logradouro VARCHAR(30);
ALTER TABLE Empregado ADD complemento VARCHAR(30);
ALTER TABLE Empregado ADD bairro VARCHAR(30);
ALTER TABLE Empregado ADD numero INT;

select codigo, nome from cargo UNION (SELECT codigo, nome from CARGO_UM);

SELECT CODIGO, NOME FROM CARGO UNION ALL (SELECT CODIGO, NOME FROM CARGO_UM);

SELECT CODIGO, NOME FROM CARGO INTERSECT (SELECT CODIGO, NOME FROM CARGO_UM);

SELECT CODIGO, NOME FROM CARGO EXCEPT (SELECT CODIGO, NOME FROM CARGO_UM);


SELECT NOME, salario_mensal FROM EmpregadoNovo WHERE CODIGO IN (SELECT CODIGO FROM EMPREGADO);

SELECT E.CODIGO, E.NOME, E.salario_mensal FROM EmpregadoNovo E WHERE EXISTS (SELECT * FROM EMPREGADO N WHERE E.CODIGO = N.CODIGO);


SELECT E.CODIGO, E.NOME, E.SALARIO_MENSAL,
(SELECT NOME FROM FUNCAO F WHERE E.cod_funcao = F.codigo) AS FUNCAO
FROM EMPREGADONOVO E
WHERE EXISTS
(SELECT * FROM Empregado N WHERE E.CODIGO = N.codigo )

SELECT CODIGO, NOME, salario_mensal, codcargo AS COD_CARGO FROM EMPREGADONOVO WHERE salario_mensal > ALL (SELECT salario_mensal FROM EmpregadoNovo WHERE CODCARGO = 2);

SELECT NOME, salario_mensal FROM EMPREGADONOVO WHERE salario_mensal > (SELECT AVG(SALARIO_MENSAL) FROM EMPREGADONOVO);

CREATE VIEW EMPREGADO_CARGO_FUNCAO 
AS SELECT E.CODIGO, E.NOME, E.SALARIO_MENSAL, E.SALARIO_MENSAL * 12 AS SALARIO_ANUAL, C.CODIGO AS COD_CARGO, C.NOME AS NOME_CARGO, E.cod_funcao AS COD_FUNCAO,
F.NOME AS NOME_FUNCAO
FROM EmpregadoNovo E INNER JOIN CARGO C ON E.codcargo = C.codigo
INNER JOIN FUNCAO F
ON E.cod_funcao = F.codigo;

/* AULA DO DIA 01.10 */
SELECT * FROM EMPREGADO_CARGO_FUNCAO;

SELECT NOME, SALARIO_ANUAL, NOME_CARGO
FROM EMPREGADO_CARGO_FUNCAO
WHERE COD_CARGO > 2

CREATE PROCEDURE SPD_EMPREGADOCARGOFUNCAO
AS SELECT E.CODIGO, E.NOME, E.salario_mensal,
E.salario_mensal * 12 AS SALARIO_ANUAL, C.CODIGO AS COD_CARGO,
C.NOME AS NOME_CARGO, E.cod_funcao AS COD_FUNCAO,
F.NOME AS NOME_FUNCAO
FROM EmpregadoNovo E INNER JOIN CARGO C
ON E.codcargo = C.codigo
INNER JOIN FUNCAO F
ON E.cod_funcao = F.codigo
ORDER BY E.nome;

EXEC SPD_EMPREGADOCARGOFUNCAO;

CREATE PROCEDURE SPD_InclusaoCargo(
@codigo int,
@Nome varchar(20),
@simb char(1))
AS
INSERT INTO CARGO(
codigo,
nome,
simbolo)
VALUES (@codigo, @nome, @simb);

exec SPD_InclusaoCargo 15, 'Analista', 'A';

SELECT * FROM CARGO;

CREATE PROCEDURE SPD_AlteracaoCargo(
@codigo int,
@Nome varchar(20),
@simbolo char(1))
as
update cargo set nome = @Nome,
simbolo = @simbolo
where codigo = @codigo;

CREATE PROCEDURE SPD_ExclusaoCargo
@codigo int
AS
DELETE Cargo
WHERE CODIGO = @codigo

exec SPD_ExclusaoCargo 1

CREATE PROCEDURE SPD_CARGONOVO_RETORNO
(@Codigo int output,
@Nome varchar(20))
AS 
INSERT INTO CARGO_NOVO
(nome)
VALUES
(@Nome)
SET @CODIGO = @@IDENTITY
select @@IDENTITY as Codigo

exec SPD_CARGONOVO_RETORNO 1, 'Programadora'

CREATE TRIGGER tg_ChecaCargo
ON Cargo
FOR Insert
AS
IF EXISTS(SELECT * FROM INSERTED WHERE CODIGO > 100)
	Print 'Código inválido!!!'
ELSE 
	Print 'Código válido!!!'


INSERT INTO CARGO (codigo, nome, simbolo) VALUES
(131, 'Colecionador', 'R')

select * from CARGO


ALTER TRIGGER tg_ChecaCargo
ON Cargo
FOR Insert
AS
IF EXISTS(SELECT * FROM INSERTED WHERE CODIGO > 100)
	BEGIN
	Print 'Código inválido!!!'
	ROLLBACK
	END
ELSE 
	Print 'Código válido!!!'


INSERT INTO CARGO (codigo, nome, simbolo) VALUES
(132, 'Zelador', 'Z')

SELECT * FROM CARGO

DROP TRIGGER tg_ChegaCargo


CREATE TRIGGER tg_ExclusaoCargo
ON Cargo
FOR Delete
AS
IF EXISTS( SELECT * FROM DELETED WHERE codigo < 100 )
	Begin
	Print 'Exclusão cancelada!!!'
	ROLLBACK
	End

DELETE FROM CARGO WHERE CODIGO = 15;

CREATE TRIGGER tg_AlteracaoCargo
ON Cargo
FOR UPDATE
AS 
IF EXISTS(SELECT * FROM INSERTED WHERE simbolo = 'X')
	Begin
	Print 'Alteração cancelada'
	ROLLBACK
	End