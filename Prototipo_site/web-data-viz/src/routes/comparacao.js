var express = require("express");
var router = express.Router();

var comparacaoController = require("../controllers/comparacaoController")

router.get('/alertas/:mes/:ano', function(req, res){
    comparacaoController.totalAlertas(req,res)
})

router.get('/alertasSetor/:fkSetor/:mes/:ano', function(req, res){
    comparacaoController.totalAlertasSetor(req,res)
})

router.get('/graficoSetor/:fkSetorGrafico/:mes/:ano', function(req, res){
    comparacaoController.exibirGraficoEleMesmo(req,res)
})

router.get('/graficosSetores/:mes/:ano', function(req, res){
    comparacaoController.exibirGraficoSetores(req,res)
})

router.get('/compararCPUeRAM/:setor', function(req,res){
    comparacaoController.graficoComparacaoCPueRam(req,res)
})

router.get('/predict', function(req, res){
    comparacaoController.totalAlertasPredict(req,res)
})

module.exports = router