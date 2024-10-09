CREATE DATABASE PIZZARIA;
USE PIZZARIA;

-- drop database pizzaria;

CREATE TABLE Tamanho(
    tamanhoId int primary key not null auto_increment,
    nome varchar(20),
    desconto float
);

CREATE TABLE Ingrediente(
    ingredienteId int primary key not null auto_increment,
    nome varchar(20),
    preco float
);

CREATE TABLE Pizza(
    pizzaId int primary key not null auto_increment,
    sabor varchar(20),
    precoBase float,
    isPersonalizada bool
);

CREATE TABLE Fornada(
    fornadaId int primary key not null auto_increment,
    numFornada int,
    qtdPizzas int
);

CREATE TABLE Bebida(
    bebidaId int primary key not null auto_increment,
    nome varchar(20),
    preco float
);

CREATE TABLE Cliente(
    clienteId int primary key not null auto_increment,
    nome varchar(100),
    telefone varchar(100),
    endereco varchar(100),
    login varchar(30),
    senha varchar(30)
);

CREATE TABLE Pedido(
    pedidoId int primary key not null auto_increment,
    clienteIdFk int not null,
    fornadaIdFk int not null,
    dataHora timestamp,
    foreign key(clienteIdFk) references Cliente(clienteId),
    foreign key(fornadaIdFk) references Fornada(fornadaId)
);

CREATE TABLE BebidaPedida(
	bebidaPedida int primary key not null auto_increment,
    pedidoIdFk int not null,
    bebidaIdFk int not null,
    quantidade int,
    foreign key(bebidaIdFk) references Bebida(bebidaId),
    foreign key(pedidoIdFk) references Pedido(pedidoId)
);

CREATE TABLE PizzaPedida(
    pizzaPedidaId int primary key not null auto_increment,
    pedidoIdFk int not null,
    pizzaIdFk int not null,
    tamanhoIdFk int not null,
    foreign key(pedidoIdFk) references Pedido(pedidoId),
    foreign key(pizzaIdFk) references Pizza(pizzaId),
    foreign key(tamanhoIdFk) references Tamanho(tamanhoId)
);

CREATE TABLE PizzaPedida_has_Ingrediente(
	pizzaPedida_has_IngredienteId int primary key not null auto_increment,
    pizzaPedidaIdFk int not null,
    ingredienteIdFk int not null,
    foreign key(pizzaPedidaIdFk) references PizzaPedida(pizzaPedidaId),
    foreign key(ingredienteIdFk) references Ingrediente(ingredienteId)
);

-- Inserindo dados na tabela Tamanho
INSERT INTO Tamanho (nome, desconto) VALUES 
('Pequena', 0.0), 
('Média', 0.1), 
('Grande', 0.2);

-- Inserindo dados na tabela Ingrediente
INSERT INTO Ingrediente (nome, preco) VALUES 
('Queijo', 3.0), 
('Presunto', 2.5), 
('Tomate', 1.5), 
('Azeitona', 1.0);

-- Inserindo dados na tabela Pizza
INSERT INTO Pizza (sabor, precoBase, isPersonalizada) VALUES 
('Margherita', 15.0, false), 
('Calabresa', 18.0, false), 
('Quatro Queijos', 20.0, false), 
('Personalizada', 0.0, true);

-- Inserindo dados na tabela Fornada
INSERT INTO Fornada (numFornada, qtdPizzas) VALUES 
(1, 10), 
(2, 15), 
(3, 20);

-- Inserindo dados na tabela Bebida
INSERT INTO Bebida (nome, preco) VALUES 
('Coca-Cola', 5.0), 
('Guaraná', 4.5), 
('Água', 2.0);

-- Inserindo dados na tabela Cliente
INSERT INTO Cliente (nome, telefone, endereco, login, senha) VALUES 
('João Silva', '111111111', 'Rua A, 123', 'joao', '1234'), 
('Maria Souza', '222222222', 'Rua B, 456', 'maria', '5678');

-- Inserindo dados na tabela Pedido
INSERT INTO Pedido (clienteIdFk, fornadaIdFk, dataHora) VALUES 
(1, 1, NOW()), 
(2, 2, NOW());

-- Inserindo dados na tabela BebidaPedida
INSERT INTO BebidaPedida (pedidoIdFk, bebidaIdFk, quantidade) VALUES 
(1, 1, 2), 
(1, 2, 1), 
(2, 3, 3);

-- Inserindo dados na tabela PizzaPedida
INSERT INTO PizzaPedida (pedidoIdFk, pizzaIdFk, tamanhoIdFk) VALUES 
(1, 1, 2), 
(1, 3, 3), 
(2, 2, 1);

-- Inserindo dados na tabela PizzaPedida_has_Ingrediente
INSERT INTO PizzaPedida_has_Ingrediente (pizzaPedidaIdFk, ingredienteIdFk) VALUES 
(1, 1), 
(1, 3), 
(2, 2), 
(2, 4), 
(3, 1), 
(3, 2), 
(3, 3), 
(3, 4);