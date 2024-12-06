var express = require("express");
var router = express.Router();

var suporteController = require("../controllers/suporteController");

router.post("/cadastrar", function (req, res) {
  suporteController.cadastrar(req, res);
})

router.get("/getDados/:maquina", function (req, res) {
  suporteController.getDados(req, res);
});

router.get("/getDadosNovos/:maquina", function (req, res) {
  suporteController.getDadosNovos(req, res);
});

router.post("/getSetor", function (req, res) {
  suporteController.getSetor(req, res);
})

router.post("/getInformacoes/:maquina", function (req, res) {
  suporteController.getInformacoes(req, res);
})

module.exports = router;