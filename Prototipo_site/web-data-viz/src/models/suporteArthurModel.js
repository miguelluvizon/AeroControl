
var database = require("../database/config");

function buscarUltimasMedidas(idMaquina) {

    var instrucaoSql = `select
computador.*,
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
    var instrucaoSql = `
    SELECT 
    Computador.*,
    DadoComputador.cpuPorcentagem,
    DadoComputador.memoriaPorcentagem
FROM 
    Computador
JOIN 
    DadoComputador ON Computador.idComputador = DadoComputador.fkComputador
JOIN
    Usuario ON Computador.fkUsuario = Usuario.cpf
WHERE 
    DadoComputador.idDado = (
        SELECT MAX(idDado) 
        FROM DadoComputador 
        WHERE fkComputador = Computador.idComputador
    )
ORDER BY 
    Computador.idComputador;`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    buscarMaquinasPorUsuario,
    buscarUltimasMedidas,
    buscarMedidasEmTempoReal
}