DROP database aeroControl;
CREATE DATABASE IF NOT EXISTS aeroControl;
USE aeroControl;

CREATE TABLE Aeroporto (
<<<<<<< HEAD
cnpj char(14) primary key,
nomeAeroporto varchar(14),
codigoIATA char(3),
codigoICAO char(4),
cep char(9)
);

CREATE TABLE Usuario (
cpf char(11) primary key,
=======
idAeroporto int primary key auto_increment,
<<<<<<< HEAD
nome varchar(40),
CEP char(9),
numero int
=======
nomeAeroporto varchar(100),
CEP char(9)
>>>>>>> a00c04ebede9955785d93c0e9697a22100c7d99b
);

CREATE TABLE Usuario (
idUsuario int primary key auto_increment,
<<<<<<< HEAD
nome varchar(40),
dataNasc DATE,
cpf char(11),
=======
>>>>>>> a10d91ab6dca5821860c379a88076dee9f9c0ec1
nomeUsuario varchar(100),
email varchar(320),
>>>>>>> a00c04ebede9955785d93c0e9697a22100c7d99b
senha varchar(30),
<<<<<<< HEAD
cargo varchar(17),
fkAeroporto char(14)
);

CREATE TABLE Setor(
idSetor int,
fkAeroporto char(14),
primary key (idSetor, fkAeroporto),

nomeSetor varchar(100)
=======
cargo varchar(40),
fkAeroporto int,
constraint foreign key (fkAeroporto) references Aeroporto(idAeroporto)
>>>>>>> a10d91ab6dca5821860c379a88076dee9f9c0ec1
);

<<<<<<< HEAD
Create table Computador (
idComputador int primary key,
hostname varchar(45),
processador varchar(45),
memoria varchar(5),
armazenamento varchar(6),
setor varchar(45),
=======
CREATE TABLE Computador (
idComputador int auto_increment,
fkAeroporto char(14),
fkSetor int,
primary key(idComputador, fkAeroporto, fkSetor),

hostname varchar(100),
processador varchar(100),
<<<<<<< HEAD
ramMax decimal(5 , 2),
fkUsuario char(11)
);

CREATE TABLE DadoComputador (
idDado int,
idComputador int,
fkAeroporto char(14),
fkSetor int,
primary key(idDado, idComputador, fkAeroporto, fkSetor),

horaDado datetime default current_timestamp,
cpuPorcentagem decimal(5 , 2),
ramPorcentagem decimal(5 , 2),
ramBytes decimal(5 , 2)
);

CREATE TABLE Alerta (
idAlerta int auto_increment,
idDado int,
idComputador int,
fkAeroporto char(14),
fkSetor int,
primary key(idAlerta, idDado, idComputador, fkAeroporto, fkSetor),

dataAlerta datetime default current_timestamp
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
=======
memoria decimal(5,2),
setor varchar(100),
>>>>>>> a00c04ebede9955785d93c0e9697a22100c7d99b
fkAeroporto int,
constraint foreign key (fkUsuario) references Usuario(idAeroporto)
);

CREATE TABLE DadoComputador (
idDado int primary key auto_increment,
horaDado datetime default CURRENT_TIMESTAMP,
cpuPorcentagem decimal(5,2),
memoriaPorcentagem decimal(5,2),
memoriaGB int,
fkComputador int,
constraint foreign key (fkComputador) references Computador(idComputador)
);

INSERT INTO Aeroporto VALUES
	(1, 'Congonhas', '3641-001', 1);

INSERT INTO Computador VALUES
	(2, 'nb-martinez', 'i5-1334', '16GB', '1TB', 'Comunicação com Pilotos', 1);
    
<<<<<<< HEAD
    SELECT * FROM DadoComputador;
    
SELECT * FROM Aeroporto;

SELECT * FROM usuario;
=======
SELECT * FROM Aeroporto;    
SELECT * FROM Usuario;  
SELECT * FROM Computador;
SELECT * FROM DadoComputador;
>>>>>>> a00c04ebede9955785d93c0e9697a22100c7d99b
>>>>>>> a10d91ab6dca5821860c379a88076dee9f9c0ec1
