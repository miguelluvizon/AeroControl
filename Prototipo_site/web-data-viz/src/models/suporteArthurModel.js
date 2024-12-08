
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
    var instrucaoSql = `    SELECT 
    Setor.nomeSetor AS setor,
    Computador.*,
    DadoComputador.cpuPorcentagem,
    DadoComputador.memoriaPorcentagem
FROM 
    Computador
JOIN 
    DadoComputador ON Computador.idComputador = DadoComputador.fkComputador
JOIN 
    Setor ON Computador.fkSetor = Setor.idSetor
JOIN 
    Usuario ON Computador.fkUsuario = Usuario.cpf
WHERE 
    Usuario.cpf = ${idUsuario}
    AND DadoComputador.idDado = (
        SELECT MAX(idDado) 
        FROM DadoComputador 
        WHERE fkComputador = Computador.idComputador
    )
ORDER BY 
    Computador.idComputador;`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}


function buscarAlertas(idUsuario) {
    var instrucaoSql = `  
    SELECT 
    Alerta.idAlerta AS idAlerta,
    DATE_FORMAT(Alerta.dataAlerta, '%d/%m/%Y') AS dataAlerta,
    DATE_FORMAT(Alerta.dataAlerta, '%H:%i:%s') AS horaAlerta,
    Alerta.Tipo AS tipo,
    Computador.idComputador AS idComputador,
    Computador.hostname AS hostname,
    DadoComputador.cpuPorcentagem AS cpuPorcentagem,
    DadoComputador.memoriaPorcentagem AS memoriaPorcentagem
FROM 
    Alerta
JOIN 
    DadoComputador ON Alerta.fkDadoComputador = DadoComputador.idDado
JOIN 
    Computador ON DadoComputador.fkComputador = Computador.idComputador
JOIN 
    Usuario AS DonoComputador ON Computador.fkUsuario = DonoComputador.cpf
JOIN 
    Aeroporto ON DonoComputador.fkAeroporto = Aeroporto.cnpj
JOIN 
    Usuario AS UsuarioFiltro ON UsuarioFiltro.fkAeroporto = Aeroporto.cnpj
WHERE 
    UsuarioFiltro.cpf = '${idUsuario}'
ORDER BY 
    Alerta.dataAlerta DESC limit 5;
`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    buscarMaquinasPorUsuario,
    buscarUltimasMedidas,
    buscarMedidasEmTempoReal,
    buscarAlertas
}