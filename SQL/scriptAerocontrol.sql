CREATE DATABASE IF NOT EXISTS aeroControl;
USE aeroControl;

CREATE TABLE Aeroporto (
cnpj char(14) primary key,
nomeAeroporto varchar(14),
codigoIATA char(3),
codigoICAO char(4),
cep char(9)
);

CREATE TABLE Usuario (
cpf char(11) primary key,
nomeUsuario varchar(40),
email varchar(320),
senha varchar(30),
cargo varchar(17),
fkAeroporto char(14),
constraint fkAeroportoUsuario foreign key (fkAeroporto) references Aeroporto(cnpj)
);

CREATE TABLE Setor(
idSetor int primary key auto_increment,
nomeSetor varchar(100),
fkAeroporto char(14),
constraint foreign key (fkAeroporto) references Aeroporto(cnpj)
);


CREATE TABLE Computador (
idComputador int primary key auto_increment,
hostname varchar(100),
processador varchar(100),
ramMax varchar(100),
fkUsuario char(11),
fkAeroporto char(14),
fkSetor int,
constraint fkUsuarioComputador foreign key (fkUsuario) references Usuario(cpf),
constraint fkAeroportoComputador foreign key (fkAeroporto) references Aeroporto(cnpj),
constraint fkSetorComputador foreign key (fkSetor) references Setor(idSetor)
);

CREATE TABLE DadoComputador (
idDado int primary key auto_increment,
horaDado datetime default CURRENT_TIMESTAMP,
cpuPorcentagem decimal(5,2),
memoriaPorcentagem decimal(5,2),
memoriaGB decimal(5,2),
fkComputador int,
constraint fkDadoComputador foreign key (fkComputador) references Computador(idComputador)
);

CREATE TABLE Alerta (
idAlerta int primary key auto_increment,
dataAlerta datetime default current_timestamp,
fkDadoComputador int,
constraint fkAlertaDado foreign key (fkDadoComputador) references DadoComputador (idDado)
);

INSERT INTO Aeroporto VALUES
	('12345678901234', 'Congonhas', 'CGH', 'SBSP', '3641-001'), 
	('43210987654321', 'Guarulhos', 'GRU', 'SBGR', '5437-002'),
	('11223344556677', 'Viracopos', 'VCP', 'SBKP', '0142-003');
    
INSERT INTO Usuario VALUES
	('12345678901' , 'Matheus Requena' , 'matheus@gmail.com' , '1234321', 'Analista de Dados' , '12345678901234'),
	('83526735482' , 'Arthur Herculano' , 'arthur@gmail.com' , '1223334', 'Suporte de T.I.' , '11223344556677'),
	('92653478291' , 'Ricken Scharlack' , 'ricken@gmail.com' , 'rick#Sp', 'Suporte de T.I.' , '43210987654321'),
	('64281964382' , 'Miguel Luvizon' , 'miguel@gmail.com' , '123M!guel', 'Analista de Dados' , '11223344556677'),
	('25107632415' , 'Murilo Martinez' , 'murilo@gmail.com' , 'murilo123', 'Analista de Dados' , '43210987654321');

INSERT INTO Setor VALUES
	(1, 'Despache de Voo','11223344556677'),
	(2, 'Despache de Voo','43210987654321'),
	(3, 'Torre de Controle', '11223344556677'),
	(4, 'Despache de Voo', '12345678901234'),
	(5, 'Torre de Controle', '12345678901234'),
	(6, 'Centro de Meteorologia', '43210987654321'),
	(7, 'Centro de Meteorologia', '11223344556677'),
	(8, 'Torre de Controle', '43210987654321'),
	(9, 'Centro de Meteorologia', '12345678901234');

INSERT INTO Computador VALUES
	(1, 'C1DP', 'i3', '8' ,'12345678901','11223344556677', 1);
    
SELECT * FROM Aeroporto;
SELECT * FROM Setor;    
SELECT * FROM Usuario;  
SELECT * FROM Computador;
SELECT * FROM DadoComputador;
SELECT * FROM Alerta;

SELECT cnpj, nomeAeroporto FROM Aeroporto ORDER BY nomeAeroporto;