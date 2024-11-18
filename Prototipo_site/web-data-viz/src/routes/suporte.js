var express = require("express");
var router = express.Router();

var suporteController = require("../controllers/suporteController");

router.post("/cadastrar", function (req, res) {
  suporteController.cadastrar(req, res);
})

router.get("/plotar", function (req, res) {
  // função a ser chamada quando acessar /suporte/plotar
  suporteController.plotar(req, res);
});

router.post("/getSetor", function (req, res) {
  suporteController.getSetor(req, res);
})

module.exports = router;