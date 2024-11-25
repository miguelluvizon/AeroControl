var comparacaoModel = require("../models/comparacaoModel.js")

function totalAlertas(req, res) {
    const { mes, ano } = req.params

    comparacaoModel.totalAlertas(mes, ano)
        .then(result => res.status(200).json(result))
        .catch(e => {
            console.error('Erro ao capturar o total de alertas', e.sqlMessage)
            res.status(500).json(e.sqlMessage)
        })
}

function totalAlertasSetor(req, res) {
    const { fkSetor, mes, ano } = req.params

    comparacaoModel.totalAletasSetor(fkSetor, mes, ano)
        .then(result => res.status(200).json(result))
        .catch(e => {
            console.error("Erro ao obter o total de alertas no setor" + e.sqlMessage)
            res.status(500).json(sqlMessage)
        })
}

function totalAlertasPredict(req, res){
    comparacaoModel.totalAlertasPredict()
    .then(result => res.status(200).json(result))
    .catch(e => {
        console.error("Erro ao obter o total de alertas no setor" + e.sqlMessage)
        res.status(500).json(sqlMessage)
    })
}

function exibirGraficoEleMesmo(req, res) {
    const { fkSetorGrafico, mes, ano } = req.params

    comparacaoModel.exibirGraficoEleMesmo(fkSetorGrafico, mes, ano)
        .then(result => res.status(200).json(result))
        .catch(e => {
            console.error("Erro ao obter os alertas da semana do mês do setor" + e.sqlMessage)
            res.status(500).json(sqlMessage)
        })
}

function exibirGraficoSetores(req,res){
    const { mes, ano} = req.params

    comparacaoModel.exibirGraficoSetores(mes, ano)
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
    totalAlertasPredict,
    exibirGraficoEleMesmo,
    exibirGraficoSetores,
    graficoComparacaoCPueRam
}