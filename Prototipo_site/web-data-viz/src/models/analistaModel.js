var database = require("../database/config");

function estadoMaquinas() {
    var instrucao = ` SELECT (SELECT count(*) FROM Alerta WHERE tipo = "crítico" AND dataAlerta BETWEEN DATE_SUB(NOW(), INTERVAL 7 DAY) AND NOW()) as AlertasTotais,
(SELECT count(*) FROM Alerta Where tipo = "atenção" AND dataAlerta BETWEEN DATE_SUB(NOW(), INTERVAL 7 DAY) AND NOW()) as AtencaoTotais,
(SELECT count(*) FROM DadoComputador WHERE week(horaDado) = week(curdate())) as DadosTotais;
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function estadoSetor() {
    var instrucao = `
SELECT
    (SELECT count(*)
     FROM Computador
     JOIN DadoComputador ON fkComputador = idComputador
     JOIN Alerta ON fkDadoComputador = idDado
     WHERE tipo = "atenção" AND fkSetor = 1
		AND dataAlerta BETWEEN DATE_SUB(NOW(), INTERVAL 7 DAY) AND NOW()) AS AtencaoSetor1,

    (SELECT count(*)
     FROM Computador
     JOIN DadoComputador ON fkComputador = idComputador
     JOIN Alerta ON fkDadoComputador = idDado
     WHERE tipo = "crítico" AND fkSetor = 1
		AND dataAlerta BETWEEN DATE_SUB(NOW(), INTERVAL 7 DAY) AND NOW()) AS CriticoSetor1,

(SELECT count(*)
     FROM Computador
     JOIN DadoComputador ON fkComputador = idComputador
     JOIN Alerta ON fkDadoComputador = idDado
     WHERE tipo = "atenção" AND fkSetor = 2
		AND dataAlerta BETWEEN DATE_SUB(NOW(), INTERVAL 7 DAY) AND NOW()) AS AtencaoSetor2,

    (SELECT count(*)
     FROM Computador
     JOIN DadoComputador ON fkComputador = idComputador
     JOIN Alerta ON fkDadoComputador = idDado
     WHERE tipo = "crítico" AND fkSetor = 2
		AND dataAlerta BETWEEN DATE_SUB(NOW(), INTERVAL 7 DAY) AND NOW()) AS CriticoSetor2,

(SELECT count(*)
     FROM Computador
     JOIN DadoComputador ON fkComputador = idComputador
     JOIN Alerta ON fkDadoComputador = idDado
     WHERE tipo = "atenção" AND fkSetor = 3
		AND dataAlerta BETWEEN DATE_SUB(NOW(), INTERVAL 7 DAY) AND NOW()) AS AtencaoSetor3,

    (SELECT count(*)
     FROM Computador
     JOIN DadoComputador ON fkComputador = idComputador
     JOIN Alerta ON fkDadoComputador = idDado
     WHERE tipo = "crítico" AND fkSetor = 3
		AND dataAlerta BETWEEN DATE_SUB(NOW(), INTERVAL 7 DAY) AND NOW()) AS CriticoSetor3,

	(SELECT count(DISTINCT idComputador)
     FROM Computador
     WHERE fkSetor = 1) AS MaquinasTotaisSetor1,

    (SELECT count(DISTINCT idComputador)
     FROM Computador
     WHERE fkSetor = 2) AS MaquinasTotaisSetor2,

    (SELECT count(DISTINCT idComputador)
     FROM Computador
     WHERE fkSetor = 3) AS MaquinasTotaisSetor3;`
    
     console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

module.exports = {
    estadoMaquinas,
    estadoSetor
};
