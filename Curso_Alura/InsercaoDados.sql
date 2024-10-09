INSERT INTO [TABELA DE PRODUTOS] VALUES (

	'1040107',
	'Light - 350ml - Melancia',
	'Lata',
	'350ml',
	'Melancia',
	4.56

);

INSERT INTO [TABELA DE PRODUTOS] VALUES 
('1040108', 'Clean - 2L - Laranja', 'PET', '2 Litros', 'Laranja', 10.56),
('104109', 'Sabor da Montanha - 700ml - Uva', 'Garrafa', '700ml','Uva', 6.31),
('104110', 'Videira do Campo - 1,5 Litros - Melancia', 'PET', '1,5 Litros', 'Melancia', 8.00),
('104111', 'Linha Citros - 1 Litro - Limão', 'PET', '1 Litro', 'Limão', 7.00);

INSERT INTO [TABELA DE CLIENTES] VALUES
('00300425530', 'Thalles', 'Nova', 'Onde o vento faz a curva', 'Califórnia', 'Ba', '45600000', '1965-03-21', 57, 'M', 200000, 3000.30, 1),
('00100333530', 'Taisy', 'Nova', 'Onde o vento faz a curva', 'Califórnia', 'Ba', '45600000', '1965-03-21', 57, 'M', 200000, 3000.30, 0);

INSERT INTO [TABELA DE VENDEDORES] VALUES 
('00236', 'Cláudia Morais', 8),
('00237', 'Marcela Ferreira', 9),
('00238', 'Márcio Almeida', 8);

INSERT INTO [TABELA DE PRODUTOS]
(CODIGO_PRODUTO, NOME, EMBALAGEM, TAMANHO, PRECO_LISTA, SABOR)
VALUES 
('1240108', 'Clean - 2L - Laranja', 'PET', '2 Litros', 10.56, 'Laranja');

INSERT INTO [TABELA DE CLIENTES]
(CPF, NOME, RUA, COMPLEMENTO, BAIRRO, ESTADO, CEP, DATA_NASCIMENTO, IDADE, SEXO, LIMITE_CREDITO, VOLUME_MINIMO, PRIMEIRA_COMPRA)
VALUES
('1471156710', 'Erica Carvalho', 'R. Iriquitia', '', 'Jardins', 'SP', '80012212', '1990-09-01', 32, 'F', 1700000000, 24500, 0),
('19290992743', 'Fernando Cavalcante', 'R. Dois de Fevereiro','', 'Agua Santa', 'RJ', '22000000', '2000-02-12', 23, 'M', 1000000000, 20000, 1),
('2600586709', 'Cesar Teixeira', 'Rua Conde de Bonfim','', 'Tijuca', 'RJ', '22020001', '2000-03-12', 23, 'M', 1200000000, 22000, 0),
('3623344710', 'Marcos Nogueira', 'Av. Pastor Martin Luther King Junior','', 'Inhauma', 'RJ', '22002012', '1995-01-13', 28, 'M', 1100000000, 22000, 1),
('492472718', 'Eduardo Jorge', 'R. Volta Grande','', 'Tijuca', 'RJ', '22012002', '1994-07-19', 28, 'M', 750000000, 9500, 1),
('50534475787', 'Abel Silva', 'Rua Humaita','', 'Humaita', 'RJ', '22000212', '1995-09-11', 27, 'M', 1700000000, 26000, 0),
('5576228758', 'Petra Oliveira', 'R. Benicio de Abreu','', 'Lapa', 'SP', '88192029', '1995-11-14', 27, 'F', 700000000, 16000, 1);
