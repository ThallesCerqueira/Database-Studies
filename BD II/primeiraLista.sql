CREATE DATABASE PRIMEIRA_LISTA;

CREATE TABLE PAI_pais(

	pai_cd_pais int identity primary key,
	pai_nm_pais varchar(50) not null,
	pai_dc_nacionalidade varchar(18) not null

);

CREATE TABLE ATO_ator(
	
	ato_cd_codigo int identity primary key,
	ato_nm_ator varchar(50) not null,
	ato_sx_ator char(1) DEFAULT 'M' CHECK(ato_sx_ator IN ('F', 'M')),
	ato_dt_nascimento smalldatetime not null,
	ato_rg_ator int unique not null,
	ato_cd_pais_nacionalidade int not null,
	CONSTRAINT fk_PAI_pais FOREIGN KEY (ato_cd_pais_nacionalidade)
	REFERENCES PAI_pais (pai_cd_pais)
	ON UPDATE CASCADE

);

CREATE TABLE TIP_tipo(

	tip_cd_tipo INT IDENTITY PRIMARY KEY,
	tip_dc_tipo VARCHAR(50) NOT NULL
	
);

CREATE TABLE GEN_genero(

	gen_cd_genero INT IDENTITY PRIMARY KEY,
	gen_dc_genero VARCHAR(50) NOT NULL
	
);

CREATE TABLE FIL_filme(
    fil_cd_filme INT IDENTITY PRIMARY KEY,
    fil_tl_original VARCHAR(85) NOT NULL,
    fil_tl_portugues VARCHAR(85),
    fil_cd_genero int NOT NULL,
    fil_cd_duracao VARCHAR(20) NOT NULL,
    fil_dc_importancia VARCHAR(99),
    fil_dc_impropriedade VARCHAR(20) NOT NULL,
    fil_cd_pais_origem INT NOT NULL,
    fil_cd_diretor INT NOT NULL,

    CONSTRAINT fk_GEN_genero FOREIGN KEY (fil_cd_genero)
    REFERENCES GEN_genero (gen_cd_genero)
    ON UPDATE CASCADE,

    CONSTRAINT fk_PAI_pais_pais FOREIGN KEY (fil_cd_pais_origem)
    REFERENCES PAI_pais (pai_cd_pais),

    CONSTRAINT fk_ATO_ator FOREIGN KEY (fil_cd_diretor)
    REFERENCES ATO_ator (ato_cd_codigo)
    ON UPDATE CASCADE

);

CREATE TABLE EST_estado(

	est_cd_estado INT IDENTITY PRIMARY KEY,
	est_nm_estado VARCHAR(50) NOT NULL,
	est_cd_pais INT NOT NULL,
	CONSTRAINT fk_PAI_pais_estado FOREIGN KEY (est_cd_pais)
	REFERENCES PAI_pais (pai_cd_pais)
	ON UPDATE CASCADE

);


CREATE TABLE CID_cidade(
	cid_cd_cidade INT IDENTITY PRIMARY KEY,
	cid_nm_cidade VARCHAR(50) NOT NULL,
	cid_cd_estado INT NOT NULL,
	CONSTRAINT fk_EST_estado FOREIGN KEY (cid_cd_estado)
	REFERENCES EST_estado(est_cd_estado)
	ON UPDATE CASCADE

);

CREATE TABLE CIN_cinema(
	cin_cd_cinema INT IDENTITY PRIMARY KEY,
	cin_nm_fantasia VARCHAR(50) NOT NULL,
	cin_dc_logradouro VARCHAR(30) NOT NULL,
	cin_dc_compelemento VARCHAR(20),
	cin_nu_numero INT,
	cin_dc_bairro VARCHAR(20) NOT NULL,
	cin_cidade INT NOT NULL,
	CONSTRAINT fk_CID_cidade FOREIGN KEY (cin_cidade)
	REFERENCES CID_cidade(cid_cd_cidade)
	ON UPDATE CASCADE,
	cid_cp_lotacao INT NOT NULL
);

CREATE TABLE FCI_filme_cinema(
    fci_cd_filme INT NOT NULL,
    fci_cd_cinema INT NOT NULL,
    fci_dt_inicio SMALLDATETIME NOT NULL,
    fci_dt_fim SMALLDATETIME NOT NULL,
    CONSTRAINT PK_FCI_filme_cinema PRIMARY KEY (fci_cd_filme, fci_cd_cinema)
);

/* QUEST�O 2*/
DROP TABLE FCI_filme_cinema;

/* QUEST�O 3*/
ALTER TABLE FIL_filme 
ADD fil_cd_tipo INT 
CONSTRAINT fk_TIP_tipo FOREIGN KEY (fil_cd_tipo) 
REFERENCES TIP_tipo(tip_cd_tipo)
ON UPDATE CASCADE

/* QUEST�O 4*/
ALTER TABLE FIL_filme
ALTER COLUMN fil_tl_original VARCHAR(100) NOT NULL

/* QUEST�O 5*/
ALTER TABLE FIL_filme
DROP COLUMN fil_dc_impropriedade;

/* QUEST�O 6*/
CREATE TABLE FCI_filme_cinema(
    fci_cd_filme INT NOT NULL,
    fci_cd_cinema INT NOT NULL,
    fci_dt_inicio SMALLDATETIME NOT NULL,
    fci_dt_fim SMALLDATETIME NOT NULL,
);

/* QUEST�O 7*/
ALTER TABLE FCI_filme_cinema
ADD CONSTRAINT pk_filme_cinema PRIMARY KEY (fci_cd_filme, fci_cd_cinema)

/* QUEST�O 8*/
ALTER TABLE FCI_filme_cinema
ADD CONSTRAINT fk_fci_cd_cinema FOREIGN KEY (fci_cd_cinema)
REFERENCES CIN_cinema (cin_cd_cinema)
ON UPDATE CASCADE;

/* QUEST�O 9*/
INSERT INTO PAI_pais (pai_nm_pais, pai_dc_nacionalidade)
VALUES 
('Brasil', 'Brasileiro'),
('Estados Unidos', 'Americano'),
('Fran�a', 'Franc�s'),
('Alemanha', 'Alem�o'),
('Jap�o', 'Japon�s');

INSERT INTO EST_estado (est_nm_estado, est_cd_pais)
VALUES 
('S�o Paulo', 1), 
('California', 2),
('�le-de-France', 3),
('Baviera', 4),
('T�quio', 5);

INSERT INTO CID_cidade (cid_nm_cidade, cid_cd_estado)
VALUES 
('S�o Paulo', 1),
('Los Angeles', 2),
('Paris', 3),
('Munique', 4),
('T�quio', 5);

INSERT INTO GEN_genero (gen_dc_genero)
VALUES 
('A��o'),
('Com�dia'),
('Drama'),
('Terror'),
('Document�rio');

INSERT INTO TIP_tipo (tip_dc_tipo)
VALUES 
('Longa-metragem'),
('Curta-metragem'),
('S�rie'),
('Miniss�rie'),
('Anima��o');

/* QUEST�O 10*/
INSERT INTO ATO_ator (ato_nm_ator, ato_sx_ator, ato_dt_nascimento, ato_rg_ator, ato_cd_pais_nacionalidade)
VALUES
('Jo�o Silva', 'M', '19850715', 1234, 1),
('Carlos Souza', 'M', '19900310', 9876, 1),
('Maria Oliveira', 'F', '19920522', 1237, 1),
('Ana Costa', 'F', '19881130', 4561, 1),
('Fernanda Lima', 'F', '19950914', 7894, 1);

/* QUEST�O 11*/
UPDATE PAI_pais
SET pai_nm_pais = 'Jap�o', pai_dc_nacionalidade = 'Japon�s'
WHERE pai_cd_pais = 2;

/* QUEST�O 12*/
DELETE FROM ATO_ator
WHERE ato_sx_ator = 'M';

/* QUEST�O 13*/
SELECT pai_cd_pais, pai_nm_pais
FROM PAI_pais
WHERE pai_cd_pais = 1;

/* QUEST�O 14*/
SELECT ato_nm_ator, ato_sx_ator, ato_dt_nascimento
FROM ATO_ator
WHERE ato_sx_ator = 'F';

/* QUEST�O 15*/
INSERT INTO FIL_filme (fil_tl_original, fil_tl_portugues, fil_cd_genero, fil_cd_duracao, fil_dc_importancia, fil_cd_pais_origem, fil_cd_diretor)
VALUES
('Inception', NULL, 1, '148', 'Alta', 1, 6),
('The Dark Knight', NULL, 2, '152', 'Alta', 1, 7),
('Interstellar', NULL, 3, '169', 'Alta', 1, 8),
('Fight Club', NULL, 1, '139', 'Alta', 1, 6),
('The Matrix', NULL, 2, '136', 'Alta', 1, 7);

INSERT INTO FIL_filme (fil_tl_original, fil_tl_portugues, fil_cd_genero, fil_cd_duracao, fil_dc_importancia, fil_cd_pais_origem, fil_cd_diretor)
VALUES
('Parasite', 'Parasita', 4, '132', 'Alta', 1, 6),
('The Godfather', 'O Poderoso Chef�o', 5, '175', 'Alta', 1, 7),
('Spirited Away', 'A Viagem de Chihiro', 5, '125', 'Alta', 1, 8),
('City of God', 'Cidade de Deus', 1, '130', 'Alta', 1, 6),
('Forrest Gump', 'Forrest Gump: O Contador de Hist�rias', 3, '142', 'Alta', 1, 7);

SELECT fil_tl_original
FROM FIL_filme
WHERE fil_tl_portugues IS NULL
ORDER BY fil_tl_original ASC;

