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

function puxarAlertas() { // rota luvizones
  var instrucaoSql = `
  select count(*) as total_linhas from Alerta
	  JOIN DadoComputador ON fkDadoComputador = idDado
    JOIN Computador ON fkComputador = idComputador
    JOIN Setor ON fkSetor = idSetor
    JOIN SetorAeroporto ON fkSetorId = idSetor
    WHERE fkAeroporto = "11223344556677" AND idSetor = 1;`;
  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

function puxarTotalMaquinas() { // rota luvizones
  var instrucaoSql = `
  SELECT COUNT(*) AS total_maquinas FROM Computador 
  JOIN Setor ON fkSetor = idSetor
  WHERE fkSetor = 1;`;
  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

function puxarMediaTotal() { // rota luvizones
  var instrucaoSql = `
  SELECT
    ROUND(AVG(media_uso_cpu),1) AS mediaTotal_CPU,
    ROUND(AVG(media_uso_ram),1) AS mediaTotal_RAM
FROM (
    SELECT 
        AVG(cpuPorcentagem) AS media_uso_cpu,
        AVG(memoriaPorcentagem) AS media_uso_ram
    FROM 
        Computador
    JOIN 
        DadoComputador ON fkComputador = idComputador
	JOIN 
		Setor on fkSetor = idSetor
    WHERE 
        idSetor = 1
    GROUP BY 
        idComputador
) AS mediasTotais;`;
  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

module.exports = {
  buscarPorCnpj,
  buscarPorId,
  cadastrar,
  listar,
  getEmpresas,
  puxarAlertas,
  puxarTotalMaquinas,
  puxarMediaTotal
};
