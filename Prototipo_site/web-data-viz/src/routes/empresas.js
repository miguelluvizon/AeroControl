var express = require("express");
var router = express.Router();

var empresaController = require("../controllers/empresaController");

//Recebendo os dados do html e direcionando para a função cadastrar de usuarioController.js
router.post("/cadastrar", function (req, res) {
    empresaController.cadastrar(req, res);
})

router.get("/buscar", function (req, res) {
    empresaController.buscarPorCnpj(req, res);
});

router.get("/buscar/:id", function (req, res) {
  empresaController.buscarPorId(req, res);
});

router.get("/listar", function (req, res) {
  empresaController.listar(req, res);
});

router.post("/getEmpresas", function (req, res) {
  empresaController.getEmpresas(req, res);
})

router.get("/puxarAlertas/:setor", function (req, res) { // rota luvizones
  empresaController.puxarAlertas(req, res);
})

router.get("/puxarAlertasCriticos/:setor/:componente", function (req, res) { // rota luvizones
  empresaController.puxarAlertasCriticos(req, res);
})

router.get("/puxarTotalMaquinas/:setor", function (req, res) { // rota luvizones
  empresaController.puxarTotalMaquinas(req, res);
})

router.get("/puxarMediaTotal/:setor", function (req, res) { // rota luvizones
  empresaController.puxarMediaTotal(req, res);
})

router.get("/rankearAlertasTotais/:componente/:setor", function (req, res) { // rota luvizones
  empresaController.rankearAlertasTotais(req, res);
})

router.get("/rankearMaquinasCriticas/:setor", function (req, res) { // rota luvizones
  empresaController.rankearMaquinasCriticas(req, res);
})



module.exports = router;