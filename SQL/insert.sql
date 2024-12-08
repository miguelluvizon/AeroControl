INSERT INTO DadoComputador (horaDado, cpuPorcentagem, memoriaPorcentagem, memoriaGB, fkComputador)
SELECT 
    DATE_ADD('2024-10-01', INTERVAL num DAY) AS horaDado,	 -- Gera as datas para o mês de outubro
    ROUND(RAND() * 100, 2) AS cpuPorcentagem, -- Uso de CPU entre 0 e 100%
    ROUND(RAND() * 100, 2) AS memoriaPorcentagem, -- Uso de memória entre 0 e 100%
    ROUND(8 * (RAND()), 2) AS memoriaGB, -- Simula memória usada para um total de 8GB
    2 AS fkComputador
FROM 
    (SELECT units.num + tens.num * 10 AS num 
     FROM (SELECT 0 AS num UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) units
     CROSS JOIN (SELECT 0 AS num UNION SELECT 1 UNION SELECT 2 UNION SELECT 3) tens) numbers
WHERE 
    DATE_ADD('2024-10-01', INTERVAL num DAY) <= LEAST('2024-10-31', CURDATE());    
    
INSERT INTO Alerta (dataAlerta, fkDadoComputador, tipo, origem)
SELECT 
    DATE_ADD('2024-10-01', INTERVAL num DAY) AS dataAlerta, -- Datas no mês de outubro
    FLOOR(1 + RAND() * (SELECT COUNT(*) FROM DadoComputador)) AS fkDadoComputador, -- Seleciona um fkDadoComputador aleatório
    CASE FLOOR(RAND() * 2)
        WHEN 0 THEN 'crítico'
        WHEN 1 THEN 'atenção'
    END AS tipo, -- Tipos de alerta
    CASE FLOOR(RAND() * 2)
        WHEN 0 THEN 'cpu'
        WHEN 1 THEN 'ram'
    END AS origem -- Origens dos alertas
FROM 
    (SELECT units.num + tens.num * 10 AS num 
     FROM (SELECT 0 AS num UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) units
     CROSS JOIN (SELECT 0 AS num UNION SELECT 1 UNION SELECT 2 UNION SELECT 3) tens) numbers
WHERE 
    DATE_ADD('2024-10-01', INTERVAL num DAY) <= LEAST('2024-10-31', CURDATE()); -- Limita a data ao máximo de 31 de outubro ou data atual

    
INSERT INTO Alerta (dataAlerta, fkDadoComputador, tipo, origem)
SELECT 
    DATE_ADD('2024-11-01', INTERVAL num DAY) AS dataAlerta, -- Datas no mês de novembro
    FLOOR(1 + RAND() * (SELECT COUNT(*) FROM DadoComputador)) AS fkDadoComputador, -- Seleciona um fkDadoComputador aleatório
    CASE FLOOR(RAND() * 2)
        WHEN 0 THEN 'crítico'
        WHEN 1 THEN 'atenção'
    END AS tipo, -- Tipos de alerta
    CASE FLOOR(RAND() * 2)
        WHEN 0 THEN 'cpu'
        WHEN 1 THEN 'ram'
    END AS origem -- Origens dos alertas
FROM 
    (SELECT units.num + tens.num * 10 AS num 
     FROM (SELECT 0 AS num UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) units
     CROSS JOIN (SELECT 0 AS num UNION SELECT 1 UNION SELECT 2 UNION SELECT 3) tens) numbers
WHERE 
    DATE_ADD('2024-11-01', INTERVAL num DAY) <= LEAST('2024-11-30', CURDATE()); -- Limita a data ao máximo de 30 de novembro ou data atual
    
    
INSERT INTO webCrawler (dia, clima) VALUES ('04/12', 'Chuvas esparsas');
INSERT INTO webCrawler (dia, clima) VALUES ('05/12', 'Chuvas esparsas');
INSERT INTO webCrawler (dia, clima) VALUES ('06/12', 'Chuvas esparsas');
INSERT INTO webCrawler (dia, clima) VALUES ('07/12', 'Chuva');
INSERT INTO webCrawler (dia, clima) VALUES ('08/12', 'Chuva');

-- Dados adicionais antes de 04/12
INSERT INTO webCrawler (dia, clima) VALUES ('03/12', 'Limpo');
INSERT INTO webCrawler (dia, clima) VALUES ('03/12', 'Tempo Nublado');
INSERT INTO webCrawler (dia, clima) VALUES ('03/12', 'Parcialmente Nublado');
INSERT INTO webCrawler (dia, clima) VALUES ('02/12', 'Limpo');
INSERT INTO webCrawler (dia, clima) VALUES ('02/12', 'Tempo Nublado');
INSERT INTO webCrawler (dia, clima) VALUES ('02/12', 'Parcialmente Nublado');
INSERT INTO webCrawler (dia, clima) VALUES ('01/12', 'Limpo');
INSERT INTO webCrawler (dia, clima) VALUES ('01/12', 'Tempo Nublado');
INSERT INTO webCrawler (dia, clima) VALUES ('01/12', 'Parcialmente Nublado');
INSERT INTO webCrawler (dia, clima) VALUES ('30/11', 'Limpo');
INSERT INTO webCrawler (dia, clima) VALUES ('30/11', 'Tempo Nublado');
INSERT INTO webCrawler (dia, clima) VALUES ('30/11', 'Parcialmente Nublado');
INSERT INTO webCrawler (dia, clima) VALUES ('29/11', 'Limpo');
INSERT INTO webCrawler (dia, clima) VALUES ('29/11', 'Tempo Nublado');
INSERT INTO webCrawler (dia, clima) VALUES ('29/11', 'Parcialmente Nublado');
INSERT INTO webCrawler (dia, clima) VALUES ('28/11', 'Limpo');
INSERT INTO webCrawler (dia, clima) VALUES ('28/11', 'Tempo Nublado');
INSERT INTO webCrawler (dia, clima) VALUES ('28/11', 'Parcialmente Nublado');
INSERT INTO webCrawler (dia, clima) VALUES ('27/11', 'Limpo');
INSERT INTO webCrawler (dia, clima) VALUES ('27/11', 'Tempo Nublado');
INSERT INTO webCrawler (dia, clima) VALUES ('27/11', 'Parcialmente Nublado');
INSERT INTO webCrawler (dia, clima) VALUES ('26/11', 'Limpo');
INSERT INTO webCrawler (dia, clima) VALUES ('26/11', 'Tempo Nublado');
INSERT INTO webCrawler (dia, clima) VALUES ('26/11', 'Parcialmente Nublado');
INSERT INTO webCrawler (dia, clima) VALUES ('25/11', 'Limpo');
INSERT INTO webCrawler (dia, clima) VALUES ('25/11', 'Tempo Nublado');
INSERT INTO webCrawler (dia, clima) VALUES ('25/11', 'Parcialmente Nublado');
INSERT INTO webCrawler (dia, clima) VALUES ('24/11', 'Chuva');
INSERT INTO webCrawler (dia, clima) VALUES ('24/11', 'Limpo');
INSERT INTO webCrawler (dia, clima) VALUES ('23/11', 'Tempo Nublado');
INSERT INTO webCrawler (dia, clima) VALUES ('23/11', 'Parcialmente Nublado');
INSERT INTO webCrawler (dia, clima) VALUES ('22/11', 'Chuva');
INSERT INTO webCrawler (dia, clima) VALUES ('22/11', 'Limpo');
INSERT INTO webCrawler (dia, clima) VALUES ('21/11', 'Tempo Nublado');
INSERT INTO webCrawler (dia, clima) VALUES ('21/11', 'Parcialmente Nublado');
INSERT INTO webCrawler (dia, clima) VALUES ('20/11', 'Limpo');

INSERT INTO Alerta (dataAlerta, fkDadoComputador, tipo, origem)
SELECT 
    CURDATE() - INTERVAL num DAY AS dataAlerta, -- Gera datas nos últimos 7 dias
    FLOOR(1 + RAND() * (SELECT COUNT(*) FROM DadoComputador)) AS fkDadoComputador, -- Seleciona um fkDadoComputador aleatório
    'crítico' AS tipo, -- Tipos de alerta sempre como 'crítico'
    CASE FLOOR(RAND() * 2)
        WHEN 0 THEN 'cpu'
        WHEN 1 THEN 'ram'
    END AS origem -- Origens dos alertas
FROM 
    (SELECT units.num + tens.num * 10 AS num 
     FROM (SELECT 0 AS num UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) units
     CROSS JOIN (SELECT 0 AS num UNION SELECT 1 UNION SELECT 2 UNION SELECT 3) tens) numbers
WHERE 
    CURDATE() - INTERVAL num DAY >= CURDATE() - INTERVAL 7 DAY; -- Garante que a data seja nos últimos 7 dias
    
select * from Alerta;

SELECT 
    c.idComputador,
    c.hostname AS Maquina, 
    ROUND(AVG(dc.cpuPorcentagem), 1) AS mediaCPU, 
    ROUND(AVG(dc.memoriaPorcentagem), 1) AS mediaRAM,
    a.tipo AS tipoAlerta -- Adiciona o tipo de alerta, que deve ser "crítico"
FROM 
    Computador c
JOIN 
    DadoComputador dc ON c.idComputador = dc.fkComputador
JOIN 
    Setor s ON c.fkSetor = s.idSetor
JOIN 
    Alerta a ON a.fkDadoComputador = dc.idDado -- Faz o join com a tabela Alerta
WHERE 
    s.idSetor = 1
    AND dc.horaDado BETWEEN DATE_SUB(NOW(), INTERVAL 7 DAY) AND NOW()
    AND a.tipo = 'crítico' -- Filtra os alertas do tipo "crítico"
GROUP BY 
    c.idComputador, c.hostname, a.tipo;


-- pegas dados de até 7 dias atrás
INSERT INTO DadoComputador (horaDado, cpuPorcentagem, memoriaPorcentagem, memoriaGB, fkComputador)
SELECT 
    DATE_SUB(CURDATE(), INTERVAL 7 DAY) AS horaDado, -- Data de 7 dias atrás
    ROUND(RAND() * 100, 2) AS cpuPorcentagem, -- Uso de CPU entre 0 e 100%
    ROUND(RAND() * 100, 2) AS memoriaPorcentagem, -- Uso de memória entre 0 e 100%
    ROUND(8 * (RAND()), 2) AS memoriaGB, -- Simula memória usada para um total de 8GB
    2 AS fkComputador -- Identificador do computador (ajuste conforme necessário)
FROM 
    (SELECT units.num + tens.num * 50 AS num 
     FROM (SELECT 0 AS num UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) units
     CROSS JOIN (SELECT 0 AS num UNION SELECT 1 UNION SELECT 2 UNION SELECT 3) tens) numbers
WHERE 
    DATE_SUB(CURDATE(), INTERVAL 7 DAY) <= LEAST('2024-12-08', CURDATE());  -- Condição para filtrar as datas dentro do limite de 7 dias
    
    
    
INSERT INTO Alerta (dataAlerta, fkDadoComputador, tipo, origem)
SELECT 
    CURDATE() - INTERVAL num DAY AS dataAlerta, -- Gera datas nos últimos 7 dias
    FLOOR(1 + RAND() * (SELECT COUNT(*) FROM DadoComputador)) AS fkDadoComputador, -- Seleciona um fkDadoComputador aleatório
    'crítico' AS tipo, -- Tipos de alerta sempre como 'crítico'
    CASE FLOOR(RAND() * 2)
        WHEN 0 THEN 'cpu'
        WHEN 1 THEN 'ram'
    END AS origem -- Origens dos alertas
FROM 
    (SELECT units.num + tens.num * 40 AS num 
     FROM (SELECT 0 AS num UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) units
     CROSS JOIN (SELECT 0 AS num UNION SELECT 1 UNION SELECT 2 UNION SELECT 3) tens) numbers
WHERE 
    CURDATE() - INTERVAL num DAY >= CURDATE() - INTERVAL 7 DAY; -- Garante que a data seja nos últimos 7 dias


select * from Alerta;
