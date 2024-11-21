var comparacaoModel = require("../models/comparacaoModel.js")

function totalAlertas(req, res) {
    comparacaoModel.totalAlertas()
        .then(result => res.status(200).json(result))
        .catch(e => {
            console.error('Erro ao capturar o total de alertas', e.sqlMessage)
            res.status(500).json(e.sqlMessage)
        })
}

function totalAlertasSetor(req, res) {
    const { fkSetor } = req.params

    comparacaoModel.totalAletasSetor(fkSetor)
        .then(result => res.status(200).json(result))
        .catch(e => {
            console.error("Erro ao obter o total de alertas no setor" + e.sqlMessage)
            res.status(500).json(sqlMessage)
        })
}

function exibirGraficoEleMesmo(req, res) {
    const { fkSetorGrafico } = req.params

    comparacaoModel.exibirGraficoEleMesmo(fkSetorGrafico)
        .then(result => res.status(200).json(result))
        .catch(e => {
            console.error("Erro ao obter os alertas da semana do mês do setor" + e.sqlMessage)
            res.status(500).json(sqlMessage)
        })
}

function exibirGraficoSetores(req,res){
    comparacaoModel.exibirGraficoSetores()
        .then(result => res.status(200).json(result))
        .catch(e => {
            console.error("Erro ao obter os alertas da semana do mês do setor" + e.sqlMessage)
            res.status(500).json(sqlMessage)
        })
}

function graficoComparacaoCPueRam(req, res){
    const { setor } = req.params

    comparacaoModel.graficoComparacaoCPueRam(setor)
    .then(result => res.status(200).json(result))
    .catch(e => {
        console.error("Erro ao obter as médias da semana do setor" + e.sqlMessage)
        res.status(500).json(sqlMessage)
    })

}

module.exports = {
    totalAlertas,
    totalAlertasSetor,
    exibirGraficoEleMesmo,
    exibirGraficoSetores,
    graficoComparacaoCPueRam
}