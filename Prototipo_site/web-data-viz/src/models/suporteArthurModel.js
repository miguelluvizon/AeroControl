var database = require("../database/config");

function buscarUltimasMedidas(idMaquina) {

    var instrucaoSql = `
 SELECT hostname,
cpuPorcentagem,
memoriaPorcentagem,
setor
FROM Computador
JOIN DadoComputador
ON fkComputador = ${idMaquina}
WHERE idComputador = ${idMaquina}
ORDER BY cpuPorcentagem;
  `;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarMedidasEmTempoReal(idMaquina) {

    var instrucaoSql = `
 SELECT hostname,
cpuPorcentagem,
memoriaPorcentagem,
WHERE idComputador = ${idMaquina} 
FROM Computador
JOIN DadoComputador
ON fkComputador = ${idMaquina}
ORDER BY cpuPorcentagem;
  `;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    buscarUltimasMedidas,
    buscarMedidasEmTempoReal
}