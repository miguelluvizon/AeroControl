-- SELECT LUVIZONES
SELECT idComputador, hostname as Maquina, COUNT(a.idAlerta) AS total_alertas FROM Alerta a
	JOIN DadoComputador ON fkDadoComputador = idDado
    JOIN Computador ON fkComputador = idComputador
    JOIN Setor ON fkSetor = idSetor
    JOIN SetorAeroporto ON fkSetorId = idSetor
    WHERE fkAeroporto = "11223344556677" AND idSetor = 1 AND origem = "cpu"
    GROUP BY idComputador, hostname
    ORDER BY total_alertas ASC
    LIMIT 10;

SELECT count(*) AS total_linhas FROM Alerta
	JOIN DadoComputador ON fkDadoComputador = idDado
    JOIN Computador ON fkComputador = idComputador
    JOIN Setor ON fkSetor = idSetor
    JOIN SetorAeroporto ON fkSetorId = idSetor
    WHERE fkAeroporto = "11223344556677" AND idSetor = 1 AND origem = "cpu";
-- -----------------------------------------------------------------------------------
-- SELECT DO REQUENA
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
WHERE idComputador = 1 AND TIME_TO_SEC(TIMEDIFF(current_timestamp, dataAlerta)) <= 3600) as alertas 
FROM Computador
JOIN DadoComputador
ON fkComputador = idComputador
LEFT JOIN Alerta
ON fkDadoComputador = idDado
WHERE idDado = (SELECT max(idDado) FROM DadoComputador JOIN Computador ON idComputador = fkComputador WHERE idComputador = 1)
GROUP BY hostname, ramMax, processador, cpuPorcentagem, memoriaPorcentagem, memoriaGB;

SELECT horaDado, cpuPorcentagem, memoriaPorcentagem, processador FROM DadoComputador
JOIN Computador
ON idComputador = fkComputador
WHERE idComputador = 1
ORDER BY idDado DESC
LIMIT 25;

-- SELECT DO MARTINEZ

SELECT clima, COUNT(*) AS frequencia
FROM webCrawler
WHERE dia BETWEEN CURDATE() - INTERVAL (DAYOFWEEK(CURDATE()) - 1) DAY
              AND CURDATE() + INTERVAL (7 - DAYOFWEEK(CURDATE())) DAY
GROUP BY clima
ORDER BY frequencia DESC;

-- SELECT PARA FAZER A COMPARAÇÃO ENTRE OS SETORES
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
    MONTH(a.dataAlerta) = MONTH(CURRENT_DATE())
    AND YEAR(a.dataAlerta) = YEAR(CURRENT_DATE())
GROUP BY 
    s.nomeSetor
ORDER BY 
    s.nomeSetor;
    
 -- SELECT PARA COMPARAR O SETOR COM ELE MESMO   
    
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
    MONTH(a.dataAlerta) = 11
    AND YEAR(a.dataAlerta) = 2024
    AND s.idSetor = 1
GROUP BY 
    s.nomeSetor
ORDER BY 
    s.nomeSetor;

-- SELECT PARA PEGAR A MÉDIA DE CPU E RAM NA SEMANA ATUAL

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
    AND s.idSetor = 2
GROUP BY 
    s.nomeSetor, c.hostname
ORDER BY 
    c.hostname;

-- SELECT PARA PEGAR A MÉDIA DE CPU E RAM DA SEMANA ATUAL MAS SE NÃO TIVER ELE PEGA DE DATAS ANTERIORES
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
    s.idSetor = 2
    AND dc.horaDado > NOW() - INTERVAL 30 DAY  -- Ajustando para os últimos 30 dias
GROUP BY 
    s.nomeSetor, c.hostname
ORDER BY 
    c.hostname;


-- SELECT PARA VER A QUANTIDADE DE ALERTAS
SELECT count(idAlerta) FROM Alerta WHERE MONTH(dataAlerta) = 11 AND YEAR(dataAlerta) = 2024;

-- SELECT PARA VER A QUANTIDADE DE ALERTAS POR SETOR
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
    s.idSetor = 1
GROUP BY 
    s.nomeSetor
ORDER BY 
    s.nomeSetor;
    
select * from Alerta;

SELECT 
  origem,
  COUNT(*) AS total
FROM Alerta
JOIN DadoComputador ON fkDadoComputador = idDado
JOIN Computador ON fkComputador = idComputador
JOIN Setor ON fkSetor = idSetor
WHERE idSetor = '11223344556677'
  AND horaDado BETWEEN DATE_SUB(NOW(), INTERVAL 7 DAY) AND NOW()
GROUP BY origem;


SELECT
  SUM(CASE WHEN origem = 'cpu' THEN total_alertas ELSE 0 END) AS somaTotalCPU,
  SUM(CASE WHEN origem = 'ram' THEN total_alertas ELSE 0 END) AS somaTotalRAM
FROM (
  SELECT idComputador, hostname AS Maquina, origem, COUNT(a.idAlerta) AS total_alertas 
  FROM Alerta a
  JOIN DadoComputador ON fkDadoComputador = idDado
  JOIN Computador ON fkComputador = idComputador
  JOIN Setor ON fkSetor = idSetor
  WHERE idSetor = 1 
    AND horaDado BETWEEN DATE_SUB(NOW(), INTERVAL 7 DAY) AND NOW()
  GROUP BY idComputador, hostname, origem
  ORDER BY total_alertas ASC
) AS somaCritica;