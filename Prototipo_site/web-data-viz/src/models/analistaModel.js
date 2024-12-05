var database = require("../database/config");

function estadoMaquinas() {
    var instrucao = `
SELECT (SELECT count(*) FROM Alerta WHERE tipo = "alerta" AND week(dataAlerta) = week(curdate())) as AlertasTotais,
(SELECT count(*) FROM Alerta Where tipo = "atenção" AND week(dataAlerta) = week(curdate())) as AtencaoTotais,
(SELECT count(*) FROM DadoComputador WHERE week(horaDado) = week(curdate())) as DadosTotais;
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function estadoSetor() {
    var instrucao = `
SELECT (SELECT count(*) FROM Alerta 
JOIN DadoComputador ON fkDadoComputador = idDado JOIN Computador ON fkComputador = idComputador WHERE fkSetor = 1 AND tipo = "alerta" AND week(dataAlerta) = week(curdate())) as AlertasTotaisSetor1,
(SELECT count(*) FROM Alerta 
JOIN DadoComputador ON fkDadoComputador = idDado JOIN Computador ON fkComputador = idComputador WHERE fkSetor = 1 AND tipo = "atenção" AND week(dataAlerta) = week(curdate())) as AtencaoTotaisSetor1,
(SELECT count(*) FROM DadoComputador 
JOIN Computador ON fkComputador = idComputador WHERE fkSetor = 1 AND week(horaDado) = week(curdate())) as DadosTotaisSetor1,
(SELECT count(*) FROM Alerta 
JOIN DadoComputador ON fkDadoComputador = idDado JOIN Computador ON fkComputador = idComputador WHERE fkSetor = 2 AND tipo = "alerta" AND week(dataAlerta) = week(curdate())) as AlertasTotaisSetor2,
(SELECT count(*) FROM Alerta 
JOIN DadoComputador ON fkDadoComputador = idDado JOIN Computador ON fkComputador = idComputador WHERE fkSetor = 2 AND tipo = "atenção" AND week(dataAlerta) = week(curdate())) as AtencaoTotaisSetor2,
(SELECT count(*) FROM DadoComputador 
JOIN Computador ON fkComputador = idComputador WHERE fkSetor = 2 AND week(horaDado) = week(curdate())) as DadosTotaisSetor2,
(SELECT count(*) FROM Alerta 
JOIN DadoComputador ON fkDadoComputador = idDado JOIN Computador ON fkComputador = idComputador WHERE fkSetor = 3 AND tipo = "alerta" AND week(dataAlerta) = week(curdate())) as AlertasTotaisSetor3,
(SELECT count(*) FROM Alerta 
JOIN DadoComputador ON fkDadoComputador = idDado JOIN Computador ON fkComputador = idComputador WHERE fkSetor = 3 AND tipo = "atenção" AND week(dataAlerta) = week(curdate())) as AtencaoTotaisSetor3,
(SELECT count(*) FROM DadoComputador 
JOIN Computador ON fkComputador = idComputador WHERE fkSetor = 3 AND week(horaDado) = week(curdate())) as DadosTotaisSetor3;
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

module.exports = {
    estadoMaquinas,
    estadoSetor
};
