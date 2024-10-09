create table Cargo(int cod PRIMARY KEY);


CREATE TABLE Empregado(
	codigo int identity,
	nome VARCHAR(45) not NULL,
	sexo char(1) default 'F',
	RG int unique not NULL,
	cpf int unique not NULL,
	datanasc smalldatetime not null,
	codcargo int,
	telefone VARCHAR(10),
	dataatualizacao smalldatetime default getdate(),
	PRIMARY KEY (codigo),
	FOREIGN KEY (codcargo) REFERENCES Cargo on delete set null on update cascade,
	CHECK(sexo, in ('F', 'M'))

);

/*drop table Empregado;*/

ALTER TABLE Cargo ADD sigla char(5);

ALTER TABLE Cargo Alter COLUMN sigla VARCHAR(10);

ALTER TABLE Cargo Drop COLUMN sigla;

Alter table cargo add smb char(1);

Alter table cargo add CONSTRAINT simbolo CHECK(smb in ('A', 'B', 'C'));

create table Funcao(

	codigo int not null,
	nome VARCHAR(40) not null


);


Alter table Funcao add constraint pk_codigo PRIMARY KEY (codigo);

Alter table Empregado add cod_funcao int;

Alter table Empregado add constraint cod_funcao FOREIGN KEY cod_funcao REFERENCES Funcao(codigo);