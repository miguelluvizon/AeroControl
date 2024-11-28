var express = require("express");
var router = express.Router();

var suporteArthurController = require("../controllers/suporteArthurController");

router.get("/ultimas/:idAquario", function (req, res) {
    suporteArthurController.buscarUltimasMedidas(req, res);
});
router.get("/tempo-real/:idAquario", function (req, res) {
    suporteArthurController.buscarMedidasEmTempoReal(req, res);
})

module.exports = router;
