var database = require("../database/config");

function buscarPorId(id) {
  var instrucaoSql = `SELECT * FROM empresa WHERE idEmpresa, nome_empresa = '${nome_empresa}'`;

  return database.executar(instrucaoSql);
}

function listar() {
  var instrucaoSql = `SELECT cnpj, nomeAeroporto FROM Aeroporto`;

  return database.executar(instrucaoSql);
}

function buscarPorCnpj(cnpj) {
  var instrucaoSql = `SELECT * FROM empresa WHERE cnpj = '${cnpj}'`;

  return database.executar(instrucaoSql);
}

function cadastrar(razaoSocial, cnpj) {
  var instrucaoSql = `INSERT INTO Aeroporto (razao_social, cnpj) VALUES ('${razaoSocial}', '${cnpj}')`;

  return database.executar(instrucaoSql);
}

function getEmpresas() {
  var instrucaoSql = `
  SELECT cnpj, nomeAeroporto FROM Aeroporto ORDER BY nomeAeroporto;`;
  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

function getSetor() {
  var instrucaoSql = `
  SELECT nomeSetor FROM Setor ORDER BY nomeSetor;`;
  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

module.exports = {buscarPorCnpj,
  buscarPorId,
  cadastrar,
  listar,
  getEmpresas,
  getSetor
};
