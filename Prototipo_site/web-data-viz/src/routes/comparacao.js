var express = require("express");
var router = express.Router();

var comparacaoController = require("../controllers/comparacaoController")

router.get('/alertas', function(req, res){
    comparacaoController.totalAlertas(req,res)
})

router.get('/alertasSetor/:fkSetor', function(req, res){
    comparacaoController.totalAlertasSetor(req,res)
})

router.get('/graficoSetor/:fkSetorGrafico', function(req, res){
    comparacaoController.exibirGraficoEleMesmo(req,res)
})

router.get('/graficosSetores', function(req, res){
    comparacaoController.exibirGraficoSetores(req,res)
})

router.get('/compararCPUeRAM/:setor', function(req,res){
    comparacaoController.graficoComparacaoCPueRam(req,res)
})

module.exports = router