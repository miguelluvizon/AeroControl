var wordModel = require("../models/wordModel.js");

function graficoCloud(req,res){
    wordModel.cloud()
    .then(result => res.status(200).json(result))
    .catch(e => {
        console.error('Erro ao capturar o web crawler', e.sqlMessage)
        res.status(500).json(e.sqlMessage)
    })
}


module.exports = {
    graficoCloud
}