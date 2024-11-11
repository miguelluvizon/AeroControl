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

function cadastrar(nome) {
  var instrucao = `
      INSERT INTO suporte (nome) VALUES ('${nome}');
  `;
  console.log("Executando a instrução SQL: \n" + instrucao);
  return database.executar(instrucao);
}

module.exports = {
  cadastrar,
  plotar
};