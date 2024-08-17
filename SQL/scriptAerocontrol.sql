CREATE DATABASE aeroControl;
USE aeroControl;

Create table Aeroporto (
idAeroporto int primary key auto_increment,
nome varchar(50),
CEP varchar(50),
numero int
);

Create table Usuario (
idUsuario int primary key auto_increment,
nome varchar(40),
cpf char(11),
senha varchar(30),
cargo varchar(40),
fkAeroporto int,
constraint foreign key (fkAeroporto) references Aeroporto(idAeroporto)
);

Create table Computador (
idComputador int primary key,
processador varchar(45),
memoria varchar(5),
armazenamento varchar(6),
localComputador varchar(50),
fkAeroporto int,
constraint foreign key (fkAeroporto) references Aeroporto(idAeroporto)
);

Create table DadoComputador (
idDado int primary key auto_increment,
horaDado datetime,
atvCpu decimal(5,2),
atvMemoria decimal(5,2),
atvArmazenamento decimal(5,2),
fkComputador int,
constraint foreign key (fkComputador) references Aeroporto(idAeroporto)
);