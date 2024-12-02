var database = require("../database/config");

function estadoMaquinas() {
    var instrucao = `
SELECT (SELECT count(*) FROM Alerta WHERE tipo = "alerta" AND week(dataAlerta) = week(curdate())) as AlertasTotais,
(SELECT count(*) FROM Alerta Where tipo = "atenção" AND week(dataAlerta) = week(curdate())) as AtencaoTotais,
(SELECT count(*) FROM DadoComputador WHERE week(horaDado) = week(curdate())) as DadosTotais
FROM DadoComputador LIMIT 1;
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

module.exports = {
estadoMaquinas
};
