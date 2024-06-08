CREATE DATABASE LIVRARIA;

USE LIVRARIA;

CREATE TABLE LIVROS(
	NOME_LIVRO VARCHAR(25),
	NOME_AUTOR VARCHAR(25),
	SEXO_AUTOR VARCHAR(11),
	NUMERO_PAGINAS INT(3),
	NOME_EDITORA VARCHAR(25),
	VALOR_LIVRO FLOAT(4),
	UF CHAR(2),
	ANO_PUBLICACAO INT(4)
);

INSERT INTO LIVROS VALUES 
('Cavaleiro Real', 'Ana Claudia', 'Feminino', 465, 'Atlas', 49.9, 'RJ', 2009),
('SQL para leigos', 'João Nunes', 'Masculino', 450, 'Addison', 98, 'SP', 2018),
('Receitas Caseiras', 'Celia Tavares', 'Feminino', 210, 'Atlas', 45, 'RJ', 2008),
('Pessoas Efetivas', 'Eduardo Santos', 'Masculino', 390, 'Beta', 78.99, 'RJ', 2018),
('Habitos Saudáveis', 'Eduardo Santos', 'Masculino', 630, 'Beta', 150.98, 'RJ', 2019),
('A Casa Marrom', 'Hermes Macedo', 'Masculino', 250, 'Bubba', 60, 'MG', 2016),
('Estacio Querido', 'Geraldo Francisco', 'Masculino', 310, 'Insignia', 100, 'ES', 2015),
('Pra sempre amigas', 'Leda Silva', 'Feminino', 510, 'Insignia', 78.98, 'ES', 2011),
('Copas Inesqueciveis', 'Marco Alcantara', 'Masculino', 200, 'Larson', 130.98, 'RS', 2018),
('O poder da mente', 'Clara Mafra', 'Feminino', 120, 'Continental', 56.58, 'SP', 2017);

/* 1 - TRAZER TODOS OS DADOS*/
SELECT * FROM LIVROS;

/* 2 - TRAZER O NOME DO LIVRO E O NOME DA EDITORA*/
SELECT NOME_LIVRO, NOME_EDITORA FROM LIVROS;

/* 3 - TRAZER O NOME DO LIVRO E A UF DOS LIVROS PUBLICADOS POR AUTORES DO SEXO MASCULINO */
SELECT NOME_LIVRO, UF FROM LIVROS WHERE SEXO_AUTOR = 'Masculino';

/* 4 - TRAZER O NOME DO LIVRO E O NÚMERO DE PÁGINAS DOS LIVROS PUBLICADOS POR AUTORES DO SEXO FEMININO*/
SELECT NOME_LIVRO, NUMERO_PAGINAS FROM LIVROS WHERE SEXO_AUTOR = 'Feminino';

/* 5 - TRAZER OS VALORES DOS LIVROS DAS EDITORAS DE SÃO PAULO */
SELECT VALOR_LIVRO FROM LIVROS WHERE UF = 'SP';

/* 6 - TRAZER OS DADOS DOSO AUTORES DO SEXO MASCULINO QUE TIVERAM LIVROS PUBLICADOS POR SAO PAULO OU RIO DE JANEIRO */
SELECT NOME_AUTOR, SEXO_AUTOR FROM LIVROS WHERE SEXO_AUTOR = 'Masculino' and (UF = 'SP' || UF = 'RJ');