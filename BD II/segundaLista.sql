CREATE DATABASE SEGUNDA_LISTA;

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
	cin_dc_complemento VARCHAR(20),
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


INSERT INTO PAI_pais (pai_nm_pais, pai_dc_nacionalidade)
VALUES 
('Brasil', 'Brasileiro'),
('Estados Unidos', 'Americano'),
('França', 'Francês'),
('Alemanha', 'Alemão'),
('Japão', 'Japonês');

INSERT INTO EST_estado (est_nm_estado, est_cd_pais)
VALUES 
('São Paulo', 1), 
('California', 2),
('Île-de-France', 3),
('Baviera', 4),
('Tóquio', 5);

INSERT INTO CID_cidade (cid_nm_cidade, cid_cd_estado)
VALUES 
('São Paulo', 1),
('Los Angeles', 2),
('Paris', 3),
('Munique', 4),
('Tóquio', 5);

INSERT INTO GEN_genero (gen_dc_genero)
VALUES 
('Ação'),
('Comédia'),
('Drama'),
('Terror'),
('Documentário');

INSERT INTO TIP_tipo (tip_dc_tipo)
VALUES 
('Longa-metragem'),
('Curta-metragem'),
('Série'),
('Minissérie'),
('Animação');

INSERT INTO ATO_ator (ato_nm_ator, ato_sx_ator, ato_dt_nascimento, ato_rg_ator, ato_cd_pais_nacionalidade)
VALUES
('João Silva', 'M', '19850715', 1234, 1),
('Carlos Souza', 'M', '19900310', 9876, 1),
('Maria Oliveira', 'F', '19920522', 1237, 1),
('Ana Costa', 'F', '19881130', 4561, 1),
('Fernanda Lima', 'F', '19950914', 7894, 1);

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
('The Godfather', 'O Poderoso Chefão', 5, '175', 'Alta', 1, 7),
('Spirited Away', 'A Viagem de Chihiro', 5, '125', 'Alta', 1, 8),
('City of God', 'Cidade de Deus', 1, '130', 'Alta', 1, 6),
('Forrest Gump', 'Forrest Gump: O Contador de Histórias', 3, '142', 'Alta', 1, 7);

/* QUESTÃO 01 */
CREATE TABLE ATO_ator_novo (
    ato_cd_codigo INT IDENTITY PRIMARY KEY,
    ato_nm_ator VARCHAR(50) NOT NULL,
    ato_sx_ator CHAR(1) DEFAULT 'M' CHECK (ato_sx_ator IN ('F', 'M')),
    ato_dt_nascimento SMALLDATETIME NOT NULL,
    ato_rg_ator INT UNIQUE NOT NULL,
    ato_cd_pais_nacionalidade INT NOT NULL,
    CONSTRAINT fk_PAI_pais_novo FOREIGN KEY (ato_cd_pais_nacionalidade)
    REFERENCES PAI_pais (pai_cd_pais)
    ON UPDATE CASCADE
);

INSERT INTO ATO_ator_novo (ato_nm_ator, ato_sx_ator, ato_dt_nascimento, ato_rg_ator, ato_cd_pais_nacionalidade)
SELECT ato_nm_ator, ato_sx_ator, ato_dt_nascimento, ato_rg_ator, ato_cd_pais_nacionalidade
FROM ATO_ator
WHERE ato_sx_ator = 'M';

/* QUESTÃO 02 */
INSERT INTO ATO_ator_novo (ato_nm_ator, ato_sx_ator, ato_dt_nascimento, ato_rg_ator, ato_cd_pais_nacionalidade)
SELECT ato_nm_ator, ato_sx_ator, ato_dt_nascimento, ato_rg_ator, ato_cd_pais_nacionalidade
FROM ATO_ator
WHERE ato_sx_ator = 'F';

/* QUESTÃO 03 */
DELETE FROM ATO_ator
WHERE EXISTS (
    SELECT 1
    FROM ATO_ator_novo
    WHERE ATO_ator.ato_nm_ator = ATO_ator_novo.ato_nm_ator
);

/* QUESTÃO 04 */
SELECT 
    ATO.ato_nm_ator AS Nome_Ator, 
    PAI.pai_nm_pais AS Nacionalidade
FROM 
    ATO_ator ATO
INNER JOIN 
    PAI_pais PAI ON ATO.ato_cd_pais_nacionalidade = PAI.pai_cd_pais
ORDER BY 
    ATO.ato_nm_ator ASC;

SELECT 
    ATO.ato_nm_ator AS Nome_Ator, 
    PAI.pai_nm_pais AS Nacionalidade
FROM 
    ATO_ator ATO, PAI_pais PAI
WHERE 
    ATO.ato_cd_pais_nacionalidade = PAI.pai_cd_pais
ORDER BY 
    ATO.ato_nm_ator ASC;


/* QUESTÃO 05 */
SELECT DISTINCT ato_cd_pais_nacionalidade
FROM ATO_ator
ORDER BY ato_cd_pais_nacionalidade;

/* QUESTÃO 06 */
SELECT DISTINCT 
    ATO.ato_cd_pais_nacionalidade AS CODIGO,
    PAI.pai_nm_pais AS NACIONALIDADE
FROM 
    ATO_ator ATO
JOIN 
    PAI_pais PAI ON ATO.ato_cd_pais_nacionalidade = PAI.pai_cd_pais
ORDER BY 
    PAI.pai_nm_pais;

/* QUESTÃO 07 */
SELECT AVG(cin.cid_cp_lotacao) AS Media_Lotacao
FROM CIN_cinema cin
WHERE cin.cin_cidade = 1;

/* QUESTÃO 08 */
SELECT SUM(cin.cid_cp_lotacao) AS Total_Lotacao
FROM CIN_cinema cin
WHERE cin.cin_cidade = 1;

/* QUESTÃO 09 */
SELECT 
    cin_nm_fantasia AS Nome_Cinema,
    cid_cp_lotacao AS Capacidade_Lotacao
FROM 
    CIN_cinema
WHERE 
    cin_cidade = 1
    AND cid_cp_lotacao = (
        SELECT MAX(cid_cp_lotacao)
        FROM CIN_cinema
        WHERE cin_cidade = 1
    );

/* QUESTÃO 10 */
SELECT COUNT(*) AS Quantidade_Cinemas
FROM CIN_cinema
WHERE cin_cidade = 1;


/* QUESTÃO 11 */
SELECT 
    cin_nm_fantasia AS Nome_Cinema,
    cid_cp_lotacao AS Capacidade_Lotacao
FROM 
    CIN_cinema
WHERE 
    cin_cidade = 1
    AND cid_cp_lotacao = (
        SELECT MIN(cid_cp_lotacao)
        FROM CIN_cinema
        WHERE cin_cidade = 1
    );


/* QUESTÃO 12 */
SELECT 
    cin_nm_fantasia AS Nome_Fantasia,
    CONCAT(cin_dc_logradouro, ', ', cin_dc_complemento, ', ', cin_nu_numero, ', ', cin_dc_bairro) AS ENDEREÇO,
    cid_nm_cidade AS Nome_Cidade
FROM 
    CIN_cinema
JOIN 
    CID_cidade ON CIN_cinema.cin_cidade = CID_cidade.cid_cd_cidade
WHERE 
    cid_cp_lotacao > 200
ORDER BY 
    cin_nm_fantasia ASC;


/* QUESTÃO 13 */
SELECT 
    cin_nm_fantasia AS Nome_Cinema,
    cid_cp_lotacao AS Capacidade_Lotacao
FROM 
    CIN_cinema
WHERE 
    cid_cp_lotacao BETWEEN 200 AND 400
ORDER BY 
    cin_nm_fantasia;

/* QUESTÃO 14 */
SELECT 
    cin_nm_fantasia AS Nome_Cinema,
    cid_cp_lotacao AS Capacidade_Lotacao,
    (cid_cp_lotacao * 2) AS Capacidade_Dobrada
FROM 
    CIN_cinema
WHERE 
    cin_cidade = 1;

/* QUESTÃO 15 */
SELECT 
    FIL.fil_cd_filme AS Codigo,
    FIL.fil_tl_original AS Titulo_Original,
    FIL.fil_tl_portugues AS Titulo_Portugues,
    FIL.fil_cd_duracao AS Duracao,
    GEN.gen_dc_genero AS Nome_Genero
FROM 
    FIL_filme FIL
INNER JOIN 
    GEN_genero GEN ON FIL.fil_cd_genero = GEN.gen_cd_genero
WHERE 
    FIL.fil_tl_original LIKE 'A%' 
    AND FIL.fil_tl_portugues IS NOT NULL
    AND FIL.fil_cd_genero = 1
ORDER BY 
    FIL.fil_tl_original DESC;


/* QUESTÃO 16 */
SELECT 
    fil_tl_portugues AS Titulo_Portugues
FROM 
    FIL_filme
WHERE 
    UPPER(fil_tl_original) BETWEEN 'C' AND 'I%'
    AND fil_tl_portugues IS NOT NULL
ORDER BY 
    fil_tl_original;

/* QUESTÃO 17 */
SELECT 
    fil_tl_portugues AS Titulo_Portugues
FROM 
    FIL_filme
WHERE 
    UPPER(fil_tl_original) NOT BETWEEN 'C' AND 'H'
    AND fil_tl_portugues IS NOT NULL
ORDER BY 
    fil_tl_original;


/* QUESTÃO 18 */
SELECT 
    fil_tl_portugues AS Titulo_Portugues
FROM 
    FIL_filme
WHERE 
    UPPER(fil_tl_original) LIKE '__R%'
    AND fil_tl_portugues IS NOT NULL
ORDER BY 
    fil_tl_original;


/* QUESTÃO 19 */
SELECT ato_nm_ator AS Nome_Ator, ato_cd_pais_nacionalidade AS Codigo_Nacionalidade
FROM ATO_ator
UNION
SELECT ato_nm_ator AS Nome_Ator, ato_cd_pais_nacionalidade AS Codigo_Nacionalidade
FROM ATO_ator_novo
ORDER BY Nome_Ator;

SELECT ato_nm_ator AS Nome_Ator, ato_cd_pais_nacionalidade AS Codigo_Nacionalidade
FROM ATO_ator
UNION ALL
SELECT ato_nm_ator AS Nome_Ator, ato_cd_pais_nacionalidade AS Codigo_Nacionalidade
FROM ATO_ator_novo
ORDER BY Nome_Ator;

/* QUESTÃO 20 */
SELECT 
    ato_nm_ator AS Nome_Ator, 
    ato_cd_pais_nacionalidade AS Codigo_Nacionalidade
FROM 
    ATO_ator a
WHERE 
    NOT EXISTS (
        SELECT 1
        FROM ATO_ator_novo b
        WHERE b.ato_nm_ator = a.ato_nm_ator AND b.ato_cd_pais_nacionalidade = a.ato_cd_pais_nacionalidade
    )
ORDER BY 
    Nome_Ator;

/* QUESTÃO 21 */
SELECT ato_nm_ator AS Nome_Ator, ato_cd_pais_nacionalidade AS Codigo_Nacionalidade
FROM ATO_ator
INTERSECT
SELECT ato_nm_ator AS Nome_Ator, ato_cd_pais_nacionalidade AS Codigo_Nacionalidade
FROM ATO_ator_novo;

/* QUESTÃO 22 */
SELECT 
    PAI.pai_nm_pais AS Nacionalidade, 
    ATO.ato_sx_ator AS Sexo, 
    COUNT(*) AS total_atores
FROM 
    ATO_ator ATO
JOIN 
    PAI_pais PAI ON ATO.ato_cd_pais_nacionalidade = PAI.pai_cd_pais
GROUP BY 
    PAI.pai_nm_pais, ATO.ato_sx_ator
ORDER BY 
    PAI.pai_nm_pais ASC;

/* QUESTÃO 23 */
SELECT ato_nm_ator AS Nome_Ator, ato_sx_ator AS Sexo
FROM ATO_ator
WHERE ato_nm_ator IN (
    SELECT ato_nm_ator
    FROM ATO_ator_novo
)
AND ato_sx_ator IN (
    SELECT ato_sx_ator
    FROM ATO_ator_novo
);

SELECT ato_nm_ator AS Nome_Ator, ato_sx_ator AS Sexo
FROM ATO_ator a
WHERE EXISTS (
    SELECT 1
    FROM ATO_ator_novo b
    WHERE a.ato_nm_ator = b.ato_nm_ator AND a.ato_sx_ator = b.ato_sx_ator
);

/* QUESTÃO 24 */
SELECT ato_nm_ator AS Nome_Ator, ato_sx_ator AS Sexo
FROM ATO_ator
WHERE ato_nm_ator NOT IN (
    SELECT ato_nm_ator
    FROM ATO_ator_novo
)
OR ato_sx_ator NOT IN (
    SELECT ato_sx_ator
    FROM ATO_ator_novo
);

SELECT ato_nm_ator AS Nome_Ator, ato_sx_ator AS Sexo
FROM ATO_ator a
WHERE NOT EXISTS (
    SELECT 1
    FROM ATO_ator_novo b
    WHERE a.ato_nm_ator = b.ato_nm_ator AND a.ato_sx_ator = b.ato_sx_ator
);

/* QUESTÃO 25 */
SELECT 
    cin_nm_fantasia AS Nome_Fantasia,
    cid_cp_lotacao AS Capacidade_Lotacao
FROM 
    CIN_cinema
WHERE 
    cid_cp_lotacao < (SELECT AVG(cid_cp_lotacao) FROM CIN_cinema);
