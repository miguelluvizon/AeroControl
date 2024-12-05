
var database = require("../database/config");

function buscarUltimasMedidas(idMaquina) {

    var instrucaoSql = `select
cpuPorcentagem,
memoriaPorcentagem
FROM Computador
JOIN DadoComputador
ON fkComputador = ${idMaquina}
WHERE idComputador = ${idMaquina}
ORDER BY idDado desc
limit 1;`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarMedidasEmTempoReal(idMaquina) {

    var instrucaoSql = ` select
cpuPorcentagem,
memoriaPorcentagem
FROM Computador
JOIN DadoComputador
ON fkComputador = ${idMaquina}
WHERE idComputador = ${idMaquina}
ORDER BY idDado desc;`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarMaquinasPorUsuario(idUsuario) {

    var instrucaoSql = `SELECT * FROM Computador a WHERE fkUsuario = ${idUsuario}`;
  
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
  }

module.exports = {
    buscarMaquinasPorUsuario,
    buscarUltimasMedidas,
    buscarMedidasEmTempoReal
}