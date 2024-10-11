DROP database aeroControl;
CREATE DATABASE IF NOT EXISTS aeroControl;
USE aeroControl;

CREATE TABLE Aeroporto (
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
nomeUsuario varchar(100),
email varchar(320),
>>>>>>> a00c04ebede9955785d93c0e9697a22100c7d99b
senha varchar(30),
cargo varchar(40),
fkAeroporto int,
constraint foreign key (fkAeroporto) references Aeroporto(idAeroporto)
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
idComputador int primary key auto_increment,
hostname varchar(100),
processador varchar(100),
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
