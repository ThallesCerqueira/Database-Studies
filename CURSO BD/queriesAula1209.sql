-- Criação da base de dados BD2
CREATE DATABASE BD2;
/*drop database BD2;*/

-- Seleção da base de dados BD2
USE BD2;

-- Criação da tabela CARGO
CREATE TABLE CARGO (
    codigo INT NOT NULL PRIMARY KEY,
    nome VARCHAR(40) NOT NULL
);

-- Criação da tabela Empregado
CREATE TABLE Empregado (
    codigo INT IDENTITY NOT NULL PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    sexo CHAR(1) DEFAULT 'F',
    RG INT UNIQUE NOT NULL,
    cpf BIGINT UNIQUE NOT NULL, -- Corrigido para BIGINT para armazenar CPF adequadamente
    datanasc SMALLDATETIME NOT NULL,
    codcargo INT,
    telefone VARCHAR(10),
    dataatualizacao SMALLDATETIME DEFAULT GETDATE(),
    FOREIGN KEY (codcargo) REFERENCES CARGO(codigo) ON DELETE SET NULL ON UPDATE CASCADE,
    CHECK (sexo IN ('F', 'M'))
);

-- Alterações na tabela CARGO
ALTER TABLE CARGO ADD sigla VARCHAR(10);

-- Remoção da coluna sigla
ALTER TABLE CARGO DROP COLUMN sigla;

-- Adição e restrição na coluna smb
ALTER TABLE CARGO ADD smb CHAR(1);
ALTER TABLE CARGO ADD CONSTRAINT simbolo CHECK (smb IN ('A', 'B', 'C'));

-- Criação da tabela Funcao
CREATE TABLE Funcao (
    codigo INT NOT NULL PRIMARY KEY,
    nome VARCHAR(40) NOT NULL
);

-- Adição da coluna cod_funcao na tabela Empregado
ALTER TABLE Empregado ADD cod_funcao INT;

-- Adição da restrição de chave estrangeira cod_funcao
ALTER TABLE Empregado ADD CONSTRAINT fk_cod_funcao FOREIGN KEY (cod_funcao) REFERENCES Funcao(codigo);

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

INSERT INTO Empregado VALUES('Thalles', 'M', 2091, 093, '10/10/2001', 2, '7398843', '12/09/2024', 1);
INSERT INTO Empregado VALUES('Paulo', 'M', 2090, 090, '10/10/2001', 2, '7398843', '12/09/2024', 1);
INSERT INTO Empregado VALUES('Mateus', 'M', 2092, 091, '10/10/2001', 2, '7398843', '12/09/2024', 1);
INSERT INTO Empregado VALUES('Marcos', 'M', 2093, 092, '10/10/2001', 2, '7398843', '12/09/2024', 1);
INSERT INTO Empregado VALUES('João', 'M', 412, 412, '10/10/2001', 3, '7398843', '12/09/2024', 1);
INSERT INTO Empregado VALUES('Paulo', 'M', 521, 521, '10/10/2001', 3, '7398843', '12/09/2024', 1);
INSERT INTO Empregado VALUES('Mateus', 'M', 2314, 2314, '10/10/2001', 4, '7398843', '12/09/2024', 1);
INSERT INTO Empregado VALUES('Pedro', 'M', 5321, 5321, '10/10/2001', 1, '7398843', '12/09/2024', 1);

/*FALTA POPULAR ESSA MELHOR*/
INSERT INTO Empregado VALUES('Thalles', 'M', 2091, 093, '10/10/2001', 2, '7398843', '12/09/2024', 1);
INSERT INTO Empregado VALUES('Paulo', 'M', 2090, 090, '10/10/2001', 2, '7398843', '12/09/2024', 1);
INSERT INTO Empregado VALUES('Mateus', 'M', 2092, 091, '10/10/2001', 2, '7398843', '12/09/2024', 1);
INSERT INTO Empregado VALUES('Marcos', 'M', 2093, 092, '10/10/2001', 2, '7398843', '12/09/2024', 1);
INSERT INTO Empregado VALUES('João', 'M', 412, 412, '10/10/2001', 3, '7398843', '12/09/2024', 1);
INSERT INTO Empregado VALUES('Paulo', 'M', 521, 521, '10/10/2001', 3, '7398843', '12/09/2024', 1);
INSERT INTO Empregado VALUES('Mateus', 'M', 2314, 2314, '10/10/2001', 4, '7398843', '12/09/2024', 1);
INSERT INTO Empregado VALUES('Pedro', 'M', 5321, 5321, '10/10/2001', 1, '7398843', '12/09/2024', 1);

CREATE TABLE EmpregadoNovo(
    codigo INT IDENTITY NOT NULL PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    sexo CHAR(1) DEFAULT 'F',
    RG INT UNIQUE NOT NULL,
    cpf BIGINT UNIQUE NOT NULL, -- Corrigido para BIGINT para armazenar CPF adequadamente
    datanasc SMALLDATETIME NOT NULL,
    codcargo INT,
    telefone VARCHAR(10),
    dataatualizacao SMALLDATETIME DEFAULT GETDATE(),
    FOREIGN KEY (codcargo) REFERENCES CARGO(codigo) ON DELETE SET NULL ON UPDATE CASCADE,
    CHECK (sexo IN ('F', 'M'))

)

UPDATE CARGO SET CODIGO = 20 WHERE CODIGO = 1;

SELECT * FROM Empregado;

/*select nome, cpf from empregado where sexo = 'M' and cod_funcao >= 1;*/

select nome, cpf from Empregado where codcargo = 2 or codcargo = 8;

SELECT *  FROM EMPREGADO WHERE codcargo = 2 ORDER BY nome;

select codcargo, nome from Empregado order by codcargo, nome;

select codcargo, nome from Empregado order by codcargo desc, nome asc;



