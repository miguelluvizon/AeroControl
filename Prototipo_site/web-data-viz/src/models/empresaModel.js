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

function puxarAlertas(setor) { // rota luvizones
  var instrucaoSql = `
  SELECT
  SUM(CASE WHEN origem = 'cpu' THEN 1 ELSE 0 END) AS total_cpu,
  SUM(CASE WHEN origem = 'ram' THEN 1 ELSE 0 END) AS total_ram
  FROM Alerta
  JOIN DadoComputador ON fkDadoComputador = idDado
  JOIN Computador ON fkComputador = idComputador
  JOIN Setor ON fkSetor = idSetor
  WHERE idSetor = ${setor} AND horaDado BETWEEN DATE_SUB(NOW(), INTERVAL 7 DAY) AND NOW();`;
  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

function puxarAlertasCriticos(setor) { // rota luvizones
  var instrucaoSql = `
  SELECT
	SUM(CASE WHEN origem = 'cpu' THEN total_alertas ELSE 0 END) AS somaTotalCPU,
	SUM(CASE WHEN origem = 'ram' THEN total_alertas ELSE 0 END) AS somaTotalRAM
	FROM (SELECT idComputador, hostname AS Maquina, origem, COUNT(a.idAlerta) AS total_alertas 
	FROM Alerta a
	JOIN DadoComputador ON fkDadoComputador = idDado
	JOIN Computador ON fkComputador = idComputador
	JOIN Setor ON fkSetor = idSetor
	WHERE idSetor = ${setor} AND horaDado BETWEEN DATE_SUB(NOW(), INTERVAL 7 DAY) AND NOW()
	GROUP BY idComputador, hostname, origem
	ORDER BY total_alertas ASC
	LIMIT 10
	) AS somaCritica;`;
  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

function puxarTotalMaquinas(setor) { // rota luvizones
  var instrucaoSql = `
  SELECT COUNT(*) AS total_maquinas FROM Computador 
  JOIN Setor ON fkSetor = idSetor
  WHERE fkSetor = ${setor};`;
  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

function puxarMediaTotal(setor) { // rota luvizones
  var instrucaoSql = `
  SELECT
    ROUND(AVG(media_uso_cpu),1) AS mediaTotal_CPU,
    ROUND(AVG(media_uso_ram),1) AS mediaTotal_RAM
    FROM (SELECT AVG(cpuPorcentagem) AS media_uso_cpu, AVG(memoriaPorcentagem) AS media_uso_ram
    FROM Computador 
    JOIN DadoComputador 
    ON fkComputador = idComputador 
    JOIN Setor ON fkSetor = idSetor
    WHERE idSetor = ${setor} AND horaDado BETWEEN DATE_SUB(NOW(), INTERVAL 7 DAY) AND NOW()
    GROUP BY idComputador
    ) AS mediasTotais;`;
  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

function rankearAlertasTotais(componente, setor) { // rota luvizones
  var instrucaoSql = `
  SELECT idComputador, hostname as Maquina, COUNT(a.idAlerta) AS total_alertas FROM Alerta a
	JOIN DadoComputador ON fkDadoComputador = idDado
  JOIN Computador ON fkComputador = idComputador
  JOIN Setor ON fkSetor = idSetor
  WHERE idSetor = ${setor} AND origem = '${componente}' AND horaDado BETWEEN DATE_SUB(NOW(), INTERVAL 7 DAY) AND NOW()
  GROUP BY idComputador, hostname
  ORDER BY total_alertas ASC
  LIMIT 10;`;
  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

function rankearMaquinasCriticas(setor) { // rota luvizones
  var instrucaoSql = `
  SELECT idComputador,hostname AS Maquina, ROUND(AVG(cpuPorcentagem),1) AS mediaCPU, ROUND(AVG(memoriaPorcentagem),1) AS mediaRAM
	FROM Computador 
  JOIN DadoComputador ON idComputador = fkComputador
  JOIN Setor ON fkSetor = idSetor
  WHERE idSetor = ${setor} AND horaDado BETWEEN DATE_SUB(NOW(), INTERVAL 7 DAY) AND NOW()
	GROUP BY idComputador, hostname
	HAVING AVG(cpuPorcentagem) >= 80 OR AVG(memoriaPorcentagem) >= 80;`;
  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

module.exports = {
  buscarPorCnpj,
  buscarPorId,
  cadastrar,
  listar,
  getEmpresas,
  puxarAlertas, // rota luvizones
  puxarAlertasCriticos, // rota luvizones
  puxarTotalMaquinas, // rota luvizones
  puxarMediaTotal, // rota luvizones
  rankearAlertasTotais, // rota luvizones
  rankearMaquinasCriticas // rota luvizones
};
