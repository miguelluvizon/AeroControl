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
    
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:37:00', 1.1, 26.1, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:37:00', 1.6, 26.1, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:37:00', 0.0, 26.1, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:37:00', 0.5, 26.1, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:37:00', 0.5, 26.0, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:37:00', 0.5, 26.0, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:37:00', 1.0, 26.0, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:37:00', 0.0, 26.0, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:38:00', 0.5, 26.0, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:38:00', 0.0, 26.0, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:38:00', 3.3, 26.0, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:40:00', 8.8, 25.6, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:40:00', 0.8, 25.6, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:40:00', 0.5, 25.6, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:40:00', 0.5, 25.6, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:40:00', 0.0, 25.6, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:40:00', 1.0, 25.6, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:40:00', 0.0, 25.6, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:40:00', 1.0, 25.6, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:40:00', 0.5, 25.6, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:40:00', 0.5, 25.6, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:40:00', 1.7, 25.6, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:40:00', 2.5, 25.6, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:40:00', 0.5, 25.6, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:40:00', 0.5, 25.6, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:40:00', 0.0, 25.6, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:49:00', 7.9, 26.0, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:50:00', 1.3, 26.0, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:50:00', 0.8, 26.0, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:50:00', 0.0, 26.0, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:50:00', 0.5, 26.0, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:50:00', 0.0, 26.0, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:50:00', 0.5, 26.0, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:50:00', 0.5, 26.0, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:50:00', 0.0, 26.0, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:50:00', 1.0, 26.0, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:50:00', 2.2, 26.0, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:50:00', 0.5, 26.0, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:50:00', 0.0, 26.0, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:50:00', 0.5, 26.0, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:50:00', 0.0, 26.0, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:50:00', 4.8, 26.0, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:50:00', 0.6, 26.0, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:50:00', 0.5, 26.0, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:50:00', 0.0, 26.0, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:50:00', 0.5, 26.0, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:50:00', 2.2, 26.0, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:50:00', 0.3, 26.0, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:50:00', 0.0, 26.0, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:50:00', 2.0, 26.0, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:50:00', 1.1, 26.0, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:50:00', 0.5, 26.0, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:50:00', 1.0, 26.0, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:50:00', 0.5, 26.0, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:50:00', 0.0, 26.0, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:50:00', 0.5, 26.0, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:50:00', 2.1, 26.0, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:50:00', 3.0, 26.0, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:50:00', 0.5, 26.0, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:50:00', 0.0, 26.0, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:50:00', 0.0, 26.0, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:50:00', 0.5, 26.0, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:50:00', 0.0, 26.0, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:50:00', 2.0, 26.0, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:50:00', 0.5, 26.0, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:50:00', 0.5, 26.0, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:50:00', 2.6, 25.9, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:56:00', 10.6, 25.6, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:56:00', 0.3, 25.6, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:56:00', 0.5, 25.6, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-19 23:56:00', 0.0, 25.6, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:29:00', 10.8, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:29:00', 0.5, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:29:00', 0.0, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:29:00', 0.5, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:29:00', 1.0, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:29:00', 0.0, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:29:00', 0.0, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:29:00', 2.0, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:29:00', 1.3, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:29:00', 2.1, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:29:00', 1.5, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:29:00', 1.4, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:29:00', 0.6, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:29:00', 0.0, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:29:00', 2.9, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:29:00', 0.3, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:29:00', 0.5, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:36:00', 16.4, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:36:00', 1.3, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:36:00', 0.5, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:36:00', 0.5, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:36:00', 0.0, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:36:00', 0.0, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:36:00', 1.0, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:36:00', 0.0, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:36:00', 0.0, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:36:00', 0.5, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:36:00', 1.3, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:36:00', 0.6, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:36:00', 0.0, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:36:00', 0.0, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:36:00', 1.0, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:36:00', 1.0, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:37:00', 0.5, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:37:00', 0.5, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:37:00', 0.0, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:37:00', 1.5, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:37:00', 1.5, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:37:00', 0.8, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:37:00', 0.0, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:37:00', 0.0, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:37:00', 0.0, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:37:00', 0.5, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:37:00', 0.5, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:37:00', 0.0, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:37:00', 1.0, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:37:00', 1.5, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:37:00', 1.2, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:37:00', 2.2, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:37:00', 0.6, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:37:00', 0.0, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:37:00', 0.0, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:37:00', 0.5, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:37:00', 1.0, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:37:00', 0.0, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:37:00', 0.0, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:37:00', 0.5, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:37:00', 3.1, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:37:00', 0.3, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:37:00', 0.0, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:37:00', 0.5, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:37:00', 0.0, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:37:00', 0.5, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:37:00', 1.0, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:37:00', 0.0, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:37:00', 0.5, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:37:00', 0.5, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:37:00', 2.6, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:37:00', 0.8, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:37:00', 1.0, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:37:00', 0.0, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:37:00', 0.0, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:37:00', 2.0, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:37:00', 0.8, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:37:00', 0.0, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:37:00', 0.5, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:37:00', 0.0, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:37:00', 2.2, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:37:00', 0.5, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:37:00', 0.5, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:37:00', 1.0, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:37:00', 0.0, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:37:00', 0.0, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:37:00', 0.5, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:38:00', 0.0, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:38:00', 0.5, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:38:00', 1.0, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:38:00', 1.7, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:38:00', 0.3, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:38:00', 1.0, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:38:00', 0.5, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:38:00', 0.5, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:38:00', 1.0, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:38:00', 0.0, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:38:00', 0.5, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:38:00', 0.5, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:38:00', 2.9, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:38:00', 1.6, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:38:00', 2.1, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:38:00', 0.6, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:38:00', 0.5, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:38:00', 1.0, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:38:00', 0.5, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:38:00', 1.0, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:38:00', 0.0, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:38:00', 2.0, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:38:00', 0.5, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:38:00', 2.2, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:38:00', 0.3, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:38:00', 0.5, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:38:00', 1.0, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:38:00', 0.0, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:38:00', 0.0, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:38:00', 0.5, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:38:00', 1.0, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:38:00', 0.5, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:38:00', 0.5, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:38:00', 1.3, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:38:00', 0.8, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:38:00', 0.5, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:38:00', 0.0, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:38:00', 0.0, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:38:00', 0.0, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:38:00', 1.0, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:38:00', 1.5, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:38:00', 1.6, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:38:00', 0.3, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:38:00', 1.8, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:38:00', 1.3, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:38:00', 2.2, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:38:00', 0.3, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:38:00', 0.0, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:38:00', 0.5, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:38:00', 1.0, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:39:00', 1.0, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:39:00', 0.5, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:39:00', 2.5, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:39:00', 1.5, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:39:00', 0.3, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:39:00', 0.5, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:39:00', 0.5, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:39:00', 0.5, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:39:00', 0.5, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:39:00', 1.0, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:39:00', 0.0, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:39:00', 3.8, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:39:00', 0.8, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:39:00', 2.2, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:39:00', 1.4, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:39:00', 0.5, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:39:00', 0.5, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:39:00', 0.5, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:39:00', 0.5, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:39:00', 3.9, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:39:00', 0.8, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:39:00', 0.0, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:39:00', 1.0, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:39:00', 1.7, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:39:00', 1.4, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:39:00', 0.5, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:39:00', 0.0, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:39:00', 0.5, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:39:00', 0.0, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:39:00', 0.0, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:39:00', 0.5, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:39:00', 0.5, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:39:00', 0.5, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:39:00', 1.3, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:39:00', 0.8, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:39:00', 2.0, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:39:00', 0.3, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:39:00', 1.0, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:39:00', 0.0, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:39:00', 0.5, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:39:00', 0.5, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:39:00', 0.0, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:39:00', 0.0, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:39:00', 2.1, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:39:00', 0.8, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:39:00', 0.0, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:39:00', 0.0, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:39:00', 1.0, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:39:00', 1.0, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:39:00', 0.0, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:40:00', 2.5, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:40:00', 1.1, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:40:00', 0.5, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:40:00', 2.6, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:40:00', 0.3, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:40:00', 0.5, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:40:00', 0.5, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:40:00', 0.0, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:40:00', 0.5, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:40:00', 0.0, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:40:00', 1.0, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:40:00', 0.5, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:40:00', 0.5, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:40:00', 1.7, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:40:00', 0.5, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:40:00', 0.5, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:40:00', 1.0, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:40:00', 0.5, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:40:00', 0.5, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:40:00', 0.0, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:40:00', 0.0, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:40:00', 1.5, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:40:00', 1.1, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:40:00', 1.6, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:40:00', 1.9, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:40:00', 1.4, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:40:00', 0.7, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:40:00', 0.0, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:40:00', 1.0, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:40:00', 0.0, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:40:00', 0.0, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:40:00', 0.5, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:40:00', 1.0, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:40:00', 1.7, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:40:00', 1.4, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:40:00', 0.3, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:40:00', 0.0, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:40:00', 2.9, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:40:00', 1.3, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:40:00', 0.8, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:40:00', 0.0, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:40:00', 1.0, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:40:00', 0.0, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:40:00', 2.5, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:40:00', 0.5, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:40:00', 2.0, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:41:00', 0.3, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:41:00', 1.5, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:41:00', 0.8, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:41:00', 1.5, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:41:00', 0.5, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:41:00', 0.0, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:41:00', 0.5, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:41:00', 2.6, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:41:00', 1.6, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:41:00', 0.3, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:41:00', 0.0, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:41:00', 0.5, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:41:00', 0.0, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:41:00', 0.0, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:41:00', 2.9, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:41:00', 0.0, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:41:00', 1.0, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:41:00', 3.0, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:41:00', 0.3, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:41:00', 0.5, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:41:00', 0.0, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:41:00', 1.5, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:41:00', 0.5, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:41:00', 1.5, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:41:00', 0.3, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:41:00', 0.0, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:41:00', 1.0, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:41:00', 2.2, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:41:00', 0.3, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:41:00', 1.0, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:41:00', 2.0, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:41:00', 0.8, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:41:00', 0.0, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:41:00', 2.0, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:41:00', 0.8, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:41:00', 0.0, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:41:00', 0.5, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:41:00', 1.7, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:41:00', 0.6, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:41:00', 0.0, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:41:00', 0.5, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:41:00', 0.0, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:41:00', 0.0, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:41:00', 2.9, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:41:00', 0.5, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:41:00', 0.0, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:41:00', 2.0, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:41:00', 1.9, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:42:00', 1.0, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:42:00', 2.5, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:42:00', 1.1, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:42:00', 0.5, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:42:00', 2.5, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:42:00', 0.8, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:42:00', 0.0, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:42:00', 0.0, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:42:00', 0.5, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:42:00', 2.1, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:42:00', 0.3, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:42:00', 0.5, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:42:00', 1.0, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:42:00', 2.0, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:42:00', 1.4, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:42:00', 0.5, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:42:00', 0.0, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:42:00', 0.5, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:42:00', 0.5, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:42:00', 2.6, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:42:00', 0.6, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:42:00', 0.0, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:42:00', 0.5, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:42:00', 0.0, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:42:00', 2.9, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:42:00', 1.0, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:42:00', 2.0, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:42:00', 0.5, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:42:00', 0.0, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:42:00', 2.9, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:42:00', 0.3, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:42:00', 0.0, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:42:00', 0.5, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:42:00', 0.0, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:42:00', 1.0, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:42:00', 1.5, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:42:00', 0.5, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:42:00', 1.0, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:42:00', 0.5, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:42:00', 2.8, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:42:00', 0.8, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:42:00', 0.5, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:42:00', 0.5, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:42:00', 2.0, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:42:00', 0.5, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:42:00', 0.0, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:43:00', 1.5, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:43:00', 0.3, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:43:00', 1.0, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:43:00', 2.2, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:43:00', 1.1, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:43:00', 1.5, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:43:00', 0.3, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:43:00', 1.5, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:43:00', 0.6, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:43:00', 5.2, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:43:00', 0.5, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:43:00', 1.0, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:43:00', 0.5, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:43:00', 2.2, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:43:00', 0.5, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:43:00', 1.5, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:43:00', 1.1, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:43:00', 0.0, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:43:00', 1.0, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:43:00', 0.5, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:43:00', 2.9, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:43:00', 1.1, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:43:00', 1.8, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:43:00', 1.3, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:43:00', 0.5, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:43:00', 0.0, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:43:00', 0.5, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:43:00', 1.0, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:43:00', 0.0, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:43:00', 0.5, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:43:00', 0.0, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:43:00', 1.0, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:43:00', 2.4, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:43:00', 1.0, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:43:00', 1.5, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:43:00', 0.3, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:43:00', 3.4, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:43:00', 0.0, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:43:00', 2.0, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:43:00', 0.0, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:43:00', 1.0, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:43:00', 0.0, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:43:00', 2.0, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:43:00', 1.4, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:44:00', 0.5, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:44:00', 0.5, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:44:00', 0.5, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:44:00', 0.0, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:44:00', 0.5, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:44:00', 0.5, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:44:00', 0.5, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:44:00', 0.0, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:44:00', 2.5, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:44:00', 1.4, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:44:00', 0.8, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:44:00', 1.0, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:44:00', 0.5, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:44:00', 0.0, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:44:00', 0.5, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:44:00', 1.5, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:44:00', 0.3, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:44:00', 0.5, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:44:00', 0.0, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:44:00', 1.7, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:44:00', 0.5, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:44:00', 0.5, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:44:00', 0.5, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:44:00', 0.0, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:44:00', 1.0, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:44:00', 0.5, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:44:00', 2.5, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:44:00', 0.3, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:44:00', 0.0, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:44:00', 2.6, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:44:00', 1.1, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:44:00', 1.1, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:44:00', 4.2, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:44:00', 1.1, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:44:00', 0.5, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:44:00', 0.0, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:44:00', 1.5, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:44:00', 0.6, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:44:00', 0.0, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:44:00', 1.7, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:44:00', 1.0, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:44:00', 1.0, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:44:00', 2.5, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:44:00', 0.5, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:44:00', 0.0, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:44:00', 1.0, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:44:00', 0.5, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:45:00', 0.5, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:45:00', 2.0, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:45:00', 2.3, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:45:00', 1.6, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:45:00', 0.5, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:45:00', 0.0, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:45:00', 0.5, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:45:00', 1.0, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:45:00', 0.0, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:45:00', 2.0, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:45:00', 0.3, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:45:00', 0.5, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:45:00', 2.6, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:45:00', 0.3, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:45:00', 0.5, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:45:00', 0.0, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:45:00', 0.5, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:45:00', 0.0, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:45:00', 0.5, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:45:00', 0.5, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:45:00', 2.5, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:45:00', 0.3, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:45:00', 2.2, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:45:00', 0.8, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:45:00', 0.5, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:45:00', 0.0, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:45:00', 1.0, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:45:00', 1.5, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:45:00', 1.0, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:45:00', 0.0, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:45:00', 1.0, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:45:00', 1.0, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:45:00', 1.2, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:45:00', 0.5, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:45:00', 0.5, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:45:00', 0.0, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:45:00', 0.5, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:45:00', 0.0, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:45:00', 0.5, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:45:00', 0.5, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:45:00', 0.0, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:45:00', 2.5, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:45:00', 1.2, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:45:00', 0.3, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:45:00', 1.0, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:45:00', 1.0, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:45:00', 0.0, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:45:00', 0.5, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:45:00', 0.0, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:45:00', 2.0, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:46:00', 0.6, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:46:00', 1.5, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:46:00', 1.4, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:46:00', 1.3, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:46:00', 2.8, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:46:00', 0.5, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:46:00', 0.0, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:46:00', 0.5, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:46:00', 1.5, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:46:00', 0.3, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:46:00', 1.0, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:46:00', 1.5, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:46:00', 1.5, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:46:00', 0.3, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:46:00', 0.5, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:46:00', 0.5, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:46:00', 0.5, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:46:00', 0.0, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:46:00', 0.0, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:46:00', 1.5, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:46:00', 0.5, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:46:00', 0.0, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:46:00', 1.8, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:46:00', 1.0, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:46:00', 0.0, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:46:00', 0.5, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:46:00', 1.0, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:46:00', 0.0, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:46:00', 0.0, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:46:00', 1.0, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:46:00', 0.0, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:46:00', 1.5, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:46:00', 1.5, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:46:00', 0.0, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:46:00', 4.0, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:46:00', 3.4, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:46:00', 4.4, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:46:00', 4.1, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:46:00', 4.1, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:46:00', 3.6, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:46:00', 4.1, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:46:00', 4.2, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:47:00', 5.5, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:47:00', 4.2, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:47:00', 4.0, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:47:00', 3.4, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:47:00', 1.9, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:47:00', 3.7, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:47:00', 3.6, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:47:00', 5.1, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:47:00', 3.7, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:47:00', 3.9, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:47:00', 4.7, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:47:00', 4.0, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:47:00', 4.1, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:47:00', 4.0, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:47:00', 3.6, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:47:00', 3.4, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:47:00', 3.2, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:47:00', 2.8, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:47:00', 3.9, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:47:00', 4.8, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:47:00', 5.2, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:47:00', 3.8, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:47:00', 4.1, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:47:00', 4.3, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:47:00', 4.4, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:47:00', 4.1, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:47:00', 4.2, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:47:00', 5.8, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:47:00', 3.6, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:47:00', 2.4, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:47:00', 1.2, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:47:00', 0.6, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:47:00', 0.0, 25.3, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:48:00', 1.0, 25.3, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:48:00', 0.0, 25.3, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:48:00', 2.0, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:48:00', 2.2, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:48:00', 1.4, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:48:00', 0.5, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:48:00', 0.5, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:48:00', 2.2, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:48:00', 0.2, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:48:00', 0.5, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:48:00', 0.0, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:48:00', 1.0, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:48:00', 0.0, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:48:00', 0.0, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:48:00', 0.5, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:48:00', 1.0, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:48:00', 0.5, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:48:00', 1.5, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:48:00', 0.8, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:48:00', 0.0, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:48:00', 1.0, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:48:00', 0.0, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:48:00', 1.0, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:48:00', 0.0, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:48:00', 1.5, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:48:00', 0.5, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:48:00', 1.5, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:48:00', 1.7, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:48:00', 1.4, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:48:00', 0.8, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:48:00', 0.0, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:48:00', 2.5, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:48:00', 1.6, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:48:00', 0.6, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:48:00', 0.0, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:48:00', 0.0, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:48:00', 1.0, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:48:00', 2.2, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:48:00', 0.5, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:48:00', 0.5, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:48:00', 0.0, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:48:00', 0.5, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:48:00', 0.0, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:48:00', 2.0, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:48:00', 0.6, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:48:00', 0.5, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:48:00', 0.0, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:48:00', 3.4, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:49:00', 1.6, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:49:00', 0.3, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:49:00', 0.5, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:49:00', 0.0, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:49:00', 0.5, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:49:00', 0.0, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:49:00', 0.5, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:49:00', 0.5, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:49:00', 0.5, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:49:00', 2.1, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:49:00', 0.8, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:49:00', 0.5, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:49:00', 4.3, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:49:00', 0.0, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:49:00', 1.0, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:49:00', 0.5, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:49:00', 0.5, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:49:00', 0.0, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:49:00', 0.5, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:49:00', 2.6, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:49:00', 0.6, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:49:00', 0.0, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:49:00', 1.0, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:49:00', 0.5, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:49:00', 0.5, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:49:00', 0.0, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:49:00', 0.5, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:49:00', 0.0, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:49:00', 1.0, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:49:00', 1.9, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:49:00', 0.5, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:49:00', 0.0, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:49:00', 0.5, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:49:00', 0.5, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:49:00', 1.5, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:49:00', 0.5, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:49:00', 1.5, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:49:00', 0.5, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:49:00', 0.5, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:49:00', 2.1, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:49:00', 0.5, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:49:00', 1.0, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:49:00', 0.0, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:49:00', 1.0, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:49:00', 0.5, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:49:00', 0.5, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:49:00', 0.0, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:49:00', 0.0, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:49:00', 1.0, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:49:00', 2.1, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:50:00', 0.0, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:50:00', 1.0, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:50:00', 1.0, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:50:00', 0.5, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:50:00', 2.0, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:50:00', 1.1, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:50:00', 0.3, 25.4, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:50:00', 1.5, 25.4, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 00:50:00', 1.4, 25.4, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 19:09:00', 7.7, 23.8, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 19:09:00', 0.5, 23.8, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 19:09:00', 1.0, 23.8, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 19:09:00', 1.5, 23.8, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 19:09:00', 0.5, 23.8, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 19:09:00', 0.0, 23.8, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 19:09:00', 0.5, 23.8, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 19:09:00', 2.9, 23.8, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 19:09:00', 0.5, 23.8, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 19:09:00', 1.5, 23.8, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 19:09:00', 2.2, 23.8, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 19:09:00', 0.5, 23.8, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 20:19:00', 12.1, 24.5, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 20:19:00', 1.0, 24.5, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 20:19:00', 1.0, 24.5, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 20:19:00', 0.5, 24.5, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 20:19:00', 0.5, 24.5, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 20:19:00', 0.5, 24.5, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 20:19:00', 1.0, 24.5, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 20:19:00', 0.5, 24.5, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 20:19:00', 0.5, 24.5, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 20:19:00', 0.0, 24.5, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 20:19:00', 2.6, 24.5, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 20:19:00', 0.6, 24.5, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 20:19:00', 0.5, 24.5, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 20:19:00', 0.5, 24.5, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 20:19:00', 0.5, 24.5, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 20:19:00', 2.0, 24.5, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 20:19:00', 0.0, 24.5, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 20:19:00', 2.0, 24.5, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 20:19:00', 0.3, 24.5, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 20:19:00', 0.5, 24.5, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 20:19:00', 2.4, 24.5, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 20:19:00', 0.6, 24.5, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 20:19:00', 2.0, 24.5, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 20:51:00', 11.3, 24.7, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 20:51:00', 0.3, 24.7, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 20:51:00', 1.0, 24.7, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 20:51:00', 1.0, 24.7, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 20:51:00', 0.5, 24.7, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 20:51:00', 0.0, 24.7, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 20:51:00', 0.5, 24.7, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 20:51:00', 0.5, 24.7, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 20:52:00', 1.0, 24.7, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 20:52:00', 1.0, 24.7, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 20:52:00', 2.7, 24.7, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 20:52:00', 0.8, 24.7, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 20:52:00', 0.5, 24.7, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-20 20:52:00', 2.9, 24.7, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-21 11:49:00', 6.5, 23.7, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-21 11:49:00', 0.6, 23.8, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-21 12:01:00', 14.6, 24.7, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-21 12:01:00', 0.5, 24.7, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-21 12:01:00', 1.5, 24.7, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-21 12:01:00', 0.7, 24.7, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-21 12:01:00', 0.5, 24.7, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-21 12:01:00', 2.0, 24.7, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-21 12:01:00', 1.0, 24.7, 0.7, 2);
INSERT INTO DadoComputador VALUES (default,'2024-10-21 12:01:00', 0.5, 24.7, 0.7, 3);
INSERT INTO DadoComputador VALUES (default,'2024-10-21 12:01:00', 0.5, 24.7, 0.7, 1);
INSERT INTO DadoComputador VALUES (default,'2024-10-21 12:01:00', 1.0, 24.7, 0.7, 2);
    
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
    CURDATE() - INTERVAL num DAY >= CURDATE() - INTERVAL 7 DAY; -- Garante que a data seja nos últimos 7 dia
