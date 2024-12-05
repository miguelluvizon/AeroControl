var analistaModel = require("../models/analistaModel");

function estadoMaquinas(req, res) {
    analistaModel.estadoMaquinas().then(function (resultado) {
        res.status(200).json(resultado);
    }).catch(function (erro) {
        res.status(500).json(erro.sqlMessage);
    })
}

function estadoSetor(req, res) {
    analistaModel.estadoSetor().then(function (resultado) {
        res.status(200).json(resultado);
    }).catch(function (erro) {
        res.status(500).json(erro.sqlMessage);
    })
}

module.exports = {
    estadoMaquinas,
    estadoSetor
}