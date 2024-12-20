var database = require("../database/config")

function totalAlertas(mes, ano) {
    const instrucao = `SELECT count(idAlerta) as qtdAlertas FROM Alerta WHERE MONTH(dataAlerta) = ${mes} AND YEAR(dataAlerta) = ${ano};`
    return database.executar(instrucao)
}

function totalAletasSetor(setor, mes, ano) {
    const instrucao = `
        SELECT 
            s.nomeSetor AS setor,
            COUNT(a.idAlerta) AS quantidade_alertas
        FROM 
            Alerta a
        JOIN 
            DadoComputador dc ON a.fkDadoComputador = dc.idDado
        JOIN 
            Computador c ON dc.fkComputador = c.idComputador
        JOIN 
            Setor s ON c.fkSetor = s.idSetor
        WHERE
            MONTH(a.dataAlerta) = ${mes} 
            AND YEAR(a.dataAlerta) = ${ano}
            AND s.idSetor = ${setor}
        GROUP BY 
            s.nomeSetor
        ORDER BY 
            s.nomeSetor;
    `

    return database.executar(instrucao)
}

function totalAlertasPredict() {
    const instrucao = `
        SELECT 
            s.nomeSetor AS setor,
            MONTH(a.dataAlerta) AS mes,
            COUNT(a.idAlerta) AS quantidade_alertas
        FROM 
            Alerta a
        JOIN 
            DadoComputador dc ON a.fkDadoComputador = dc.idDado
        JOIN 
            Computador c ON dc.fkComputador = c.idComputador
        JOIN 
            Setor s ON c.fkSetor = s.idSetor
        GROUP BY 
            s.nomeSetor, MONTH(a.dataAlerta)
        ORDER BY 
            s.nomeSetor, mes;
    `

    return database.executar(instrucao)
}

function exibirGraficoEleMesmo(setor, mes, ano){
    const instrucao = `
        SELECT 
            s.nomeSetor AS setor,
            SUM(CASE WHEN DAY(a.dataAlerta) <= 7 THEN 1 ELSE 0 END) AS semana_1,
            SUM(CASE WHEN DAY(a.dataAlerta) BETWEEN 8 AND 14 THEN 1 ELSE 0 END) AS semana_2,
            SUM(CASE WHEN DAY(a.dataAlerta) BETWEEN 15 AND 21 THEN 1 ELSE 0 END) AS semana_3,
            SUM(CASE WHEN DAY(a.dataAlerta) >= 22 THEN 1 ELSE 0 END) AS semana_4
        FROM 
            Alerta a
        JOIN 
            DadoComputador dc ON a.fkDadoComputador = dc.idDado
        JOIN 
            Computador c ON dc.fkComputador = c.idComputador
        JOIN 
            Setor s ON c.fkSetor = s.idSetor
        WHERE 
            MONTH(a.dataAlerta) = ${mes}
            AND YEAR(a.dataAlerta) = ${ano}
            AND s.idSetor = ${setor}
        GROUP BY 
            s.nomeSetor
        ORDER BY 
            s.nomeSetor;
    `
    return database.executar(instrucao)
}

function exibirGraficoSetores(mes, ano){
    const instrucao = `
        SELECT 
            s.nomeSetor AS setor,
            SUM(CASE WHEN DAY(a.dataAlerta) <= 7 THEN 1 ELSE 0 END) AS semana_1,
            SUM(CASE WHEN DAY(a.dataAlerta) BETWEEN 8 AND 14 THEN 1 ELSE 0 END) AS semana_2,
            SUM(CASE WHEN DAY(a.dataAlerta) BETWEEN 15 AND 21 THEN 1 ELSE 0 END) AS semana_3,
            SUM(CASE WHEN DAY(a.dataAlerta) >= 22 THEN 1 ELSE 0 END) AS semana_4
        FROM 
            Alerta a
        JOIN 
            DadoComputador dc ON a.fkDadoComputador = dc.idDado
        JOIN 
            Computador c ON dc.fkComputador = c.idComputador
        JOIN 
            Setor s ON c.fkSetor = s.idSetor
        WHERE 
            MONTH(a.dataAlerta) = ${mes}
            AND YEAR(a.dataAlerta) = ${ano}
        GROUP BY 
            s.nomeSetor
        ORDER BY 
            s.nomeSetor;
    `

    return database.executar(instrucao)
}

function graficoComparacaoCPueRam(setor){
    const instrucao = `
        SELECT 
            s.nomeSetor AS setor,
            c.hostname AS computador,
            AVG(dc.cpuPorcentagem) AS media_cpu,
            AVG(dc.memoriaPorcentagem) AS media_memoria
        FROM 
            DadoComputador dc
        JOIN 
            Computador c ON dc.fkComputador = c.idComputador
        JOIN 
            Setor s ON c.fkSetor = s.idSetor
        WHERE 
            YEAR(dc.horaDado) = YEAR(CURRENT_DATE())  
            AND WEEK(dc.horaDado, 1) = WEEK(CURRENT_DATE(), 1)  
        AND s.idSetor = "${setor}"
        GROUP BY 
            s.nomeSetor, c.hostname
        ORDER BY 
            c.hostname;
    `

    return database.executar(instrucao)
}

module.exports = {
    totalAlertas,
    totalAletasSetor,
    totalAlertasPredict,
    exibirGraficoEleMesmo,
    exibirGraficoSetores,
    graficoComparacaoCPueRam
}