var express = require("express");
var router = express.Router();

var analistaController = require("../controllers/analistaController");

router.get("/estadoMaquinas", function (req, res) {
    analistaController.estadoMaquinas(req, res);
  });

module.exports = router;
