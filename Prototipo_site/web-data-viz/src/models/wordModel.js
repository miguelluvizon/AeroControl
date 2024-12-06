var database = require("../database/config");

function cloud(){
    const instrucao = `
    SELECT palavra, COUNT(*) AS frequencia  
    FROM (
        SELECT clima AS palavra FROM webCrawler
    ) AS palavras
    GROUP BY palavra
    ORDER BY frequencia DESC;
`;

    return database.executar(instrucao)
}

module.exports = {
    cloud
};
