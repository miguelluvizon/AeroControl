var database = require("../database/config");

function getDados(maquina) {
  var instrucao = `
      SELECT ramMax, horaDado, cpuPorcentagem, memoriaPorcentagem FROM DadoComputador
JOIN Computador
ON idComputador = fkComputador
WHERE idComputador = ${maquina}
ORDER BY idDado DESC
LIMIT 25;
  `;
  console.log("Executando a instrução SQL: \n" + instrucao);
  return database.executar(instrucao);
}

function getDadosNovos(maquina) {
  var instrucao = `SELECT ramMax, horaDado, cpuPorcentagem, memoriaPorcentagem, processador FROM DadoComputador
JOIN Computador
ON idComputador = fkComputador
WHERE idComputador = ${maquina}
ORDER BY idDado DESC
LIMIT 25;
  `;
  console.log("Executando a instrução SQL: \n" + instrucao);
  return database.executar(instrucao);
}

function cadastrar(hostname, ramTotal, processador, usuario, setor) {
  var instrucaoSql = `
      INSERT INTO Computador (hostname, processador, ramMax, fkUsuario, fkSetor) VALUES
        ("${hostname}", "${processador}", ${ramTotal}, ${usuario}, ${setor})
  `;
  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

function getSetor() {
  var instrucaoSql = `
  SELECT * FROM Setor ORDER BY nomeSetor;`;
  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

function getInformacoes(maquina) {
  var instrucaoSql = `
 SELECT hostname,
ramMax,
processador,
cpuPorcentagem,
memoriaPorcentagem,
memoriaGB,
(SELECT count(*) FROM Alerta 
JOIN DadoComputador 
ON fkDadoComputador = idDado 
JOIN Computador 
ON fkComputador = idComputador 
WHERE idComputador = ${maquina} AND TIME_TO_SEC(TIMEDIFF(current_timestamp, dataAlerta)) <= 3600) as alertas 
FROM Computador
JOIN DadoComputador
ON fkComputador = idComputador
LEFT JOIN Alerta
ON fkDadoComputador = idDado
WHERE idDado = (SELECT max(idDado) FROM DadoComputador JOIN Computador ON idComputador = fkComputador WHERE idComputador = ${maquina})
GROUP BY hostname, ramMax, processador, cpuPorcentagem, memoriaPorcentagem, memoriaGB;
  `;
  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

module.exports = {
  cadastrar,
  getDados,
  getDadosNovos,
  getSetor,
  getInformacoes,
};
