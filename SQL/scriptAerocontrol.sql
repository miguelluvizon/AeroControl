DROP DATABASE IF EXISTS aeroControl;
CREATE DATABASE aeroControl;
USE aeroControl;

Create table Aeroporto (
idAeroporto int primary key auto_increment,
nome varchar(40),
CEP char(9)
);

Create table Usuario (
idUsuario int primary key auto_increment,
nome varchar(100),
email varchar(320),
senha varchar(30),
cpf char(11),
cargo varchar(17),
fkAeroporto int,
constraint foreign key (fkAeroporto) references Aeroporto(idAeroporto)
);

Create table Computador (
idComputador int primary key,
hostname varchar(100),
processador varchar(100),
memoria decimal(5,2),
setor varchar(100),
fkAeroporto int,
constraint foreign key (fkAeroporto) references Aeroporto(idAeroporto)
);

Create table DadoComputador (
idDado int primary key auto_increment,
horaDado datetime default CURRENT_TIMESTAMP,
cpuPorcentagem decimal(5,2),
memoriaPorcentagem decimal(5,2),
memoriaGB decimal(5,2),
fkComputador int,
constraint foreign key (fkComputador) references Computador(idComputador)
);

INSERT INTO Aeroporto VALUES
	(default, 'Congonhas', '3641-001'), 
	(default, 'Guarulhos', '5437-002'),
	(default, 'Viracopos', '0142-003');
    
INSERT INTO Usuario VALUES
	(default , 'Matheus Requena' , 'matheus@gmail.com' , '1234321' , '12345678901' , 'Analista de Dados' , 1),
	(default , 'Arthur Herculano' , 'arthur@gmail.com' , '1223334' , '83526735482' , 'Suporte de T.I.' , 3),
	(default , 'Ricken Scharlack' , 'ricken@gmail.com' , 'rick#Sp' , '92653478291' , 'Suporte de T.I.' , 2),
	(default , 'Miguel Luvizon' , 'miguel@gmail.com' , '123M!guel' , '64281964382' , 'Analista de Dados' , 3),
	(default , 'Murilo Martinez' , 'murilo@gmail.com' , 'murilo123' , '25107632415' , 'Analista de Dados' , 2);

INSERT INTO Computador VALUES
	(default, 'Comp1Com', 'i5-9300', '8GB', 'Comunicação com Pilotos', 1),
	(default, 'Comp2Desp', 'i5-9300', '8GB', 'Despache', 3),
	(default, 'Comp2Desp', 'i5-9300', '8GB', 'Despache', 3),
	(default, 'Comp1Com', 'i5-9300', '16GB', 'Comunicação com Pilotos', 3),
	(default, 'Comp1Com', 'i5-9300', '16GB', 'Comunicação com Pilotos', 2),
	(default, 'Comp2Com', 'i5-9300', '8GB', 'Comunicação com Pilotos', 1),
	(default, 'Comp2Com', 'i5-9300', '16GB', 'Comunicação com Pilotos', 2);
    
	SELECT * FROM Aeroporto;    
	SELECT * FROM Usuario;  
	SELECT * FROM Computador;
    SELECT * FROM DadoComputador;