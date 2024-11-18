var database = require("../database/config")

function plotar() {
  var instrucao = `
      SELECT cpuPorcentagem , memoriaPorcentagem, memoriaGB FROM Usuario
	      JOIN Computador ON fkUsuario = cpf
        JOIN DadoComputador ON fkComputador = idComputador
      WHERE cpf = ${sessionStorage.CPF};
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

function getInformacoes() {
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
WHERE idComputador = 1) as alertas 
FROM Computador
JOIN DadoComputador
ON fkComputador = idComputador
LEFT JOIN Alerta
ON fkDadoComputador = idDado
WHERE idDado = (SELECT max(idDado) FROM DadoComputador JOIN Computador ON idComputador = fkComputador WHERE idComputador = 1)
GROUP BY hostname, ramMax, processador, cpuPorcentagem, memoriaPorcentagem, memoriaGB;
  `;
  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

module.exports = {
  cadastrar,
  plotar,
  getSetor,
  getInformacoes
};