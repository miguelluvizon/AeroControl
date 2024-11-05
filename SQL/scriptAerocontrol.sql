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
	(1, '11223344556677', 'Despache de Voo'),
	(1, '43210987654321', 'Despache de Voo'),
	(2, '11223344556677', 'Torre de Controle'),
	(1, '12345678901234', 'Despache de Voo'),
	(2, '12345678901234', 'Torre de Controle'),
	(3, '43210987654321', 'Centro de Meteorologia'),
	(3, '11223344556677', 'Centro de Meteorologia'),
	(2, '43210987654321', 'Torre de Controle'),
	(3, '12345678901234', 'Centro de Meteorologia');

INSERT INTO Computador VALUES
	(1, '12345678901234', '1', 'C1DP', 'i3', '8', 1),
	(1, '12345678901234', '2', 'C1CN', 'i3', '8', 3),
	(2, '12345678901234', '2', 'C2CN', 'i3', '8', 3),
	(1, '11223344556677', '1', 'CO1D', 'i5', '16', 3),
	(2, '11223344556677', '1', 'CO2D', 'i5', '16', 2),
	(3, '12345678901234', '2', 'C3CN', 'i3', '8', 1),
	(3, '11223344556677', '1', 'CO3D', 'i5', '8', 1),
	(4, '11223344556677', '1', 'CO4D', 'i5', '8', 1),
	(2, '12345678901234', '1', 'C2DP', 'i3', '8', 1),
	(1, '11223344556677', '2', 'CO1C', 'i5', '8', 1),
	(1, '43210987654321', '1', 'GCD1', 'i9', '8', 1),
	(2, '43210987654321', '1', 'GCD2', 'i9', '8', 1),
	(3, '43210987654321', '1', 'GCD3', 'i9', '8', 1),
	(1, '43210987654321', '2', 'GCC1', 'i9', '8', 1),
	(2, '43210987654321', '2', 'GCC2', 'i9', '8', 1),
	(3, '43210987654321', '2', 'GCC3', 'i9', '8', 1),
	(2, '11223344556677', '2', 'CO2C', 'i5', '8', 1),
	(3, '12345678901234', '1', 'C3DP', 'i3', '16', 2),
	(4, '12345678901234', '1', 'C4DP', 'i3', '16', 2),
	(1, '43210987654321', '3', 'GCM1', 'i9', '16', 2),
	(1, '12345678901234', '3', 'C1MT', 'i3', '16', 2),
	(2, '12345678901234', '3', 'C2MT', 'i3', '16', 2),
	(3, '12345678901234', '3', 'C3MT', 'i3', '16', 2),
	(4, '12345678901234', '3', 'C4MT', 'i3', '16', 2),
	(2, '43210987654321', '3', 'GCM2', 'i9', '16', 2),
	(3, '43210987654321', '3', 'GCM3', 'i9', '16', 2),
	(4, '43210987654321', '3', 'GCM4', 'i9', '16', 2),
	(3, '11223344556677', '2', 'CO3C', 'i5', '16', 2),
	(1, '11223344556677', '3', 'CO1M', 'i5', '16', 2),
	(2, '11223344556677', '3', 'CO2M', 'i5', '16', 2),
	(3, '11223344556677', '3', 'CO3M', 'i5', '16', 2),
	(4, '11223344556677', '3', 'CO4M', 'i5', '16', 2);
    
SELECT * FROM Aeroporto;
SELECT * FROM Setor;    
SELECT * FROM Usuario;  
SELECT * FROM Computador;
SELECT * FROM DadoComputador;
SELECT * FROM Alerta;

INSERT INTO Aeroporto VALUES
	(1, 'Congonhas', '3641-001', 1);

INSERT INTO Computador VALUES
	(2, 'nb-martinez', 'i5-1334', '16GB', '1TB', 'Comunicação com Pilotos', 1);
    
SELECT * FROM DadoComputador;
    
SELECT * FROM Aeroporto;

SELECT * FROM usuario;
SELECT * FROM Aeroporto;    
SELECT * FROM Usuario;  
SELECT * FROM Computador;
SELECT * FROM DadoComputador;

